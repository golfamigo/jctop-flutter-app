import '/flutter_flow/flutter_flow_util.dart';
import 'message_support_widget.dart' show MessageSupportWidget;
import 'package:flutter/material.dart';

class MessageSupportModel extends FlutterFlowModel<MessageSupportWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
