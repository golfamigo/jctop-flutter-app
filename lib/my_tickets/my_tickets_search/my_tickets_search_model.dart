import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/my_tickets/components/my_tickets_card2/my_tickets_card2_widget.dart';
import 'dart:ui';
import 'my_tickets_search_widget.dart' show MyTicketsSearchWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyTicketsSearchModel extends FlutterFlowModel<MyTicketsSearchWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Models for MyTicketsCard2 dynamic component.
  late FlutterFlowDynamicModels<MyTicketsCard2Model> myTicketsCard2Models;

  @override
  void initState(BuildContext context) {
    myTicketsCard2Models =
        FlutterFlowDynamicModels(() => MyTicketsCard2Model());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    myTicketsCard2Models.dispose();
  }
}
