import 'package:bloc/bloc.dart';
import 'package:employee_assignment/models/custom_error.dart';
import 'package:employee_assignment/models/employee_model.dart';
import 'package:employee_assignment/repositories/employee_repository.dart';
import 'package:equatable/equatable.dart' show Equatable;

part 'employee_list_event.dart';
part 'employee_list_state.dart';

class EmployeeListBloc extends Bloc<EmployeeListEvent, EmployeeListState> {
  EmployeeListBloc() : super(EmployeeListState.initial()) {
    on<FetchEmployeesEvent>(_getEmployees);
    on<AddEmployeeEvent>(_onAddEmployee);
    on<EditEmployeeEvent>(_onEditEmployee);
    on<DeleteEmployeeEvent>(_onDeleteEmployee);
  }

  Future<void> _getEmployees(
    FetchEmployeesEvent event,
    Emitter<EmployeeListState> emit,
  ) async {
    try {
      emit(state.copyWith(status: EmployeeListStatus.loading));
      final List<Employee> employees =
          await EmployeeRepository.instance.getEmployees();
      emit(
        state.copyWith(
          status: EmployeeListStatus.success,
          employees: employees,
        ),
      );
    } on CustomError catch (e) {
      emit(
        state.copyWith(
          status: EmployeeListStatus.failure,
          error: e,
        ),
      );
    }
  }

  Future<void> _onAddEmployee(
    AddEmployeeEvent event,
    Emitter<EmployeeListState> emit,
  ) async {
    try {
      emit(state.copyWith(status: EmployeeListStatus.loading));
      final newEmployee = await EmployeeRepository.instance.addEmployee(
        employee: event.employee,
      );
      emit(
        state.copyWith(
          status: EmployeeListStatus.success,
          employees: [
            newEmployee,
            ...state.employees,
          ],
        ),
      );
    } on CustomError catch (e) {
      emit(
        state.copyWith(
          status: EmployeeListStatus.failure,
          error: e,
        ),
      );
    }
  }

  Future<void> _onEditEmployee(
    EditEmployeeEvent event,
    Emitter<EmployeeListState> emit,
  ) async {
    try {
      emit(state.copyWith(status: EmployeeListStatus.loading));

      final updatedEmployee = event.employee.copyWith(
        employeeName: event.employee.employeeName,
        employeeRole: event.employee.employeeRole,
        updatedAt: DateTime.now(),
        startDate: event.employee.startDate,
        endDate: event.employee.endDate,
      );

      await EmployeeRepository.instance.editEmployee(employee: updatedEmployee);

      final newEmployees = state.employees
          .map(
            (Employee employee) =>
                employee.id == event.employee.id ? event.employee : employee,
          )
          .toList();

      newEmployees.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));

      emit(
        state.copyWith(
          status: EmployeeListStatus.success,
          employees: newEmployees,
        ),
      );
    } on CustomError catch (e) {
      emit(
        state.copyWith(
          status: EmployeeListStatus.failure,
          error: e,
        ),
      );
    }
  }

  Future<void> _onDeleteEmployee(
    DeleteEmployeeEvent event,
    Emitter<EmployeeListState> emit,
  ) async {
    try {
      await EmployeeRepository.instance.deleteEmployee(id: event.id);
      final newEmployees = state.employees
          .where((Employee employee) => employee.id != event.id)
          .toList();
      emit(
        state.copyWith(
          employees: newEmployees,
        ),
      );
    } on CustomError catch (e) {
      emit(
        state.copyWith(
          status: EmployeeListStatus.failure,
          error: e,
        ),
      );
    }
  }
}
