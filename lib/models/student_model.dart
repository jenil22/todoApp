//table name for student
const String tableName = 'students';

//table fields
class StudentFields {
  //required all fields
  static final List<String> values = [
    id,
    firstname,
    lastname,
    username,
    email,
    password,
    date,
    grade,
    status,
  ];

  //table fields name for student table
  static const String id = '_id';
  static const String firstname = 'firstname';
  static const String lastname = 'lastname';
  static const String username = 'username';
  static const String email = 'email';
  static const String password = 'password';
  static const String date = 'date';
  static const String grade = 'grade';
  static const String status = 'status';
}

//student model
class Student {
  final int? id;
  final String firstname;
  final String lastname;
  final String username;
  final String email;
  final String password;
  final String date;
  final String grade;
  final bool status;
  Student(
      {this.id,
      required this.firstname,
      required this.lastname,
      required this.username,
      required this.email,
      required this.password,
      required this.date,
      required this.grade,
      this.status = false});

  //mapping student
  static Student fromJson(Map<String, dynamic> json) {
    return Student(
        id: json[StudentFields.id] as int,
        firstname: json[StudentFields.firstname] as String,
        lastname: json[StudentFields.lastname] as String,
        username: json[StudentFields.username] as String,
        email: json[StudentFields.email] as String,
        password: json[StudentFields.password] as String,
        date: json[StudentFields.date] as String,
        grade: json[StudentFields.grade] as String,
        status: json[StudentFields.status] == 1);
  }

  //converting into json
  Map<String, dynamic> toJson() => {
        StudentFields.id: id,
        StudentFields.firstname: firstname,
        StudentFields.lastname: lastname,
        StudentFields.username: username,
        StudentFields.email: email,
        StudentFields.password: password,
        StudentFields.date: date,
        StudentFields.grade: grade,
        StudentFields.status: status ? 1 : 0,
      };

  // copy for student
  Student copy({
    int? id,
    String? firstname,
    String? lastname,
    String? username,
    String? email,
    String? password,
    String? date,
    String? grade,
    bool? status,
  }) =>
      Student(
          id: id ?? this.id,
          firstname: firstname ?? this.firstname,
          lastname: lastname ?? this.lastname,
          username: username ?? this.username,
          email: email ?? this.email,
          password: password ?? this.password,
          date: date ?? this.date,
          grade: grade ?? this.grade,
          status: status ?? this.status);
}
