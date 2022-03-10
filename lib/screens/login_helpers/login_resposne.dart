import 'package:todo_app/database/database_register.dart';
import 'package:todo_app/models/student_model.dart';

//abstract class LoginCallbacks
abstract class LoginCallBack {
  void onLoginSuccess(Student? student);
  void onLoginError(String error);
}

//class for LoginRepsone
class LoginResponse {
  // ignore: prefer_final_fields
  LoginCallBack _callBack;
  LoginResponse(this._callBack);

  //seneding request to database check crendentails
  doLogin(String username, String password) {
    StudentDataBase.instance
        .getLogin(username, password)
        .then((value) => _callBack.onLoginSuccess(value))
        .catchError((error) => _callBack.onLoginError(error));
  }
}
