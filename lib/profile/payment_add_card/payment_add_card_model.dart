import '/flutter_flow/flutter_flow_credit_card_form.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'payment_add_card_widget.dart' show PaymentAddCardWidget;
import 'package:flutter/material.dart';

class PaymentAddCardModel extends FlutterFlowModel<PaymentAddCardWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for CreditCardForm widget.
  final creditCardFormKey = GlobalKey<FormState>();
  CreditCardModel creditCardInfo = emptyCreditCard();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
