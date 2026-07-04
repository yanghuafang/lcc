#!/bin/bash

# remote-ubuntu.sh — run any of the scripts here on the Ubuntu box.
#
# lcc claims macOS and Ubuntu, but a working copy only ever sits on one of
# them. Rather than push a branch and wait for CI to disagree, this runs a
# command on the Linux host, optionally mirroring the current tree --
# uncommitted edits included -- first, so the Ubuntu half of that claim is
# checkable in the same minute the edit is made.
#
#   ./remote-ubuntu.sh ./build-lcc.sh --debug          # run, against what is there
#   ./remote-ubuntu.sh --sync ./build-lcc.sh --debug   # copy the tree first, then run
#   ./remote-ubuntu.sh --sync                          # copy the tree and stop
#   ./remote-ubuntu.sh --clone ./build-lcc.sh          # clone from GitHub, then run
#   ./remote-ubuntu.sh --clone                         # clone from GitHub and stop
#
# Copying is opt-in rather than the default because it is the only step that
# destroys anything: it runs rsync --delete against the remote checkout, so
# whatever is there is made to match this machine exactly. A command that only
# reads or builds should not have to think about that.
#
# --sync and --clone answer the same question -- where does the remote tree
# come from -- with different answers, so asking for both is a contradiction
# rather than a sequence, and is refused. --sync sends what is on this machine,
# uncommitted work and all; --clone fetches what is pushed to GitHub, which is
# the honest way to check that what was committed is what actually builds.
#
# The command runs in the remote scripts/ directory, because that is where
# every other script here expects to be run from. --shell runs from the remote
# repo root instead, for one-off probes that are not scripts.
#
# The remote path mirrors the local one by default, so the sibling build
# directory build-env.sh derives (../../lcc-build) lands in the same place
# relative to the checkout on both hosts, and nothing has to be told twice.

set -euo pipefail

REMOTE_HOST="${LCC_REMOTE_HOST:-yanghuafang@192.168.10.13}"
REMOTE_DIR="${LCC_REMOTE_DIR:-study-projects/lcc}"
REPO_URL="${LCC_REPO_URL:-https://github.com/yanghuafang/lcc.git}"

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

usage() {
  cat <<'EOF'
Usage: remote-ubuntu.sh [--sync | --clone] [--shell] [command ...]

Run a command on the Ubuntu host, optionally putting a tree there first.

  remote-ubuntu.sh ./run-tests.sh           Run; do not copy anything.
  remote-ubuntu.sh --sync ./run-tests.sh    Copy this tree over, then run.
  remote-ubuntu.sh --sync                   Copy this tree over and stop.
  remote-ubuntu.sh --clone ./run-tests.sh   Clone from GitHub, then run.
  remote-ubuntu.sh --clone                  Clone from GitHub and stop.

Options:
  --sync      Mirror this working tree to the host before running. This is
              rsync --delete: the remote checkout is made to match this one,
              so anything edited only on the host is lost.
  --clone     git clone the repository onto the host instead. Refuses to
              overwrite an existing checkout. Mutually exclusive with --sync:
              one sends what is on this machine, the other fetches what was
              pushed.
  --shell     Run the command from the repo root rather than scripts/, and
              treat it as shell text rather than a list of arguments.
  -h, --help  Show this help.

Environment:
  LCC_REMOTE_HOST  user@host to reach (default: yanghuafang@192.168.10.13).
  LCC_REMOTE_DIR   Checkout path on the host, relative to its home directory
                   (default: study-projects/lcc, mirroring the macOS layout).
                   --sync deletes whatever else lives there, so give it a path
                   of its own.
  LCC_REPO_URL     What --clone clones
                   (default: https://github.com/yanghuafang/lcc.git). Set it to
                   git@github.com:yanghuafang/lcc.git to clone over ssh, which
                   uses the forwarded agent from this machine.
EOF
}

do_sync=false
do_clone=false
from_root=false

while [[ $# -gt 0 ]]; do
  case "$1" in
    --sync)    do_sync=true; shift ;;
    --clone)   do_clone=true; shift ;;
    --shell)   from_root=true; shift ;;
    -h|--help) usage; exit 0 ;;
    --)        shift; break ;;
    *)         break ;;
  esac
done

if [[ "$do_sync" == true ]] && [[ "$do_clone" == true ]]; then
  echo "--sync and --clone are mutually exclusive: one sends this working" >&2
  echo "tree, the other fetches what is pushed to GitHub. Pick one." >&2
  exit 1
fi

# Nothing to run and nothing to put there is a mistake worth naming, rather
# than a silent success. Checked before any transfer so a typo costs nothing.
if [[ $# -eq 0 ]] && [[ "$do_sync" == false ]] && [[ "$do_clone" == false ]]; then
  echo "Nothing to do: give a command, or --sync/--clone to place a tree." >&2
  usage >&2
  exit 1
fi

if [[ "$do_clone" == true ]]; then
  # git clone into an existing directory fails anyway, but it fails after the
  # connection with a message about the destination not being empty. Checking
  # first says the useful thing instead: which directory, and what to do. It is
  # deliberately not resolved by deleting anything -- that checkout may be the
  # only copy of something.
  if ssh "${REMOTE_HOST}" "[ -e ${REMOTE_DIR} ]"; then
    echo "${REMOTE_HOST}:${REMOTE_DIR} already exists; refusing to clone over it." >&2
    echo "Remove it on the host, or point LCC_REMOTE_DIR somewhere else." >&2
    exit 1
  fi
  echo "Cloning ${REPO_URL} -> ${REMOTE_HOST}:${REMOTE_DIR}/"
  # -A forwards this machine's SSH agent. It does nothing for the https URL
  # above, and is here for the ssh form: set LCC_REPO_URL to
  # git@github.com:yanghuafang/lcc.git and the key that already reaches GitHub
  # from this machine authenticates the clone, so the host needs no key of its
  # own. It carries the usual caveat -- while connected, the host can use this
  # agent -- which is why it is scoped to the clone and not the whole script.
  if ! ssh -A "${REMOTE_HOST}" \
      "mkdir -p \"\$(dirname '${REMOTE_DIR}')\" && git clone '${REPO_URL}' '${REMOTE_DIR}'"; then
    echo "" >&2
    echo "Clone failed. Two failures have been seen here, with different fixes:" >&2
    echo "  'Could not connect to server' on port 443 -- this host's route to" >&2
    echo "  github.com over https; retry, or use the ssh URL via LCC_REPO_URL." >&2
    echo "  'Permission denied (publickey)' -- the ssh URL with no key in the" >&2
    echo "  forwarded agent; run 'ssh-add' here, then check with 'ssh-add -l'." >&2
    exit 1
  fi
fi

if [[ "$do_sync" == true ]]; then
  echo "Syncing ${repo_root}/ -> ${REMOTE_HOST}:${REMOTE_DIR}/"
  # --delete so a file deleted locally does not linger and keep building
  # remotely. The exclusions are the things that must not cross: .git (the Mac
  # is the source of truth for history), the editor and tool state, and the
  # generated lexer/parser, which CMake regenerates from the local flex/bison
  # on whichever host it configures.
  ssh "${REMOTE_HOST}" "mkdir -p ${REMOTE_DIR}"
  rsync -az --delete \
    --exclude '.git/' \
    --exclude '.claude/' \
    --exclude '.cache/' \
    --exclude 'src/generated/' \
    --exclude '.DS_Store' \
    --exclude '._*' \
    "${repo_root}/" "${REMOTE_HOST}:${REMOTE_DIR}/"
fi

# --sync or --clone with no command is the "just put it there" case.
if [[ $# -eq 0 ]]; then
  exit 0
fi

if [[ "$from_root" == true ]]; then
  remote_cwd="${REMOTE_DIR}"
else
  remote_cwd="${REMOTE_DIR}/scripts"
fi

# Two different things are being sent, and they need opposite treatment.
# A command is a list of arguments: %q escapes each one so a path with a space
# survives the two shells this crosses. --shell is a snippet the caller wrote
# to be interpreted -- its semicolons and pipes are the point -- so quoting it
# would turn the whole line into one nonexistent filename.
if [[ "$from_root" == true ]]; then
  remote_cmd="$*"
else
  remote_cmd="$(printf '%q ' "$@")"
fi

# Ask for a remote TTY only when there is a local one to mirror, so a build run
# from a terminal keeps its progress output live, and one run from a script or
# an agent does not open with ssh complaining that stdin is not a terminal.
tty_flag=()
if [[ -t 0 ]]; then
  tty_flag=(-t)
fi

# A login shell, so the command starts from the PATH the host's profile builds.
# `ssh host cmd` runs a shell that is neither login nor interactive: the profile
# is never read, and Ubuntu's stock ~/.bashrc returns on its first line for
# exactly that case. Nothing here needs more than what is left today -- apt puts
# cmake, flex and bison in /usr/bin, and build-env.sh prepends LLVM 20's own
# directory -- so this is for the toolchain installed under /snap/bin or
# ~/.local/bin instead, which would otherwise fail as "command not found".
#
# The +"..." guard is for the empty case: macOS still ships bash 3.2, where
# expanding an empty array under `set -u` is an unbound-variable error rather
# than nothing at all.
exec ssh ${tty_flag[@]+"${tty_flag[@]}"} "${REMOTE_HOST}" \
  "bash -lc 'cd ${remote_cwd} && ${remote_cmd}'"
