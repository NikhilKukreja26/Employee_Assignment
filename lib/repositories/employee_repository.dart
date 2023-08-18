import 'package:employee_assignment/db/employees_db.dart';
import 'package:employee_assignment/models/employee_model.dart';
import 'package:employee_assignment/repositories/handle_exception.dart';

class EmployeeRepository {
  EmployeeRepository._();
  static final EmployeeRepository _instance = EmployeeRepository._();
  static EmployeeRepository get instance => _instance;

  Future<List<Employee>> getEmployees() async {
    try {
      final List<Map<String, dynamic>> mapEmployees =
          await EmployeesDB.instance.getEmployees();
      final List<Employee> employees = mapEmployees
          .map((Map<String, dynamic> employee) => Employee.fromJson(employee))
          .toList();

      return employees;
    } catch (e) {
      throw handleException(e);
    }
  }

  Future<Employee> addEmployee({required Employee employee}) async {
    try {
      final int id = await EmployeesDB.instance
          .addEmployee(mapEmployee: employee.toJson());

      return employee.copyWith(id: id);
    } catch (e) {
      throw handleException(e);
    }
  }

  Future<void> editEmployee({required Employee employee}) async {
    try {
      await EmployeesDB.instance.editEmployee(mapEmployee: employee.toJson());
    } catch (e) {
      throw handleException(e);
    }
  }

  Future<void> deleteEmployee({required int id}) async {
    try {
      await EmployeesDB.instance.deleteEmployee(id: id);
    } catch (e) {
      throw handleException(e);
    }
  }

  Future<void> closeDB() async {
    try {
      await EmployeesDB.instance.close();
    } catch (e) {
      throw handleException(e);
    }
  }
}
