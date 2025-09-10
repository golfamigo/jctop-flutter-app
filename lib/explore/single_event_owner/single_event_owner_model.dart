import '/backend/schema/structs/index.dart';
import '/explore/components/widget_event_card/widget_event_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'single_event_owner_widget.dart' show SingleEventOwnerWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SingleEventOwnerModel extends FlutterFlowModel<SingleEventOwnerWidget> {
  ///  Local state fields for this page.

  bool fullDescription = false;

  ///  State fields for stateful widgets in this page.

  // Models for WidgetEventCard dynamic component.
  late FlutterFlowDynamicModels<WidgetEventCardModel> widgetEventCardModels;

  @override
  void initState(BuildContext context) {
    widgetEventCardModels =
        FlutterFlowDynamicModels(() => WidgetEventCardModel());
  }

  @override
  void dispose() {
    widgetEventCardModels.dispose();
  }
}
