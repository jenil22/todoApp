import 'package:flutter/material.dart';
import 'package:todo_app/application/text.dart';
import 'package:todo_app/database/database_register.dart';
import 'package:todo_app/models/home_argurments.dart';
import 'package:todo_app/models/student_model.dart';
import 'package:todo_app/screens/home_page.dart';
import 'package:todo_app/screens/login_helpers/login_resposne.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginCallBack {
  bool isobsecure = true;
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  final _formkey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController name = TextEditingController();
  TextEditingController pass = TextEditingController();
  LoginResponse? _response;
  _LoginPageState() {
    _response = LoginResponse(this);
  }

  void _showSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      text,
      style: const TextStyle(color: Colors.white),
    )));
  }

  @override
  void onLoginError(String error) {
    _showSnackBar(error);
  }

  @override
  void onLoginSuccess(Student? student) async {
    if (student != null) {
      var dstudent = Student(
          id: student.id,
          firstname: student.firstname,
          lastname: student.lastname,
          username: student.username,
          email: student.email,
          password: student.password,
          date: student.date,
          grade: student.grade,
          status: true);
      await StudentDataBase.instance.update(dstudent);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        ApplicationText.loginSuccess,
        style: const TextStyle(color: Colors.white),
      )));
      await Future.delayed(const Duration(seconds: 2));
      Navigator.pushReplacementNamed(context, HomePage.homerouteName,
          arguments: HomeAgruments(name: student.username));
    } else {
      _showSnackBar("Invalid Username or Password");
    }
  }

  void _submit() {
    final form = _formkey.currentState;
    if (form!.validate()) {
      setState(() {
        _response!.doLogin(name.text, pass.text);
      });
    } else {
      _showSnackBar("All Fields are requied!!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          key: _scaffoldKey,
          //footer
          persistentFooterButtons: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(8.0),
                  child: Text(ApplicationText.footer,
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Dongle',
                          fontSize: 30)),
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        name.clear();
                        pass.clear();
                        _autovalidateMode = AutovalidateMode.disabled;
                      });
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/register', ModalRoute.withName('/login'));
                    },
                    child: Text(
                      ApplicationText.lresgister,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          color: Color.fromRGBO(255, 0, 255, 1),
                          fontFamily: 'Dongle',
                          fontSize: 30),
                    )),
              ],
            )
          ],
          body: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //title for login page
              Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                padding: const EdgeInsets.symmetric(vertical: 80),
                alignment: Alignment.center,
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15)),
                    padding: const EdgeInsets.all(8.0),
                    child: const Icon(
                      Icons.check,
                      size: 60.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              //form for login page
              Form(
                  key: _formkey,
                  autovalidateMode: _autovalidateMode,
                  child: Column(
                    children: <Widget>[
                      //title of form 'Enter your name'
                      Container(
                        alignment: Alignment.center,
                        child: Text(ApplicationText.titleForm,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontFamily: 'Dongle',
                                fontWeight: FontWeight.w800)),
                      ),
                      //username form field
                      Container(
                        height: 55,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 8.0),
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25)),
                        child: TextFormField(
                          controller: name,
                          validator: (value) {
                            if (value == '') {
                              return 'Enter Username';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            labelStyle: const TextStyle(height: 0.3),
                            contentPadding: const EdgeInsets.only(
                                left: 11, right: 3, top: 12, bottom: 10),
                            errorStyle:
                                const TextStyle(fontSize: 12, height: 0.3),
                            border: InputBorder.none,
                            icon: const Icon(Icons.person),
                            labelText: ApplicationText.username,
                          ),
                        ),
                      ),
                      //password form field
                      Container(
                        height: 55,
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25)),
                        child: TextFormField(
                          controller: pass,
                          validator: (value) {
                            if (value == '') {
                              return 'Enter Password';
                            }
                            return null;
                          },
                          obscureText: isobsecure,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isobsecure = !isobsecure;
                                  });
                                },
                                icon: Icon(isobsecure
                                    ? Icons.visibility_off
                                    : Icons.visibility)),
                            labelStyle: const TextStyle(height: 0.3),
                            contentPadding: const EdgeInsets.only(
                                left: 11, right: 3, top: 12, bottom: 10),
                            errorStyle:
                                const TextStyle(fontSize: 12, height: 0.3),
                            border: InputBorder.none,
                            icon: const Icon(Icons.lock),
                            labelText: ApplicationText.password,
                          ),
                        ),
                      ),
                      //Login button
                      TextButton(
                        child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 14.0, vertical: 8.0),
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(255, 0, 255, 1),
                              borderRadius: BorderRadius.circular(25)),
                          child: Text(
                            ApplicationText.login,
                            style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Dongle',
                                fontSize: 30),
                          ),
                        ),
                        onPressed: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          setState(() {
                            _autovalidateMode = AutovalidateMode.always;
                          });
                          _submit();
                        },
                      ),
                    ],
                  )),
            ],
          )),
        ));
  }
}
