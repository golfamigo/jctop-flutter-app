import '/custom_calendar/components/calendar_comp/calendar_comp_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'filter_by_date2_widget.dart' show FilterByDate2Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FilterByDate2Model extends FlutterFlowModel<FilterByDate2Widget> {
  ///  State fields for stateful widgets in this component.

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
