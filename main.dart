import 'StudentManager.dart';
import 'dart:io';

void main() {
  List<Studentmanager> Students = [];
  print("Hello in Student Manager");

  while (true) {
    print("""\nEnter number 1 to add new student,
      \n enter 2 to show list students,
      \n enter 3 to change grade\n
      \n enter 4 to remove student\n
      enter 0 to exit""");
    String? inputUser = stdin.readLineSync();
    if (inputUser == '1') {
      _addStudent(Students);
      print("Enter successfully");
    } else if (inputUser == '2') {
      _showListStudent(Students);
    } else if (inputUser == '3') {
      _changeGrade(Students);
    } else if (inputUser == '0') {
      break;
    } else if (inputUser == '4') {
      _removeStudent(Students);
    } else {
      print("Please enter number True!");
    }
  }
}

//===== ADD STUDENT=============
void _addStudent(List<Studentmanager> Students) {
  stdout.write("enter full name to Student: ");
  String? fullNameStudent = stdin.readLineSync();
  if (fullNameStudent != null && fullNameStudent.isNotEmpty) {
    print("Entering Succeess");
  } else {
    print("Please enter the name student true");
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
    Students.add(
      Studentmanager(
        fullName: fullNameStudent!,
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

void _showListStudent(List<Studentmanager> Students) {
  if (Students.isEmpty) {
    print("List is empty");
    return;
  }
  for (int i = 0; i < Students.length; i++) {
    print(
      "Student number:${Students[i].numberStudent},Fullname:${Students[i].fullName},Grade:${Students[i].grade}",
    );
  }
}

// =====Change GREADE===========
void _changeGrade(List<Studentmanager> Students) {
  stdout.write("enter number student: ");
  String? inputNumberStudent = stdin.readLineSync();
  int? numberGrade = int.tryParse(inputNumberStudent ?? "");
  if (numberGrade != null && numberGrade >= 0) {
    // ignore: unused_local_variable
    bool found = false;
    for (var student in Students) {
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
  }
}

//======REMOVE========
void _removeStudent(List<Studentmanager> Students) {
  if (Students.isEmpty) {
    print("List is empty");
    return;
  }

  stdout.write("enter number Student to romove: ");
  String? inputStudentToRemove = stdin.readLineSync();
  final numberStudentToRemove = int.tryParse(inputStudentToRemove ?? "");
  if (numberStudentToRemove != null && numberStudentToRemove >= 0) {
    final before = Students.length;
    Students.removeWhere((s) => s.numberStudent == numberStudentToRemove);
    if (Students.length == before) {
      print("not found!");
    } else {
      print("Remove complete");
    }
  }
}
