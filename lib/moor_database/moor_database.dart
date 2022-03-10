import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
part 'moor_database.g.dart';

class StudentRegister extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get firstname => text().withLength(min: 1, max: 50)();
  TextColumn get lastname => text().withLength(min: 1, max: 50)();
  TextColumn get username => text()();
  TextColumn get email => text()();
  TextColumn get password => text()();
  TextColumn get birthdate => text()();
  TextColumn get grade => text()();
  BoolColumn get status => boolean()();
}

class TaskItem extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get body => text().withLength(min: 1, max: 50)();
  BoolColumn get complete => boolean()();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [TaskItem, StudentRegister], daos: [AppDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 1;
}

@DriftAccessor(tables: [TaskItem, StudentRegister])
class AppDao extends DatabaseAccessor<AppDatabase> with _$AppDaoMixin {
  final AppDatabase db;

  AppDao(this.db) : super(db);
  Future<List<TaskItemData>> getAllItem() => select(taskItem).get();
  Stream<List<TaskItemData>> watchAllItem() => select(taskItem).watch();
  Future insertItem(Insertable<TaskItemData> task) =>
      into(taskItem).insert(task);
  Future updateItem(Insertable<TaskItemData> task) =>
      update(taskItem).replace(task);
  Future deleteItem(Insertable<TaskItemData> task) =>
      delete(taskItem).delete(task);
  Future insertStudent(Insertable<StudentRegisterData> student) =>
      into(studentRegister).insert(student);
  Stream<List<StudentRegisterData>> watchAllStudent() =>
      select(studentRegister).watch();
  Future<List<StudentRegisterData>> getAllStudent() =>
      select(studentRegister).get();
}
