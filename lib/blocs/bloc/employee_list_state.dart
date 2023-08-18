part of 'employee_list_bloc.dart';

enum EmployeeListStatus {
  initial,
  loading,
  success,
  failure,
}

class EmployeeListState extends Equatable {
  final EmployeeListStatus status;
  final List<Employee> employees;
  final CustomError error;

  const EmployeeListState({
    required this.status,
    required this.employees,
    required this.error,
  });

  factory EmployeeListState.initial() {
    return const EmployeeListState(
      status: EmployeeListStatus.initial,
      employees: [],
      error: CustomError(),
    );
  }

  EmployeeListState copyWith({
    EmployeeListStatus? status,
    List<Employee>? employees,
    CustomError? error,
  }) {
    return EmployeeListState(
      status: status ?? this.status,
      employees: employees ?? this.employees,
      error: error ?? this.error,
    );
  }

  @override
  String toString() =>
      'EmployeeListState(status: $status, employees: $employees, error: $error)';

  @override
  List<Object> get props => [status, employees, error];
}
