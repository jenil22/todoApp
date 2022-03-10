import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/moor_database/moor_database.dart';
import 'package:todo_app/screens/home_page.dart';

import '../models/home_argurments.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  //check for user
  Future<bool> check() async {
    //final check = await StudentDataBase.instance.readAll();
    final check = Provider.of<AppDao>(context).getAllStudent();
    List<StudentRegisterData> status = await check.then((value) => value);
    if (status.isNotEmpty) {
      return status.first.status;
    } else {
      return false;
    }
  }

  //fetching username
  Future<String> getUsername() async {
    //final result = await StudentDataBase.instance.readAll();
    final result = Provider.of<AppDao>(context).getAllStudent();
    List<StudentRegisterData> name = await result.then((value) => value);
    if (name.isNotEmpty) {
      return name.first.username;
    } else {
      return '';
    }
  }

  @override
  void initState() {
    super.initState();
    //Provider.of<TaskModel>(context, listen: false).getAllUser();
    Timer(const Duration(seconds: 2), () async {
      await check()
          ? Navigator.pushReplacementNamed(context, HomePage.homerouteName,
              arguments: HomeAgruments(name: await getUsername()))
          : Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Scaffold(
      backgroundColor: const Color.fromRGBO(15, 82, 186, 1),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(15)),
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.only(bottom: 4),
          child: const Icon(
            Icons.check,
            size: 60.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
