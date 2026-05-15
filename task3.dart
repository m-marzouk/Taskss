import 'dart:io';

void main() {
  List<String> studentNames = [];
  List<List<double>> studentGrades = [];

  print("Enter number of students:");
  int numStudents = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < numStudents; i++) {
    print("\nEnter name of student ${i + 1}:");
    String name = stdin.readLineSync()!;
    studentNames.add(name);

    print("Enter number of subjects:");
    int numSubjects = int.parse(stdin.readLineSync()!);

    List<double> grades = [];

    for (int j = 0; j < numSubjects; j++) {
      print("Enter grade for subject ${j + 1}:");
      double grade = double.parse(stdin.readLineSync()!);
      grades.add(grade);
    }

    studentGrades.add(grades);
  }

  while (true) {
    print("\n MENU ");
    print("1. Show All Results");
    print("2. Search Student");
    print("3. Exit");

    int choice = int.parse(stdin.readLineSync()!);

    if (choice == 1) {
      for (int i = 0; i < studentNames.length; i++) {
        double sum = 0;

        for (double g in studentGrades[i]) {
          sum += g;
        }

        double avg = sum / studentGrades[i].length;

        String grade;

        if (avg >= 90) {
          grade = "A";
        } else if (avg >= 80) {
          grade = "B";
        } else if (avg >= 70) {
          grade = "C";
        } else {
          grade = "F";
        }

        print(
          "${studentNames[i].toUpperCase()} | Average: ${avg.toStringAsFixed(2)} | Grade: $grade",
        );
      }
    } else if (choice == 2) {
      print("Enter student name:");
      String search = stdin.readLineSync()!;

      int index = studentNames.indexOf(search);

      if (index != -1) {
        double sum = 0;

        for (double g in studentGrades[index]) {
          sum += g;
        }

        double avg = sum / studentGrades[index].length;

        print("Average grade for ${search}: ${avg.round()}");
      } else {
        print("Student not found.");
      }
    } else if (choice == 3) {
      print("Program terminated.");
      break;
    } else {
      print("Invalid choice. Try again.");
    }
  }
}
