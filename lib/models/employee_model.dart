import 'package:employee_assignment/constants/constants.dart';
import 'package:equatable/equatable.dart';

class Employee extends Equatable {
  final int? id;
  final String employeeName;
  final String employeeRole;
  final DateTime startDate;
  final DateTime? endDate;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Employee({
    this.id,
    required this.employeeName,
    required this.employeeRole,
    required this.startDate,
    this.endDate,
    required this.createdAt,
    required this.updatedAt,
  });

  Employee copyWith({
    int? id,
    String? employeeName,
    String? employeeRole,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Employee(
      id: id ?? this.id,
      employeeName: employeeName ?? this.employeeName,
      employeeRole: employeeRole ?? this.employeeRole,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json[EmployeeTable.columnId] as int?,
      employeeName: json[EmployeeTable.columnEmployeeName] as String,
      employeeRole: json[EmployeeTable.columnEmployeeRole] as String,
      startDate:
          DateTime.parse(json[EmployeeTable.columnEmployeeStartDate] as String),
      endDate: (json[EmployeeTable.columnEmployeeEndDate] as String?) != null
          ? DateTime.parse(json[EmployeeTable.columnEmployeeEndDate] as String)
          : null,
      createdAt: DateTime.parse(json[EmployeeTable.columnCreatedAt] as String),
      updatedAt: DateTime.parse(json[EmployeeTable.columnUpdatedAt] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      EmployeeTable.columnId: id,
      EmployeeTable.columnEmployeeName: employeeName,
      EmployeeTable.columnEmployeeRole: employeeRole,
      EmployeeTable.columnEmployeeStartDate: startDate.toIso8601String(),
      EmployeeTable.columnEmployeeEndDate: endDate?.toIso8601String(),
      EmployeeTable.columnCreatedAt: createdAt.toIso8601String(),
      EmployeeTable.columnUpdatedAt: updatedAt.toIso8601String(),
    };
  }

  @override
  List<Object?> get props {
    return [
      id,
      employeeName,
      employeeRole,
      startDate,
      endDate,
      createdAt,
      updatedAt,
    ];
  }

  @override
  String toString() {
    return 'Employee(id: $id, employeeName: $employeeName, employeeRole: $employeeRole, startDate: $startDate, endDate: $endDate, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
