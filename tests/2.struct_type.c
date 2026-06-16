int printf(char*, ...);

int test_errors = 0;

void check_int(const char* name, int actual, int expected) {
  if (actual != expected) {
    printf("ERROR [%s]: got %d expected %d\n", name, actual, expected);
    test_errors++;
  }
}

void check_char(const char* name, char actual, char expected) {
  if (actual != expected) {
    printf("ERROR [%s]: got %c expected %c\n", name, actual, expected);
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

struct Employee {
  char* name;
  char sex;
  int id;
  unsigned int age;
  float salary;
};

void derefStruct(Employee* employee) {
  printf("deref struct...\n");
  printf("\tname: %s\n", employee->name);
  printf("\tsex: %c\n", employee->sex);
  printf("\tid: %d\n", employee->id);
  printf("\tage: %u\n", employee->age);
  printf("\tsalary: %f\n", employee->salary);
}

void derefPointer(Employee* employee) {
  printf("deref pointer...\n");
  printf("\tname: %s\n", (*employee).name);
  printf("\tsex: %c\n", (*employee).sex);
  printf("\tid: %d\n", (*employee).id);
  printf("\tage: %u\n", (*employee).age);
  printf("\tsalary: %f\n", (*employee).salary);
}

int main() {
  printf("**** 2.struct_type.c ****\n");

  Employee employee;
  employee.name = "employee";
  employee.sex = 'M';
  employee.id = 100;
  employee.age = 22;
  employee.salary = 3000.0;

  printf("Employee ref...\n");
  printf("\tname: %s\n", employee.name);
  printf("\tsex: %c\n", employee.sex);
  printf("\tid: %d\n", employee.id);
  printf("\tage: %u\n", employee.age);
  printf("\tsalary: %f\n", employee.salary);

  derefStruct(&employee);
  derefPointer(&employee);

  check_int("id", employee.id, 100);
  check_char("sex", employee.sex, 'M');
  check_int("age", (int)employee.age, 22);

  employee.age = 0;
  check_int("age boundary zero", (int)employee.age, 0);

  report_result();
  return test_errors;
}
