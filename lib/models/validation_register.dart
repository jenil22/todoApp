//validation for register form
import 'package:flutter/cupertino.dart';
import 'package:drift/drift.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/student_model.dart';
import 'package:todo_app/moor_database/moor_database.dart';

class ValidationRegister {
  //validation for first name
  String? changeFirstName(String value) {
    if (value == '') {
      return 'First Name is required';
    } else if (value.length <= 3) {
      return 'Must Be at least 3 character';
    } else {
      return null;
    }
  }

  //validation for last name
  String? changeLastName(String value) {
    if (value == '') {
      return 'Last Name is required';
    } else if (value.length <= 3) {
      return 'Must Be at least 3 character';
    } else {
      return null;
    }
  }

  //validation for user name
  String? changeUserName(String value) {
    if (value == '') {
      return 'User Name is required';
    } else if (value.length <= 3) {
      return 'Must Be at least 3 character';
    } else {
      return null;
    }
  }

  //validation for email address
  String? changeEmail(String value) {
    var pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == '') {
      return 'Email address is required';
    } else if (!regex.hasMatch(value)) {
      return 'Invalid Email address';
    } else {
      return null;
    }
  }

  //validation for password
  String? changePass(String value) {
    if (value == '') {
      return 'Password is required';
    } else if (!RegExp(r'[!@#$%^*()]').hasMatch(value.toString())) {
      return 'required 1 special char, 1 number';
    } else if (value.toString().length < 7) {
      return 'Password length must be atleast 7';
    } else {
      return null;
    }
  }

  //insert data
  Future<void> insertData(Student stud, BuildContext context) async {
    var student = StudentRegisterCompanion(
      firstname: Value(stud.firstname),
      lastname: Value(stud.lastname),
      username: Value(stud.username),
      email: Value(stud.email),
      password: Value(stud.password),
      birthdate: Value(stud.date),
      grade: Value(stud.grade),
      status: const Value(false),
    );
    await Provider.of<AppDao>(context, listen: false).insertStudent(student);
  }
}
