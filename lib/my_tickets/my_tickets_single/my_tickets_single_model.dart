import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/my_tickets/components/my_tickets_card2_options/my_tickets_card2_options_widget.dart';
import '/my_tickets/components/my_tickets_card_options/my_tickets_card_options_widget.dart';
import '/walkthroughs/ticket.dart';
import 'dart:ui';
import '/index.dart';
import 'dart:math' as math;
import 'my_tickets_single_widget.dart' show MyTicketsSingleWidget;
import 'package:styled_divider/styled_divider.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

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
