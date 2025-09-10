import '/explore/components/widget_credit_card/widget_credit_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'single_event_checkout_widget.dart' show SingleEventCheckoutWidget;
import 'package:flutter/material.dart';

class SingleEventCheckoutModel
    extends FlutterFlowModel<SingleEventCheckoutWidget> {
  ///  Local state fields for this page.

  bool check1 = true;

  bool check2 = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Model for WidgetCreditCard component.
  late WidgetCreditCardModel widgetCreditCardModel;

  @override
  void initState(BuildContext context) {
    widgetCreditCardModel = createModel(context, () => WidgetCreditCardModel());
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    widgetCreditCardModel.dispose();
  }
}
