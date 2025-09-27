import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home/components/widget_navbar/widget_navbar_widget.dart';
import '/my_tickets/components/filter_by_date2/filter_by_date2_widget.dart';
import '/my_tickets/components/my_tickets_card/my_tickets_card_widget.dart';
import '/my_tickets/components/my_tickets_options/my_tickets_options_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'my_ticket_test_widget.dart' show MyTicketTestWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyTicketTestModel extends FlutterFlowModel<MyTicketTestWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for MyTicketsCard dynamic component.
  late FlutterFlowDynamicModels<MyTicketsCardModel> myTicketsCardModels1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Models for MyTicketsCard dynamic component.
  late FlutterFlowDynamicModels<MyTicketsCardModel> myTicketsCardModels2;
  // Model for WidgetNavbar component.
  late WidgetNavbarModel widgetNavbarModel;

  @override
  void initState(BuildContext context) {
    myTicketsCardModels1 = FlutterFlowDynamicModels(() => MyTicketsCardModel());
    myTicketsCardModels2 = FlutterFlowDynamicModels(() => MyTicketsCardModel());
    widgetNavbarModel = createModel(context, () => WidgetNavbarModel());
  }

  @override
  void dispose() {
    myTicketsCardModels1.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    myTicketsCardModels2.dispose();
    widgetNavbarModel.dispose();
  }
}
