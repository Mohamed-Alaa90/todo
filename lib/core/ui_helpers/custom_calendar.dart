import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/constants/my_colors.dart';
import 'package:todo/provider/list_provider.dart';

class CustomCalendar extends StatelessWidget {
  final DateTime? selectDate;
  final Function(DateTime) onDateChange;

  const CustomCalendar({
    super.key,
    required this.selectDate,
    required this.onDateChange,
  });

  @override
  Widget build(BuildContext context) {
    var listProvider = Provider.of<ListProvider>(context);
    return EasyInfiniteDateTimeLine(
      timeLineProps: const EasyTimeLineProps(
        separatorPadding: 15,
      ),
      showTimelineHeader: false,
      dayProps: EasyDayProps(
        //dayStructure: DayStructure.dayStrDayNum,
        height: 90,
        borderColor: Colors.black26,
        inactiveDayStyle: DayStyle(
          monthStrStyle: const TextStyle(
            fontSize: 15,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          dayNumStyle: const TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          dayStrStyle: const TextStyle(
            fontSize: 15,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
        ),
        activeDayStyle: DayStyle(
          monthStrStyle: const TextStyle(
            fontSize: 15,
            color: MyColor.primerColor,
          ),
          dayNumStyle: const TextStyle(
            fontSize: 25,
            color: MyColor.primerColor,
            fontWeight: FontWeight.w700,
          ),
          dayStrStyle: const TextStyle(
            fontSize: 15,
            color: MyColor.primerColor,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black38),
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
        ),
      ),
      firstDate: DateTime(2025, 1, 1),
      lastDate: DateTime(2030, 3, 18),
      focusDate: listProvider.selectedDate,
      onDateChange: onDateChange,
    );
  }
}
