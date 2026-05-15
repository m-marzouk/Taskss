class Person {
  String name;
  int _age;

  Person(this.name, this._age);

  int get age => _age;

  set age(int value) {
    if (value > 0) {
      _age = value;
    }
  }
}

class University {
  static String universityName = "Sohag University";
}

class Employee extends Person {
  double salary;
  Employee(String name, int age, this.salary) : super(name, age);

  void showInfo() {
    print("University: ${University.universityName}");
    print("Name: $name");
    print("Age: $age");
    print("Salary: $salary");
  }
}

abstract class Skills {
  void programming();
  void communication();
}

class Developer extends Employee implements Skills {
  Developer(String name, int age, double salary) : super(name, age, salary);

  @override
  void programming() {
    print("Programming skill: Dart developer");
  }

  @override
  void communication() {
    print("Communication skill: Good team communication");
  }
}

void main() {
  Developer dev = Developer("Mohammed", 22, 12000);

  dev.showInfo();
  dev.programming();
  dev.communication();

  print("University: ${University.universityName}");
}
