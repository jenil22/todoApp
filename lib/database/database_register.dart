import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/models/item_model.dart';
import 'package:todo_app/models/student_model.dart';

//main class for Database
class StudentDataBase {
  //instance for database
  static final StudentDataBase instance = StudentDataBase.init();
  static Database? _database;

  StudentDataBase.init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDb('student.db');
    return _database!;
  }

  //initialze for database
  Future<Database> _initDb(String filepath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filepath);

    return await openDatabase(path, version: 1, onCreate: _createDb);
  }

  //create table
  Future _createDb(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const boolType = 'BOOLEAN NOT NULL';
    String table1 =
        "CREATE TABLE $tableName ( ${StudentFields.id} $idType, ${StudentFields.firstname} $textType, ${StudentFields.lastname} $textType, ${StudentFields.username} $textType, ${StudentFields.email} $textType, ${StudentFields.password} $textType, ${StudentFields.date} $textType, ${StudentFields.status} $boolType, ${StudentFields.grade} $textType )";
    String table2 =
        " CREATE TABLE $itemTable ( ${ItemFields.id} $idType, ${ItemFields.check} $boolType, ${ItemFields.body} $textType )";
    await db.execute(table1);
    await db.execute(table2);
  }

  //insert item
  Future<Item> insertITem(Item item) async {
    final db = await instance.database;
    final id = await db.insert(itemTable, item.toJson());
    return item.copy(id: id);
  }

  //read item
  Future<List<Item>> readItem(int id) async {
    final db = await instance.database;
    final itm = await db.query(itemTable,
        columns: ItemFields.values,
        where: '${ItemFields.id} = ?',
        whereArgs: [id]);
    if (itm.isNotEmpty) {
      return itm.map((e) => Item.fromJson(e)).toList();
    } else {
      throw Exception('Id $id not found');
    }
  }

  //read all item
  Future<List<Item>> readAllItem() async {
    final db = await instance.database;
    final itm = await db.query(itemTable);
    return itm.map((e) => Item.fromJson(e)).toList();
  }

  //update item
  Future<int> updateItem(Item item) async {
    final db = await instance.database;
    return await db.update(itemTable, item.toJson(),
        where: '${ItemFields.id} = ?', whereArgs: [item.id]);
  }

  //detele item
  Future<int> deleteItem(int id) async {
    final db = await instance.database;
    return await db
        .delete(itemTable, where: '${ItemFields.id} = ?', whereArgs: [id]);
  }

  //insert student
  Future<Student> create(Student student) async {
    final db = await instance.database;
    final id = await db.insert(tableName, student.toJson());
    return student.copy(id: id);
  }

  //check student for login
  Future<Student?> getLogin(String username, String password) async {
    var db = await instance.database;
    var result = await db.rawQuery(
        "SELECT * FROM $tableName WHERE username = '$username' AND password = '$password'");
    if (result.isNotEmpty) {
      return Student.fromJson(result.first);
    }
    return null;
  }

  //read student
  Future<List<Student>> read(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      tableName,
      columns: StudentFields.values,
      where: '${StudentFields.id} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return maps.map((e) => Student.fromJson(e)).toList();
    } else {
      throw Exception('Id $id not found');
    }
  }

  //read all student
  Future<List<Student>> readAll() async {
    final db = await instance.database;
    final result = await db.query(tableName);
    return result.map((e) => Student.fromJson(e)).toList();
  }

  //update student
  Future<int> update(Student student) async {
    final db = await instance.database;
    return await db.update(
      tableName,
      student.toJson(),
      where: '${StudentFields.id} = ?',
      whereArgs: [student.id],
    );
  }

  //delete student
  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete(
      tableName,
      where: '${StudentFields.id} = ?',
      whereArgs: [id],
    );
  }

  //close Database
  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
