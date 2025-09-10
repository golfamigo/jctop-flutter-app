import '/explore/components/widget_event_card/widget_event_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/home/components/widget_navbar/widget_navbar_widget.dart';
import 'favorites_widget.dart' show FavoritesWidget;
import 'package:flutter/material.dart';

class FavoritesModel extends FlutterFlowModel<FavoritesWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for WidgetEventCard dynamic component.
  late FlutterFlowDynamicModels<WidgetEventCardModel> widgetEventCardModels;
  // Model for WidgetNavbar component.
  late WidgetNavbarModel widgetNavbarModel;

  @override
  void initState(BuildContext context) {
    widgetEventCardModels =
        FlutterFlowDynamicModels(() => WidgetEventCardModel());
    widgetNavbarModel = createModel(context, () => WidgetNavbarModel());
  }

  @override
  void dispose() {
    widgetEventCardModels.dispose();
    widgetNavbarModel.dispose();
  }
}
