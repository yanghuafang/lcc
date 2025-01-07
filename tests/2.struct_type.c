int printf(char*, ...);

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
  return 0;
}
