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
import '/auth/supabase_auth/auth_util.dart';

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

/// 實驗：計算活動剩餘天數 - 返回 int 供 EventsStruct.dayLeft 使用
int experimentCalculateDaysLeft(DateTime? eventDate) {
  if (eventDate == null) return 0;
  final now = DateTime.now();
  final difference = eventDate.difference(now).inDays;
  return difference > 0 ? difference : 0;
}

int experimentCalculateTicketCount(dynamic ticketsData) {
  if (ticketsData is List) {
    int totalQuantity = 0;
    for (final item in ticketsData) {
      if (item is Map && item['quantity'] != null) {
        final quantity = item['quantity'];
        if (quantity is num) {
          totalQuantity += quantity.toInt();
        }
      }
    }
    if (totalQuantity > 0) {
      return totalQuantity;
    } else {
      return 1;
    }
  }

  if (ticketsData is Map && ticketsData['quantity'] != null) {
    final quantity = ticketsData['quantity'];
    if (quantity is num) {
      return quantity.toInt();
    }
    return 1;
  }

  if (ticketsData is num) {
    return ticketsData.toInt();
  }

  return 1;
}

String experimentFormatPaymentStatus(
  String? paymentStatus,
  double? paymentAmount,
) {
  if (paymentStatus == null) return 'Free';

  switch (paymentStatus.toLowerCase()) {
    case 'completed':
    case 'success':
    case 'paid':
      return paymentAmount == null || paymentAmount <= 0 ? 'Free' : 'Paid';
    case 'pending':
    case 'processing':
      return 'Pending';
    case 'failed':
    case 'cancelled':
    case 'refunded':
      return 'Cancelled';
    case 'free':
    case 'complimentary':
      return 'Free';
    default:
      return paymentAmount == null || paymentAmount <= 0 ? 'Free' : 'Paid';
  }
}

List<EventsStruct> convertVDtEventsToEvents(List<VDtEventsRow> vdtEvents) {
  return vdtEvents
      .map((row) => EventsStruct(
            id: row.id,
            location: row.location,
            title: row.title,
            date: row.date,
            minPrice: row.minPrice,
            maxPrice: row.maxPrice,
            avgPrice: row.avgPrice,
            rating: row.rating,
            tag: row.tag,
            img: row.img,
            descr: row.descr,
            tickets: row.tickets,
            dayleft: row.dayleft,
            ticketStatus: row.ticketStatus,
            createdAt: row.createdAt,
            startHour: row.startHour,
            isFavorite: row.isFavorite,
          ))
      .toList();
}

List<CategoriesStruct> convertVDtCategoriesToCategories(
    List<VDtCategoriesRow> vdtCategories) {
  return vdtCategories
      .map((row) => CategoriesStruct(
            title: row.title,
            img: row.img,
            descr: row.descr,
            icon: row.icon,
          ))
      .toList();
}

DateTime getSevenDaysFromNow() {
  // Get current date and add 7 days to it
  DateTime currentDate = DateTime.now();
  DateTime sevenDaysLater = currentDate.add(Duration(days: 7));
  return sevenDaysLater;
}

DateTime addDaysToDate(
  DateTime inputDate,
  int daysToAdd,
) {
  // Add specified number of days to the input date
  return inputDate.add(Duration(days: daysToAdd));
}

List<TrandingEventsStruct> convertVDtTrendingEventsToTrending(
    List<VDtTrendingEventsRow> vdtTrending) {
  return vdtTrending
      .map((row) => TrandingEventsStruct(
            title: row.title,
            category: row.category,
            price: row.price,
            img: row.img,
          ))
      .toList();
}

List<OrganizatorsStruct> convertVDtOrganizatorsToOrganizators(
    List<VDtOrganizatorsRow> vdtOrganizators) {
  return vdtOrganizators
      .map((row) => OrganizatorsStruct(
            id: row.id,
            title: row.title,
            followers: row.followers,
            img: row.img,
          ))
      .toList();
}

List<CommentsStruct> convertVDtCommentsToComments(
    List<VDtCommentsRow> vdtComments) {
  return vdtComments
      .map((row) => CommentsStruct(
            name: row.name,
            date: row.date,
            comment: row.comment,
          ))
      .toList();
}

List<TicketStruct> convertVDtTicketsToTickets(List<VDtTicketsRow> vdtTickets) {
  return vdtTickets
      .map((row) => TicketStruct(
            title: row.title,
            price: row.price,
            description: row.description,
            quantity: row.quantity,
          ))
      .toList();
}

List<String> convertVAppConstantsToPopularSearches(
    List<VAppConstantsSmartRow> vAppConstants) {
  return vAppConstants
      .map((row) => row.displayText ?? '')
      .where((text) => text.isNotEmpty)
      .toList();
}

List<String> convertVAppConstantsToCategories(
    List<VAppConstantsSmartRow> vAppConstants) {
  return vAppConstants
      .map((row) => row.displayText ?? '')
      .where((text) => text.isNotEmpty)
      .toList();
}
