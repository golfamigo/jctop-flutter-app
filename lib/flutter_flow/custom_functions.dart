import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';

List<CalendarDayStruct> getCalendarForMonth(DateTime inputDate) {
  // NOTE: Since recording the episode it was spotted that the AI code which was
  // generated did not correctly support an additional row for months which Sunday
  // is the 1st day of the month. It resulted in the last line not being generated.
  // The code below replaces the AI code which was generated in Episode 2
  // Sorry for any confusion.

  List<CalendarDayStruct> calendar = [];

  // Start by finding the first day of the current month
  DateTime firstOfMonth = DateTime(inputDate.year, inputDate.month, 1);

  // Find the last day of the current month
  DateTime lastOfMonth = DateTime(inputDate.year, inputDate.month + 1, 0);

  // Find the first Monday on or before the first of the month
  DateTime startCalendar =
      firstOfMonth.subtract(Duration(days: firstOfMonth.weekday - 1));

  // Find the last Sunday after the end of the month
  DateTime endCalendar = lastOfMonth.weekday == 7
      ? lastOfMonth
      : lastOfMonth.add(Duration(days: 7 - lastOfMonth.weekday));

  // Populate the calendar
  for (DateTime date = startCalendar;
      date.isBefore(endCalendar.add(Duration(days: 1)));
      date = date.add(Duration(days: 1))) {
    bool isPreviousMonth = date.isBefore(firstOfMonth);
    bool isNextMonth = date.isAfter(lastOfMonth);

    CalendarDayStruct dayStruct = CalendarDayStruct(
        calendarDate: date,
        isPreviousMonth: isPreviousMonth,
        isNextMonth: isNextMonth);

    calendar.add(dayStruct);
  }

  return calendar;
}

DateTime getLastMonthDateTime(DateTime inputDate) {
  int year = inputDate.year;
  int month = inputDate.month;

  if (month == 1) {
    year--;
    month = 12;
  } else {
    month--;
  }
  return DateTime(year, month);
}

DateTime getNextMonthDateTime(DateTime inputDate) {
  int year = inputDate.year;
  int month = inputDate.month;

  if (month == 12) {
    year++;
    month = 1;
  } else {
    month++;
  }
  return DateTime(year, month);
}

List<DateTime> getNextWeekDate(DateTime datee) {
  // get next 7 days date list from the gived datee
  List<DateTime> nextWeekDates = [];
  for (int i = 1; i <= 7; i++) {
    DateTime nextDate = datee.add(Duration(days: i));
    nextWeekDates.add(nextDate);
  }
  return nextWeekDates;
}

bool pastDates(DateTime date) {
  // Return True if the date is less than today's date.
  return date.isBefore(DateTime.now());
}

List<DateTime> getDatesRange(
  DateTime date1,
  DateTime date2,
) {
  // get dates list from date1 to date2 without date1 and date2
  List<DateTime> datesList = [];
  DateTime currentDate = date1.add(Duration(days: 1));

  while (currentDate.isBefore(date2)) {
    datesList.add(currentDate);
    currentDate = currentDate.add(Duration(days: 1));
  }

  return datesList;
}
