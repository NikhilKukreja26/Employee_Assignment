part of 'employee_list_bloc.dart';

sealed class EmployeeListEvent extends Equatable {
  const EmployeeListEvent();

  @override
  List<Object> get props => [];
}

class FetchEmployeesEvent extends EmployeeListEvent {
  const FetchEmployeesEvent();
}

class AddEmployeeEvent extends EmployeeListEvent {
  final Employee employee;

  const AddEmployeeEvent({
    required this.employee,
  });

  @override
  String toString() => 'AddEmployeeEvent(employee: $employee)';

  @override
  List<Object> get props => [employee];
}

class EditEmployeeEvent extends EmployeeListEvent {
  final Employee employee;

  const EditEmployeeEvent({
    required this.employee,
  });

  @override
  String toString() => 'EditEmployeeEvent(employee: $employee)';

  @override
  List<Object> get props => [employee];
}

class DeleteEmployeeEvent extends EmployeeListEvent {
  final int id;

  const DeleteEmployeeEvent({
    required this.id,
  });

  @override
  String toString() => 'DeleteEmployeeEvent(id: $id)';

  @override
  List<Object> get props => [id];
}
