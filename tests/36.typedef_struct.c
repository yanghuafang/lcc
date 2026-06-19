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

void fill_employee(EmployeePtr employee, int id, char sex) {
  employee->id = id;
  employee->sex = sex;
}

int main() {
  int err = 0;
  Employee worker;
  EmployeePtr workerPtr;
  Point origin;
  int sz;
  int id;
  int sex;
  unsigned long len;

  worker.sex = 'M';
  workerPtr = &worker;
  fill_employee(workerPtr, 11, 'F');

  origin.x = 3;
  origin.y = 4;

  sz = sizeof(Employee);
  if (sz != 8) err = 1;
  sz = sizeof(EmployeePtr);
  if (sz != 8) err = 1;
  sz = sizeof(Point);
  if (sz != 8) err = 1;
  sz = sizeof(size_t);
  if (sz != 8) err = 1;

  len = strlen("hi");
  if (len != 2) err = 1;

  id = worker.id;
  if (id != 11) err = 1;
  id = workerPtr->id;
  if (id != 11) err = 1;
  sex = workerPtr->sex;
  if (sex != 'F') err = 1;
  id = origin.x;
  if (id != 3) err = 1;
  sex = origin.y;
  if (sex != 4) err = 1;

  if (err == 0) {
    printf("36.typedef_struct.c PASS\n");
  } else {
    printf("36.typedef_struct.c FAIL\n");
  }
  return err;
}
