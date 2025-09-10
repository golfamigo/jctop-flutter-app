import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home/components/widget_navbar/widget_navbar_widget.dart';
import '/my_tickets/components/filter_by_date2/filter_by_date2_widget.dart';
import '/my_tickets/components/my_tickets_card/my_tickets_card_widget.dart';
import '/my_tickets/components/my_tickets_card2/my_tickets_card2_widget.dart';
import '/my_tickets/components/my_tickets_options/my_tickets_options_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'my_tickets_widget.dart' show MyTicketsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyTicketsModel extends FlutterFlowModel<MyTicketsWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for MyTicketsCard dynamic component.
  late FlutterFlowDynamicModels<MyTicketsCardModel> myTicketsCardModels;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Models for MyTicketsCard2 dynamic component.
  late FlutterFlowDynamicModels<MyTicketsCard2Model> myTicketsCard2Models;
  // Model for WidgetNavbar component.
  late WidgetNavbarModel widgetNavbarModel;

  @override
  void initState(BuildContext context) {
    myTicketsCardModels = FlutterFlowDynamicModels(() => MyTicketsCardModel());
    myTicketsCard2Models =
        FlutterFlowDynamicModels(() => MyTicketsCard2Model());
    widgetNavbarModel = createModel(context, () => WidgetNavbarModel());
  }

  @override
  void dispose() {
    myTicketsCardModels.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    myTicketsCard2Models.dispose();
    widgetNavbarModel.dispose();
  }
}
