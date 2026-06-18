int printf(char*, ...);

typedef unsigned long size_t;

struct Employee {
  int id;
  char sex;
};

typedef struct Employee Employee;
typedef struct Employee* EmployeePtr;

typedef struct Point {
  int x;
  int y;
} Point;

void* malloc(size_t size);
unsigned long strlen(const char* s);

int test_errors = 0;

void check_int(const char* name, int actual, int expected) {
  if (actual != expected) {
    printf("ERROR [%s]: got %d expected %d\n", name, actual, expected);
    test_errors++;
  }
}

void check_ulong(const char* name, unsigned long actual, unsigned long expected) {
  if (actual != expected) {
    printf("ERROR [%s]: got %lu expected %lu\n", name, actual, expected);
    test_errors++;
  }
}

void report_result(void) {
  if (test_errors == 0) {
    printf("PASS\n");
  } else {
    printf("FAIL: %d error(s)\n", test_errors);
  }
}

void fill_employee(EmployeePtr employee, int id, char sex) {
  employee->id = id;
  employee->sex = sex;
}

int main() {
  Employee worker;
  EmployeePtr workerPtr;
  Point origin;

  printf("**** 36.typedef_struct.c ****\n");

  worker.sex = 'M';
  workerPtr = &worker;
  fill_employee(workerPtr, 11, 'F');

  origin.x = 3;
  origin.y = 4;

  unsigned long len_hi = strlen("hi");

  check_int("sizeof(Employee)", sizeof(Employee), 8);
  check_int("sizeof(EmployeePtr)", sizeof(EmployeePtr), 8);
  check_int("sizeof(Point)", sizeof(Point), 8);
  check_ulong("sizeof(size_t)", sizeof(size_t), 8);
  check_ulong("strlen_hi", len_hi, 2);

  check_int("worker.id", worker.id, 11);
  check_int("workerPtr->id", workerPtr->id, 11);
  check_int("workerPtr->sex", workerPtr->sex, 'F');
  check_int("origin.x", origin.x, 3);
  check_int("origin.y", origin.y, 4);

  report_result();
  return test_errors;
}
