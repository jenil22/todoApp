// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class TaskItemData extends DataClass implements Insertable<TaskItemData> {
  final int id;
  final String body;
  final bool complete;
  TaskItemData({required this.id, required this.body, required this.complete});
  factory TaskItemData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return TaskItemData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      body: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}body'])!,
      complete: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}complete'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['body'] = Variable<String>(body);
    map['complete'] = Variable<bool>(complete);
    return map;
  }

  TaskItemCompanion toCompanion(bool nullToAbsent) {
    return TaskItemCompanion(
      id: Value(id),
      body: Value(body),
      complete: Value(complete),
    );
  }

  factory TaskItemData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskItemData(
      id: serializer.fromJson<int>(json['id']),
      body: serializer.fromJson<String>(json['body']),
      complete: serializer.fromJson<bool>(json['complete']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'body': serializer.toJson<String>(body),
      'complete': serializer.toJson<bool>(complete),
    };
  }

  TaskItemData copyWith({int? id, String? body, bool? complete}) =>
      TaskItemData(
        id: id ?? this.id,
        body: body ?? this.body,
        complete: complete ?? this.complete,
      );
  @override
  String toString() {
    return (StringBuffer('TaskItemData(')
          ..write('id: $id, ')
          ..write('body: $body, ')
          ..write('complete: $complete')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, body, complete);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskItemData &&
          other.id == this.id &&
          other.body == this.body &&
          other.complete == this.complete);
}

class TaskItemCompanion extends UpdateCompanion<TaskItemData> {
  final Value<int> id;
  final Value<String> body;
  final Value<bool> complete;
  const TaskItemCompanion({
    this.id = const Value.absent(),
    this.body = const Value.absent(),
    this.complete = const Value.absent(),
  });
  TaskItemCompanion.insert({
    this.id = const Value.absent(),
    required String body,
    required bool complete,
  })  : body = Value(body),
        complete = Value(complete);
  static Insertable<TaskItemData> custom({
    Expression<int>? id,
    Expression<String>? body,
    Expression<bool>? complete,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (body != null) 'body': body,
      if (complete != null) 'complete': complete,
    });
  }

  TaskItemCompanion copyWith(
      {Value<int>? id, Value<String>? body, Value<bool>? complete}) {
    return TaskItemCompanion(
      id: id ?? this.id,
      body: body ?? this.body,
      complete: complete ?? this.complete,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (complete.present) {
      map['complete'] = Variable<bool>(complete.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskItemCompanion(')
          ..write('id: $id, ')
          ..write('body: $body, ')
          ..write('complete: $complete')
          ..write(')'))
        .toString();
  }
}

class $TaskItemTable extends TaskItem
    with TableInfo<$TaskItemTable, TaskItemData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskItemTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String?> body = GeneratedColumn<String?>(
      'body', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _completeMeta = const VerificationMeta('complete');
  @override
  late final GeneratedColumn<bool?> complete = GeneratedColumn<bool?>(
      'complete', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (complete IN (0, 1))');
  @override
  List<GeneratedColumn> get $columns => [id, body, complete];
  @override
  String get aliasedName => _alias ?? 'task_item';
  @override
  String get actualTableName => 'task_item';
  @override
  VerificationContext validateIntegrity(Insertable<TaskItemData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('body')) {
      context.handle(
          _bodyMeta, body.isAcceptableOrUnknown(data['body']!, _bodyMeta));
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('complete')) {
      context.handle(_completeMeta,
          complete.isAcceptableOrUnknown(data['complete']!, _completeMeta));
    } else if (isInserting) {
      context.missing(_completeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaskItemData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return TaskItemData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TaskItemTable createAlias(String alias) {
    return $TaskItemTable(attachedDatabase, alias);
  }
}

class StudentRegisterData extends DataClass
    implements Insertable<StudentRegisterData> {
  final int id;
  final String firstname;
  final String lastname;
  final String username;
  final String email;
  final String password;
  final String birthdate;
  final String grade;
  final bool status;
  StudentRegisterData(
      {required this.id,
      required this.firstname,
      required this.lastname,
      required this.username,
      required this.email,
      required this.password,
      required this.birthdate,
      required this.grade,
      required this.status});
  factory StudentRegisterData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return StudentRegisterData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      firstname: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}firstname'])!,
      lastname: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}lastname'])!,
      username: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}username'])!,
      email: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}email'])!,
      password: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}password'])!,
      birthdate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}birthdate'])!,
      grade: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}grade'])!,
      status: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}status'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['firstname'] = Variable<String>(firstname);
    map['lastname'] = Variable<String>(lastname);
    map['username'] = Variable<String>(username);
    map['email'] = Variable<String>(email);
    map['password'] = Variable<String>(password);
    map['birthdate'] = Variable<String>(birthdate);
    map['grade'] = Variable<String>(grade);
    map['status'] = Variable<bool>(status);
    return map;
  }

  StudentRegisterCompanion toCompanion(bool nullToAbsent) {
    return StudentRegisterCompanion(
      id: Value(id),
      firstname: Value(firstname),
      lastname: Value(lastname),
      username: Value(username),
      email: Value(email),
      password: Value(password),
      birthdate: Value(birthdate),
      grade: Value(grade),
      status: Value(status),
    );
  }

  factory StudentRegisterData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StudentRegisterData(
      id: serializer.fromJson<int>(json['id']),
      firstname: serializer.fromJson<String>(json['firstname']),
      lastname: serializer.fromJson<String>(json['lastname']),
      username: serializer.fromJson<String>(json['username']),
      email: serializer.fromJson<String>(json['email']),
      password: serializer.fromJson<String>(json['password']),
      birthdate: serializer.fromJson<String>(json['birthdate']),
      grade: serializer.fromJson<String>(json['grade']),
      status: serializer.fromJson<bool>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'firstname': serializer.toJson<String>(firstname),
      'lastname': serializer.toJson<String>(lastname),
      'username': serializer.toJson<String>(username),
      'email': serializer.toJson<String>(email),
      'password': serializer.toJson<String>(password),
      'birthdate': serializer.toJson<String>(birthdate),
      'grade': serializer.toJson<String>(grade),
      'status': serializer.toJson<bool>(status),
    };
  }

  StudentRegisterData copyWith(
          {int? id,
          String? firstname,
          String? lastname,
          String? username,
          String? email,
          String? password,
          String? birthdate,
          String? grade,
          bool? status}) =>
      StudentRegisterData(
        id: id ?? this.id,
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
        birthdate: birthdate ?? this.birthdate,
        grade: grade ?? this.grade,
        status: status ?? this.status,
      );
  @override
  String toString() {
    return (StringBuffer('StudentRegisterData(')
          ..write('id: $id, ')
          ..write('firstname: $firstname, ')
          ..write('lastname: $lastname, ')
          ..write('username: $username, ')
          ..write('email: $email, ')
          ..write('password: $password, ')
          ..write('birthdate: $birthdate, ')
          ..write('grade: $grade, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, firstname, lastname, username, email,
      password, birthdate, grade, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StudentRegisterData &&
          other.id == this.id &&
          other.firstname == this.firstname &&
          other.lastname == this.lastname &&
          other.username == this.username &&
          other.email == this.email &&
          other.password == this.password &&
          other.birthdate == this.birthdate &&
          other.grade == this.grade &&
          other.status == this.status);
}

class StudentRegisterCompanion extends UpdateCompanion<StudentRegisterData> {
  final Value<int> id;
  final Value<String> firstname;
  final Value<String> lastname;
  final Value<String> username;
  final Value<String> email;
  final Value<String> password;
  final Value<String> birthdate;
  final Value<String> grade;
  final Value<bool> status;
  const StudentRegisterCompanion({
    this.id = const Value.absent(),
    this.firstname = const Value.absent(),
    this.lastname = const Value.absent(),
    this.username = const Value.absent(),
    this.email = const Value.absent(),
    this.password = const Value.absent(),
    this.birthdate = const Value.absent(),
    this.grade = const Value.absent(),
    this.status = const Value.absent(),
  });
  StudentRegisterCompanion.insert({
    this.id = const Value.absent(),
    required String firstname,
    required String lastname,
    required String username,
    required String email,
    required String password,
    required String birthdate,
    required String grade,
    required bool status,
  })  : firstname = Value(firstname),
        lastname = Value(lastname),
        username = Value(username),
        email = Value(email),
        password = Value(password),
        birthdate = Value(birthdate),
        grade = Value(grade),
        status = Value(status);
  static Insertable<StudentRegisterData> custom({
    Expression<int>? id,
    Expression<String>? firstname,
    Expression<String>? lastname,
    Expression<String>? username,
    Expression<String>? email,
    Expression<String>? password,
    Expression<String>? birthdate,
    Expression<String>? grade,
    Expression<bool>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (firstname != null) 'firstname': firstname,
      if (lastname != null) 'lastname': lastname,
      if (username != null) 'username': username,
      if (email != null) 'email': email,
      if (password != null) 'password': password,
      if (birthdate != null) 'birthdate': birthdate,
      if (grade != null) 'grade': grade,
      if (status != null) 'status': status,
    });
  }

  StudentRegisterCompanion copyWith(
      {Value<int>? id,
      Value<String>? firstname,
      Value<String>? lastname,
      Value<String>? username,
      Value<String>? email,
      Value<String>? password,
      Value<String>? birthdate,
      Value<String>? grade,
      Value<bool>? status}) {
    return StudentRegisterCompanion(
      id: id ?? this.id,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      birthdate: birthdate ?? this.birthdate,
      grade: grade ?? this.grade,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (firstname.present) {
      map['firstname'] = Variable<String>(firstname.value);
    }
    if (lastname.present) {
      map['lastname'] = Variable<String>(lastname.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (birthdate.present) {
      map['birthdate'] = Variable<String>(birthdate.value);
    }
    if (grade.present) {
      map['grade'] = Variable<String>(grade.value);
    }
    if (status.present) {
      map['status'] = Variable<bool>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StudentRegisterCompanion(')
          ..write('id: $id, ')
          ..write('firstname: $firstname, ')
          ..write('lastname: $lastname, ')
          ..write('username: $username, ')
          ..write('email: $email, ')
          ..write('password: $password, ')
          ..write('birthdate: $birthdate, ')
          ..write('grade: $grade, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $StudentRegisterTable extends StudentRegister
    with TableInfo<$StudentRegisterTable, StudentRegisterData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StudentRegisterTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _firstnameMeta = const VerificationMeta('firstname');
  @override
  late final GeneratedColumn<String?> firstname = GeneratedColumn<String?>(
      'firstname', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _lastnameMeta = const VerificationMeta('lastname');
  @override
  late final GeneratedColumn<String?> lastname = GeneratedColumn<String?>(
      'lastname', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _usernameMeta = const VerificationMeta('username');
  @override
  late final GeneratedColumn<String?> username = GeneratedColumn<String?>(
      'username', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String?> email = GeneratedColumn<String?>(
      'email', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _passwordMeta = const VerificationMeta('password');
  @override
  late final GeneratedColumn<String?> password = GeneratedColumn<String?>(
      'password', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _birthdateMeta = const VerificationMeta('birthdate');
  @override
  late final GeneratedColumn<String?> birthdate = GeneratedColumn<String?>(
      'birthdate', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _gradeMeta = const VerificationMeta('grade');
  @override
  late final GeneratedColumn<String?> grade = GeneratedColumn<String?>(
      'grade', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<bool?> status = GeneratedColumn<bool?>(
      'status', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (status IN (0, 1))');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        firstname,
        lastname,
        username,
        email,
        password,
        birthdate,
        grade,
        status
      ];
  @override
  String get aliasedName => _alias ?? 'student_register';
  @override
  String get actualTableName => 'student_register';
  @override
  VerificationContext validateIntegrity(
      Insertable<StudentRegisterData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('firstname')) {
      context.handle(_firstnameMeta,
          firstname.isAcceptableOrUnknown(data['firstname']!, _firstnameMeta));
    } else if (isInserting) {
      context.missing(_firstnameMeta);
    }
    if (data.containsKey('lastname')) {
      context.handle(_lastnameMeta,
          lastname.isAcceptableOrUnknown(data['lastname']!, _lastnameMeta));
    } else if (isInserting) {
      context.missing(_lastnameMeta);
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('birthdate')) {
      context.handle(_birthdateMeta,
          birthdate.isAcceptableOrUnknown(data['birthdate']!, _birthdateMeta));
    } else if (isInserting) {
      context.missing(_birthdateMeta);
    }
    if (data.containsKey('grade')) {
      context.handle(
          _gradeMeta, grade.isAcceptableOrUnknown(data['grade']!, _gradeMeta));
    } else if (isInserting) {
      context.missing(_gradeMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StudentRegisterData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return StudentRegisterData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $StudentRegisterTable createAlias(String alias) {
    return $StudentRegisterTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $TaskItemTable taskItem = $TaskItemTable(this);
  late final $StudentRegisterTable studentRegister =
      $StudentRegisterTable(this);
  late final AppDao appDao = AppDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [taskItem, studentRegister];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$AppDaoMixin on DatabaseAccessor<AppDatabase> {
  $TaskItemTable get taskItem => attachedDatabase.taskItem;
  $StudentRegisterTable get studentRegister => attachedDatabase.studentRegister;
}
