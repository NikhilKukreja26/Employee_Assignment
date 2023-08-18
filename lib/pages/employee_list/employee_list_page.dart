import 'package:employee_assignment/pages/employee_list/employee_list_exports.dart';
import 'package:employee_assignment/utils/error_dialog.dart';
import 'package:flutter/material.dart';

class EmployeeListPage extends StatelessWidget {
  const EmployeeListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.employeeList,
        ),
      ),
      body: BlocConsumer<EmployeeListBloc, EmployeeListState>(
        listener: (context, state) {
          if (state.status == EmployeeListStatus.failure) {
            errorDialog(context, state.error);
          }
        },
        builder: (context, state) {
          if (state.status == EmployeeListStatus.loading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (state.employees.isEmpty) {
            return const NoEmployeeEmptyState();
          }
          return GroupedListView<Employee, String>(
            padding: EdgeInsets.zero,
            elements: state.employees,
            groupBy: (Employee employee) {
              if (employee.endDate == null) {
                return AppStrings.currentEmployees;
              } else {
                return AppStrings.previousEmployees;
              }
            },
            groupComparator: (String value1, String value2) =>
                value1.compareTo(value2),
            groupSeparatorBuilder: (String value) => BuildHeader(value: value),
            itemComparator: (Employee employee1, Employee employee2) =>
                employee2.startDate.compareTo(employee1.startDate),
            indexedItemBuilder: (_, employee, index) {
              final isLastItem = index == state.employees.length - 1;

              return Dismissible(
                key: ValueKey(employee.id),
                background: const ShowBackground(direction: 1),
                direction: DismissDirection.endToStart,
                resizeDuration: null,
                onDismissed: (_) {
                  final deletedEmployee = employee;
                  context
                      .read<EmployeeListBloc>()
                      .add(DeleteEmployeeEvent(id: employee.id!));
                  showSnackbar(
                    context: context,
                    text: AppStrings.employeeDataDeleted,
                    onPressed: () {
                      context
                          .read<EmployeeListBloc>()
                          .add(AddEmployeeEvent(employee: deletedEmployee));
                    },
                  );
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BuildEmployeeTile(
                      key: ValueKey(index),
                      employee: employee,
                      onTap: () {
                        context.pushNamed(
                          RoutesName.addEmployeeDetails,
                          extra: employee,
                          queryParameters: {
                            AppStrings.isEditing: 'true',
                          },
                        );
                      },
                    ),
                    if (!isLastItem) const Divider(height: 0.5),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: BuildFloatingActionButton(
        onPressed: () => context.pushNamed(RoutesName.addEmployeeDetails),
      ),
    );
  }
}
