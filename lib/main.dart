import 'package:employee_assignment/blocs/bloc/employee_list_bloc.dart';
import 'package:employee_assignment/resources/routes_manager.dart';
import 'package:employee_assignment/resources/strings_manager.dart';
import 'package:employee_assignment/resources/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return BlocProvider<EmployeeListBloc>(
          create: (context) =>
              EmployeeListBloc()..add(const FetchEmployeesEvent()),
          child: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: AppStrings.appName,
              theme: getApplicationTheme(context),
              routerConfig: router,
            ),
          ),
        );
      },
    );
  }
}
