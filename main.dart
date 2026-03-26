import 'StudentManager.dart';
import 'dart:io';

void main() {
  List<StudentManager> students = [];
  print("Hello in Student Manager");

  while (true) {
    print("""\n
-----------------------------------
      Student Manager Menu
-----------------------------------
[1] Add new student
[2] Show list of students
[3] Change grade
[4] Remove student
[0] Exit
-----------------------------------
Enter your choice:""");
    String? inputUser = stdin.readLineSync();
    if (inputUser == '1') {
      _addStudent(students);
    } else if (inputUser == '2') {
      _showListStudent(students);
    } else if (inputUser == '3') {
      _changeGrade(students);
    } else if (inputUser == '0') {
      break;
    } else if (inputUser == '4') {
      _removeStudent(students);
    } else {
      print("Please enter number True!");
    }
  }
}

//===== ADD STUDENT=============
void _addStudent(List<StudentManager> students) {
  stdout.write("enter full name to Student: ");
  String? fullNameStudent = stdin.readLineSync();
  if (fullNameStudent != null && fullNameStudent.isNotEmpty) {
    print("Entering Succeess");
  } else {
    print("Please enter the name student true");
    return;
  }
  stdout.write("enter to number Student: ");
  //Enter number
  String? inputNumberStudent = stdin.readLineSync();
  int? numberStudent;
  if (inputNumberStudent != null && inputNumberStudent.isNotEmpty) {
    numberStudent = int.tryParse(inputNumberStudent);
    if (numberStudent == null) {
      print("Please enter a valid integer for student number");
      return;
    }
  } else {
    print("Please enter the student number");
    return;
  }
  //add grade
  stdout.write("enter grade: ");
  String? inputGrade = stdin.readLineSync();
  double? grade;
  if (inputGrade != null && inputGrade.isNotEmpty) {
    grade = double.tryParse(inputGrade);
    if (grade == null) {
      print("Please enter a valid number for grade");
      return;
    }
  } else {
    print("Please enter the grade");
    return;
  }
  if (grade >= 0 && grade <= 20) {
    students.add(
      StudentManager(
        fullName: fullNameStudent,
        numberStudent: numberStudent,
        grade: grade,
      ),
    );
    print("Add Succeess");
  } else {
    print("Add failed!");
    print("please enter grade between (0-20)");
  }
}

void _showListStudent(List<StudentManager> students) {
  if (students.isEmpty) {
    print("""\n
-----------------------------------
           List is empty!
-----------------------------------""");
    return;
  }
  print("""
-----------------------------------
           Students List
-----------------------------------""");
  for (int i = 0; i < students.length; i++) {
    print("ID: ${students[i].numberStudent} | Name: ${students[i].fullName} | Grade: ${students[i].grade}");
  }
  print("-----------------------------------");
}

// =====Change GREADE===========
void _changeGrade(List<StudentManager> students) {
  stdout.write("enter number student: ");
  String? inputNumberStudent = stdin.readLineSync();
  int? numberGrade = int.tryParse(inputNumberStudent ?? "");
  if (numberGrade != null && numberGrade >= 0) {
    bool found = false;
    for (var student in students) {
      if (numberGrade == student.numberStudent) {
        found = true;
        print("enter new Grade: ");
        String? inputNewGrade = stdin.readLineSync();
        double? newGrade = double.tryParse(inputNewGrade ?? "");
        if (newGrade != null && newGrade >= 0 && newGrade <= 20) {
          student.grade = newGrade;
        } else {
          print("Change failed!");
        }
      }
    }
    if (!found) print("Student not found!");
  }
}

//======REMOVE========
void _removeStudent(List<StudentManager> students) {
  if (students.isEmpty) {
    print("List is empty");
    return;
  }

  stdout.write("enter number Student to romove: ");
  String? inputStudentToRemove = stdin.readLineSync();
  final numberStudentToRemove = int.tryParse(inputStudentToRemove ?? "");
  if (numberStudentToRemove != null && numberStudentToRemove >= 0) {
    final before = students.length;
    students.removeWhere((s) => s.numberStudent == numberStudentToRemove);
    if (students.length == before) {
      print("not found!");
    } else {
      print("Remove complete");
    }
  }
}
