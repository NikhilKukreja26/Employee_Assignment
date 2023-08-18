import 'package:employee_assignment/constants/constants.dart';
import 'package:employee_assignment/exceptions/custom_db_exception.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class EmployeesDB {
  EmployeesDB._();

  static final EmployeesDB _instance = EmployeesDB._();
  static EmployeesDB get instance => _instance;

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    try {
      final dbLoc = await getDatabasesPath();
      final dbPath = join(dbLoc, dbName);
      _database = await openDatabase(
        dbPath,
        version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(EmployeeTable.createEmployeeTable);
        },
      );
      return _database!;
    } catch (e) {
      rethrow;
    }
  }

  Future<int> addEmployee({required Map<String, dynamic> mapEmployee}) async {
    try {
      final db = await instance.database;
      final int id = await db.insert(
        EmployeeTable.tableName,
        mapEmployee,
      );
      return id;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getEmployees() async {
    try {
      final db = await instance.database;
      final List<Map<String, dynamic>> mapEmployees = await db.query(
        EmployeeTable.tableName,
        columns: EmployeeTable.fields,
        orderBy: '${EmployeeTable.columnUpdatedAt} ASC',
      );
      return mapEmployees;
    } catch (e) {
      rethrow;
    }
  }

  Future<int> editEmployee({required Map<String, dynamic> mapEmployee}) async {
    try {
      final db = await instance.database;

      final int id = mapEmployee[EmployeeTable.columnId] as int;

      final int result = await db.update(
        EmployeeTable.tableName,
        mapEmployee,
        where: '${EmployeeTable.columnId} = ?',
        whereArgs: [id],
      );
      if (result == 1) {
        return result;
      } else {
        throw CustomDBException('Fail to edit employee with $id');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<int> deleteEmployee({required int id}) async {
    try {
      final db = await instance.database;

      final int result = await db.delete(
        EmployeeTable.tableName,
        where: '${EmployeeTable.columnId} = ?',
        whereArgs: [id],
      );

      if (result == 1) {
        return result;
      } else {
        throw CustomDBException('Fail to delete employee with $id');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> close() async {
    try {
      final db = await instance.database;
      await db.close();
    } catch (e) {
      rethrow;
    }
  }
}
