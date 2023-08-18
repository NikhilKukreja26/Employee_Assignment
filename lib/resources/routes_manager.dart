import 'package:employee_assignment/models/employee_model.dart';
import 'package:employee_assignment/pages/add_edit_employee_details/add_edit_employee_details_page.dart';
import 'package:employee_assignment/pages/employee_list/employee_list_page.dart';
import 'package:employee_assignment/resources/strings_manager.dart';
import 'package:go_router/go_router.dart' show GoRoute, GoRouter, RouteBase;

class Routes {
  static const String employeeRoute = '/';
  static const String addEmployeeRoute = '/addEmployeeRoute';
}

class RoutesName {
  static const String employeeList = 'employeeList';
  static const String addEmployeeDetails = 'addEmployeeDetails';
}

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: Routes.employeeRoute,
      name: RoutesName.employeeList,
      builder: (context, state) => const EmployeeListPage(),
    ),
    GoRoute(
      path: Routes.addEmployeeRoute,
      name: RoutesName.addEmployeeDetails,
      builder: (context, state) {
        final Employee? employee = state.extra as Employee?;
        final String isEditing =
            state.uri.queryParameters[AppStrings.isEditing] ?? '';
        return AddEditEmployeeDetailsPage(
          employee: employee,
          isEditing: isEditing,
        );
      },
    ),
  ],
);
