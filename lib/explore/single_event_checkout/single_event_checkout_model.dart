import '/backend/schema/structs/index.dart';
import '/explore/components/widget_checkout_loading/widget_checkout_loading_widget.dart';
import '/explore/components/widget_checkout_options/widget_checkout_options_widget.dart';
import '/explore/components/widget_checkout_options2/widget_checkout_options2_widget.dart';
import '/explore/components/widget_credit_card/widget_credit_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'dart:math' as math;
import 'package:styled_divider/styled_divider.dart';
import 'single_event_checkout_widget.dart' show SingleEventCheckoutWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
