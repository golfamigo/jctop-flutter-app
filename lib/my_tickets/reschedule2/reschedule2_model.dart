import '/custom_calendar/components/calendar_comp2/calendar_comp2_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/my_tickets/components/reschedule_success/reschedule_success_widget.dart';
import 'dart:ui';
import 'reschedule2_widget.dart' show Reschedule2Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Reschedule2Model extends FlutterFlowModel<Reschedule2Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for CalendarComp2 component.
  late CalendarComp2Model calendarComp2Model;

  @override
  void initState(BuildContext context) {
    calendarComp2Model = createModel(context, () => CalendarComp2Model());
  }

  @override
  void dispose() {
    calendarComp2Model.dispose();
  }
}
