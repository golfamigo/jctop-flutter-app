import '/custom_calendar/components/calendar_comp/calendar_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'simple_calendar_widget.dart' show SimpleCalendarWidget;
import 'package:flutter/material.dart';

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
