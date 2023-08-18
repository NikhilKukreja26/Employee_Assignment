const String dbName = 'employees.db';

class EmployeeTable {
  static const String tableName = 'employees';

  static const String columnId = '_id';
  static const String columnEmployeeName = 'employeeName';
  static const String columnEmployeeRole = 'employeeRole';
  static const String columnEmployeeStartDate = 'employeeStartDate';
  static const String columnEmployeeEndDate = 'employeeEndDate';
  static const String columnCreatedAt = 'createdAt';
  static const String columnUpdatedAt = 'updatedAt';

  static const List<String> fields = [
    columnId,
    columnEmployeeName,
    columnEmployeeRole,
    columnEmployeeStartDate,
    columnEmployeeEndDate,
    columnCreatedAt,
    columnUpdatedAt,
  ];

  static const String createEmployeeTable = """
CREATE TABLE ${EmployeeTable.tableName} (
  ${EmployeeTable.columnId} integer primary key autoincrement,
  ${EmployeeTable.columnEmployeeName} text not null,
  ${EmployeeTable.columnEmployeeRole} text not null,
  ${EmployeeTable.columnEmployeeStartDate} text not null,
  ${EmployeeTable.columnEmployeeEndDate} text null,
  ${EmployeeTable.columnCreatedAt} text not null,
  ${EmployeeTable.columnUpdatedAt} text not null
  )
 """;
}
