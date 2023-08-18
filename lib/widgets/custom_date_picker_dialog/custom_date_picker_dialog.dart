import 'package:employee_assignment/extensions/date_time_extension.dart';
import 'package:employee_assignment/pages/add_edit_employee_details/add_edit_employee_exports.dart';
import 'package:employee_assignment/resources/color_manager.dart';
import 'package:employee_assignment/resources/fonts_manager.dart';
import 'package:employee_assignment/widgets/custom_date_picker_dialog/widgets/build_end_date_buttons.dart';
import 'package:employee_assignment/widgets/custom_date_picker_dialog/widgets/build_landscape_start_date_buttons.dart';
import 'package:employee_assignment/widgets/custom_date_picker_dialog/widgets/build_portrait_start_date_buttons.dart';
import 'package:flutter/material.dart';

class CustomDatePickerDialog extends StatefulWidget {
  final ValueChanged<DateTime?> onSavePressed;
  final DateTime? initialSelectedDate;
  final bool isUsingForEndDate;

  const CustomDatePickerDialog({
    super.key,
    required this.onSavePressed,
    this.initialSelectedDate,
    this.isUsingForEndDate = false,
  });
  @override
  _CustomDatePickerDialogState createState() => _CustomDatePickerDialogState();
}

class _CustomDatePickerDialogState extends State<CustomDatePickerDialog> {
  late DateTime selectedDate;
  late DateTime? _finalSelectedDate;

  @override
  void initState() {
    super.initState();
    if (widget.isUsingForEndDate && widget.initialSelectedDate == null) {
      selectedDate = DateTime.now();
      _finalSelectedDate = null;
    } else if (widget.initialSelectedDate != null) {
      selectedDate = widget.initialSelectedDate!;
      _finalSelectedDate = selectedDate;
      nextMonth = selectedDate.month;
      return;
    } else {
      selectedDate = DateTime.now();
      _finalSelectedDate = DateTime.now();
    }
  }

  int currentMonth = DateTime.now().month;
  int? nextMonth;

  int todayDate = DateTime.now().day;
  bool? isDateSelected;

  void _showPreviousMonth() {
    setState(() {
      selectedDate =
          DateTime(selectedDate.year, selectedDate.month - 1, selectedDate.day);
    });
  }

  void _showNextMonth() {
    setState(() {
      selectedDate = DateTime(
        selectedDate.year,
        selectedDate.month + 1,
        selectedDate.day,
      );
    });
  }

  List<Widget> _buildWeekdays() {
    final weekdayNames = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    return weekdayNames.map((weekday) {
      return Expanded(
        child: Align(
          child: Text(weekday),
        ),
      );
    }).toList();
  }

  List<Widget> _buildDays() {
    final daysInMonth =
        DateTime(selectedDate.year, selectedDate.month + 1, 0).day;
    final firstDay = DateTime(selectedDate.year, selectedDate.month);
    final weekdaysBeforeFirstDay = (firstDay.weekday - DateTime.sunday + 7) %
        7; // Adjusted for starting from Sunday

    final List<Widget> days = [];
    int dayNumber = 1 - weekdaysBeforeFirstDay;

    for (int i = 0; i < 6; i++) {
      final List<Widget> rowChildren = [];
      for (int j = 0; j < 7; j++) {
        if (dayNumber <= 0 || dayNumber > daysInMonth) {
          rowChildren.add(
            const Expanded(
              child: SizedBox(),
            ),
          ); // Empty space for days outside the month
        } else {
          int selectedDay = dayNumber;

          rowChildren.add(
            Expanded(
              child: Align(
                child: TextButton(
                  onPressed: () {
                    // Handle day selection here
                    final selectedDateTime = DateTime(
                      selectedDate.year,
                      selectedDate.month,
                      selectedDay,
                    );
                    final formattedDate =
                        '${selectedDateTime.day.toString().padLeft(2, '0')} ${months[selectedDate.month - 1]} ${selectedDateTime.year}';

                    setState(() {
                      selectedDate = stringToDateTime(formattedDate);
                      _finalSelectedDate = selectedDate;
                      selectedDay = selectedDate.day;
                      nextMonth = selectedDate.month;
                      currentMonth = DateTime.now().month;
                    });
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    shape: MaterialStateProperty.all(const CircleBorder()),
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (states) {
                        if (selectedDay == _finalSelectedDate?.day &&
                            selectedDate.month == currentMonth) {
                          return ColorManager.primary;
                        } else if (selectedDay == selectedDate.day &&
                            selectedDate.month != currentMonth &&
                            selectedDate.month == nextMonth) {
                          return ColorManager.primary;
                        } else {
                          return Colors.transparent;
                        }
                      },
                    ),
                    side: MaterialStateProperty.resolveWith<BorderSide>(
                      (states) {
                        if (selectedDay == todayDate &&
                            _finalSelectedDate?.month == currentMonth) {
                          return const BorderSide(
                            color: ColorManager.primary,
                            width: 2.0,
                          );
                        }
                        return BorderSide.none;
                      },
                    ),
                  ),
                  child: Text(
                    '$selectedDay',
                    style: TextStyle(
                      color: selectedDay == _finalSelectedDate?.day &&
                                  selectedDate.month == currentMonth ||
                              selectedDay == _finalSelectedDate?.day &&
                                  _finalSelectedDate?.month != currentMonth &&
                                  _finalSelectedDate?.month == nextMonth
                          ? ColorManager.white
                          : ColorManager.black,
                      fontSize: FontSize.s13,
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        dayNumber++;
      }
      days.add(Row(children: rowChildren));
    }

    return days;
  }

  void _onNoDatePressed() {
    setState(() {
      _finalSelectedDate = null;
    });
  }

  void _onTodayPressed() {
    setState(() {
      selectedDate = DateTime.now();
      _finalSelectedDate = selectedDate;
    });
  }

  void _onNextMondayPressed() {
    final DateTime currentDate = DateTime.now();
    final DateTime nextMonday = currentDate.next(
      1,
    ); // Calculate the next Monday from today

    setState(() {
      selectedDate = nextMonday;
      _finalSelectedDate = selectedDate;
    });
  }

  void _onNextTuesdayPressed() {
    final DateTime currentDate = DateTime.now();
    final DateTime nextTuesday = currentDate.next(2);
    // Calculate the next Monday from today
    debugPrint(nextTuesday.toString());

    setState(() {
      selectedDate = nextTuesday;
      _finalSelectedDate = selectedDate;
    });
  }

  void _onAfter1WeekPressed() {
    final DateTime currentDate = DateTime.now();
    final DateTime oneWeek = currentDate.next(7);
    // Calculate the next Monday from today
    debugPrint(oneWeek.toString());

    setState(() {
      selectedDate = oneWeek;
      _finalSelectedDate = selectedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.landscape) {
            return AlertDialog(
              insetPadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              title: SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.9,
                child: Visibility(
                  visible: !widget.isUsingForEndDate,
                  replacement: BuildEndDateButtons(
                    onNoDatePressed: _onNoDatePressed,
                    onTodayPressed: _onTodayPressed,
                  ),
                  child: BuildLandscapeStartDateButtons(
                    onTodayPressed: _onTodayPressed,
                    onNextMondayPressed: _onNextMondayPressed,
                    onNextTuesdayPressed: _onNextTuesdayPressed,
                    onAfter1WeekPressed: _onAfter1WeekPressed,
                  ),
                ),
              ),
              content: _buildContent(),
              actions: [
                _buildActions(),
              ],
            );
          }
          return AlertDialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 10),
            contentPadding: EdgeInsets.zero,
            title: Visibility(
              visible: !widget.isUsingForEndDate,
              replacement: BuildEndDateButtons(
                onNoDatePressed: _onNoDatePressed,
                onTodayPressed: _onTodayPressed,
              ),
              child: BuildPortraitStartDateButtons(
                onTodayPressed: _onTodayPressed,
                onNextMondayPressed: _onNextMondayPressed,
                onNextTuesdayPressed: _onNextTuesdayPressed,
                onAfter1WeekPressed: _onAfter1WeekPressed,
              ),
            ),
            content: _buildContent(),
            actions: [
              _buildActions(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: AppHeight.h15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_left,
                  color: Theme.of(context).dialogTheme.iconColor,
                ),
                onPressed: _showPreviousMonth,
                iconSize: AppHeight.h24,
              ),
              Text(
                DateFormat.yMMMM().format(selectedDate),
                style: TextStyle(
                  color: ColorManager.lightBlack,
                  fontSize: FontSize.s18,
                  fontWeight: FontWeightManager.medium,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.arrow_right,
                  color: Theme.of(context).dialogTheme.iconColor,
                ),
                onPressed: _showNextMonth,
                iconSize: AppHeight.h24,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _buildWeekdays(),
          ),
          Column(
            children: _buildDays(),
          ),
          const Divider(height: 0.5),
        ],
      ),
    );
  }

  Widget _buildActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              MdiIcons.calendarOutline,
              size: AppHeight.h18,
            ),
            SizedBox(width: AppWidth.w10),
            Text(
              _finalSelectedDate != null
                  ? dateTimeToString(_finalSelectedDate)
                  : AppStrings.noDate,
              style: TextStyle(
                fontSize: FontSize.s14,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppPadding.p8),
              child: TextButton(
                onPressed: () => context.pop(),
                child: const Text(AppStrings.cancel),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                widget.onSavePressed(_finalSelectedDate);
              },
              child: const Text(AppStrings.save),
            ),
          ],
        ),
      ],
    );
  }
}
