import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'login_email_widget.dart' show LoginEmailWidget;
import 'package:flutter/material.dart';

class LoginEmailModel extends FlutterFlowModel<LoginEmailWidget> {
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
