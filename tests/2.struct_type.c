int printf(char*, ...);

struct Employee {
  char* name;
  char sex;
  int id;
  unsigned int age;
  float salary;
};

int main() {
  int err = 0;
  Employee employee;
  employee.name = "employee";
  employee.sex = 'M';
  employee.id = 100;
  employee.age = 22;
  employee.salary = 3000.0;

  int id = employee.id;
  int sex = employee.sex;
  int age = employee.age;
  if (id != 100) err = 1;
  if (sex != 'M') err = 1;
  if (age != 22) err = 1;

  employee.age = 0;
  age = employee.age;
  if (age != 0) err = 1;

  if (err == 0) {
    printf("2.struct_type.c PASS\n");
  } else {
    printf("2.struct_type.c FAIL\n");
  }
  return err;
}
