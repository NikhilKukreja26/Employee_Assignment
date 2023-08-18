import 'package:employee_assignment/extensions/is_empty_or_blank.dart';
import 'package:employee_assignment/pages/add_edit_employee_details/add_edit_employee_exports.dart';
import 'package:flutter/material.dart';

class AddEditEmployeeDetailsPage extends StatefulWidget {
  const AddEditEmployeeDetailsPage({
    super.key,
    this.employee,
    this.isEditing = 'false',
  });

  final Employee? employee;
  final String isEditing;

  @override
  State<AddEditEmployeeDetailsPage> createState() =>
      _AddEditEmployeeDetailsPageState();
}

class _AddEditEmployeeDetailsPageState extends State<AddEditEmployeeDetailsPage>
    with ValidationMixin {
  late final TextEditingController _employeeNameController;
  late final TextEditingController _employeeSelectRoleController;
  late final TextEditingController _employeeStartDateController;
  late final TextEditingController _employeeEndDateController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Employee? get employee => widget.employee;

  DateTime startDate = DateTime.now();
  DateTime? endDate;

  @override
  void initState() {
    super.initState();
    initializeControllers();
    if (employee != null && isEditing) {
      setTextEditingControllers();
      setStartAndEndDateValues();
    }
  }

  @override
  void dispose() {
    super.dispose();
    disposeControllers();
  }

  void initializeControllers() {
    _employeeNameController = TextEditingController();
    _employeeSelectRoleController = TextEditingController();
    _employeeStartDateController = TextEditingController();
    _employeeEndDateController = TextEditingController();
  }

  void setTextEditingControllers() {
    _employeeNameController.text = employee!.employeeName;
    _employeeSelectRoleController.text = employee!.employeeRole;
    _employeeStartDateController.text = dateTimeToString(employee!.startDate);
    if (employee!.endDate != null) {
      _employeeEndDateController.text = dateTimeToString(employee!.endDate);
    }
  }

  void setStartAndEndDateValues() {
    startDate = stringToDateTime(_employeeStartDateController.text);
    if (employee!.endDate != null) {
      endDate = stringToDateTime(_employeeEndDateController.text);
    }
  }

  bool get isEditing => widget.isEditing == 'true';

  void disposeControllers() {
    _employeeNameController.dispose();
    _employeeSelectRoleController.dispose();
    _employeeStartDateController.dispose();
    _employeeEndDateController.dispose();
  }

  void _onSave() {
    if (_formKey.currentState!.validate() &&
        !_employeeStartDateController.text.isEmptyAndBlank()) {
      final now = DateTime.now();
      if (isEditing) {
        final employee = Employee(
          id: widget.employee!.id,
          employeeName: _employeeNameController.text,
          employeeRole: _employeeSelectRoleController.text,
          startDate: startDate,
          createdAt: widget.employee!.createdAt,
          updatedAt: now,
          endDate: endDate,
        );
        context
            .read<EmployeeListBloc>()
            .add(EditEmployeeEvent(employee: employee));
        context.pop();
        return;
      }
      final employee = Employee(
        employeeName: _employeeNameController.text,
        employeeRole: _employeeSelectRoleController.text,
        startDate: startDate,
        createdAt: now,
        updatedAt: now,
        endDate: endDate,
      );
      context
          .read<EmployeeListBloc>()
          .add(AddEmployeeEvent(employee: employee));
      context.pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            AppStrings.pleaseSelectEmployeeStartDate,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        persistentFooterButtons: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p4),
            child: TextButton(
              onPressed: () => context.pop(),
              child: const Text(AppStrings.cancel),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p16),
            child: ElevatedButton(
              onPressed: _onSave,
              child: Text(isEditing ? AppStrings.update : AppStrings.save),
            ),
          ),
        ],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            isEditing
                ? AppStrings.editEmployeeDetails
                : AppStrings.addEmployeeDetails,
          ),
          actions: [
            Visibility(
              visible: isEditing,
              child: IconButton(
                tooltip: AppStrings.delete,
                onPressed: () async {
                  final result = await showAlertDialog(
                    context,
                    title: AppStrings.areYouSure,
                    content: AppStrings.doYouReallyWantToDelete,
                    defaultActionText: AppStrings.yes,
                    cancelActionText: AppStrings.cancel,
                  );
                  if (result != null && result) {
                    if (mounted) {
                      context.read<EmployeeListBloc>().add(
                            DeleteEmployeeEvent(id: employee!.id!),
                          );
                      context.pop();
                    }
                  }
                },
                icon: Icon(MdiIcons.trashCanOutline),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(AppPadding.p16),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                BuildCustomTextFormField(
                  controller: _employeeNameController,
                  hintText: AppStrings.employeeName,
                  prefixIcon: Icon(
                    Icons.person_2_outlined,
                    size: AppHeight.h18,
                  ),
                  validator: validateEmployeeName,
                ),
                SizedBox(height: AppHeight.h24),
                BuildCustomTextFormField(
                  controller: _employeeSelectRoleController,
                  hintText: AppStrings.selectRole,
                  readOnly: true,
                  prefixIcon: Icon(
                    MdiIcons.briefcaseOutline,
                    size: AppHeight.h18,
                  ),
                  suffixIcon: Icon(
                    Icons.arrow_drop_down,
                    size: AppHeight.h22,
                  ),
                  focusedBorder:
                      Theme.of(context).inputDecorationTheme.enabledBorder,
                  validator: validateEmployeeRole,
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      constraints: BoxConstraints(
                        minHeight: AppHeight.h220,
                        maxHeight: AppHeight.h400,
                      ),
                      builder: (context) {
                        return BuildShowSelectRoleBottomSheet(
                          onTap: (String selectedRole) {
                            _employeeSelectRoleController.text = selectedRole;
                            context.pop();
                          },
                        );
                      },
                    );
                  },
                ),
                SizedBox(height: AppHeight.h24),
                Row(
                  children: [
                    Expanded(
                      child: BuildCustomTextFormField(
                        readOnly: true,
                        controller: _employeeStartDateController,
                        hintText: AppStrings.today,
                        style: Theme.of(context).textTheme.bodyMedium,
                        prefixIcon: Icon(
                          MdiIcons.calendarOutline,
                          size: AppHeight.h18,
                        ),
                        focusedBorder: Theme.of(context)
                            .inputDecorationTheme
                            .enabledBorder,
                        // validator: validateEmployeeStartDate,
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return CustomDatePickerDialog(
                                onSavePressed: (DateTime? dateTime) {
                                  _employeeStartDateController.text =
                                      dateTimeToString(dateTime);
                                  context.pop();
                                  startDate = dateTime!;
                                },
                                initialSelectedDate: startDate,
                              );
                            },
                          );
                        },
                      ),
                    ),
                    SizedBox(width: AppWidth.w10),
                    Icon(MdiIcons.arrowRight),
                    SizedBox(width: AppWidth.w10),
                    Expanded(
                      child: BuildCustomTextFormField(
                        controller: _employeeEndDateController,
                        hintText: AppStrings.noDate,
                        style: Theme.of(context).textTheme.bodyMedium,
                        readOnly: true,
                        prefixIcon: Icon(
                          MdiIcons.calendarOutline,
                          size: AppHeight.h18,
                        ),
                        focusedBorder: Theme.of(context)
                            .inputDecorationTheme
                            .enabledBorder,
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return CustomDatePickerDialog(
                                isUsingForEndDate: true,
                                onSavePressed: (DateTime? dateTime) {
                                  _employeeEndDateController.text =
                                      dateTime != null
                                          ? dateTimeToString(dateTime)
                                          : '';
                                  context.pop();

                                  endDate = dateTime;
                                },
                                initialSelectedDate: endDate,
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
