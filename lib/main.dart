import 'package:flutter/material.dart';
import 'package:todo_app/models/home_argurments.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/moor_database/moor_database.dart';
import 'package:todo_app/screens/login_page.dart';
import 'package:todo_app/screens/register_page.dart';
import 'package:todo_app/screens/splash_page.dart';
import 'package:todo_app/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => TaskModel()),
      Provider(create: (_) => AppDatabase().appDao),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        //unselectedWidgetColor: const Color.fromRGBO(255, 0, 255, 1),
        dividerColor: Colors.transparent,
        focusColor: Colors.transparent,
        scaffoldBackgroundColor: const Color(0xFF344FA1).withOpacity(1),
        appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF344FA1),
            shadowColor: Colors.transparent,
            iconTheme: IconThemeData(color: Colors.white60)),
      ),
      home: const RegisterPage(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == HomePage.homerouteName) {
          final value = settings.arguments as HomeAgruments;
          return MaterialPageRoute(
              builder: ((context) => HomePage(name: value.name)));
        }
        return null;
      },
    );
  }
}
