import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'my_tickets_single_widget.dart' show MyTicketsSingleWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';

class MyTicketsSingleModel extends FlutterFlowModel<MyTicketsSingleWidget> {
  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? ticketController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    ticketController?.finish();
  }
}
