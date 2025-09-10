import '/flutter_flow/flutter_flow_credit_card_form.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'payment_method_add_widget.dart' show PaymentMethodAddWidget;
import 'package:flutter/material.dart';

class PaymentMethodAddModel extends FlutterFlowModel<PaymentMethodAddWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for CreditCardForm widget.
  final creditCardFormKey = GlobalKey<FormState>();
  CreditCardModel creditCardInfo = emptyCreditCard();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
