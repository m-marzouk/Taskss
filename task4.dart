void main() {
  Set<String> students = {};

  addStudent(students, "Ahmed");
  addStudent(students, "Mohamed");
  addStudent(students, "Ali");

  print("Students (recursive):");
  printStudents(students.toList(), 0);

  print("\nStudents (forEach lambda):");
  students.forEach((student) => print(student));

  Set<String> newStudents = {"Omar", "Hassan"};

  Set<String> mergedStudents = {...students, ...newStudents};

  print("\nMerged Students:");
  print(mergedStudents);

  Map<String, List<int>> studentGrades = {};

  addCourse(studentGrades, "Ahmed", "Math", grade: 80);
  addCourse(studentGrades, "Ahmed", "Physics", grade: 90);
  addCourse(studentGrades, "Ahmed", "Programming", grade: 100);

  addCourse(studentGrades, "Ali", "Math", grade: 70);
  addCourse(studentGrades, "Ali", "Physics", grade: 75);

  print("\nStudent Grades Map:");
  print(studentGrades);

  print("\nAverage grade for Ahmed:");
  print(averageGrade(studentGrades, "Ahmed"));
}

void addStudent(Set<String> students, String name) {
  students.add(name);
}

void printStudents(List<String> students, int index) {
  if (index >= students.length) return;

  print(students[index]);
  printStudents(students, index + 1);
}

void addCourse(
  Map<String, List<int>> map,
  String studentName,
  String courseName, {
  int grade = 0,
}) {
  map.putIfAbsent(studentName, () => []);
  map[studentName]!.add(grade);
}

double averageGrade(Map<String, List<int>> map, String studentName) {
  List<int>? grades = map[studentName];

  if (grades == null || grades.isEmpty) return 0;

  int sum = grades.reduce((a, b) => a + b);
  return sum / grades.length;
}
