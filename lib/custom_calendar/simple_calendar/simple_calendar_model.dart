import '/custom_calendar/components/calendar_comp/calendar_comp_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'simple_calendar_widget.dart' show SimpleCalendarWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SimpleCalendarModel extends FlutterFlowModel<SimpleCalendarWidget> {
  ///  Local state fields for this page.

  DateTime? selectedDate;

  ///  State fields for stateful widgets in this page.

  // Model for CalendarComp component.
  late CalendarCompModel calendarCompModel;

  @override
  void initState(BuildContext context) {
    calendarCompModel = createModel(context, () => CalendarCompModel());
  }

  @override
  void dispose() {
    calendarCompModel.dispose();
  }
}
