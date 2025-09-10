import '/explore/components/widget_event_card/widget_event_card_widget.dart';
import '/explore/components/widget_event_card_trending/widget_event_card_trending_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'explore_search_widget.dart' show ExploreSearchWidget;
import 'package:flutter/material.dart';

class ExploreSearchModel extends FlutterFlowModel<ExploreSearchWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Models for WidgetEventCardTrending dynamic component.
  late FlutterFlowDynamicModels<WidgetEventCardTrendingModel>
      widgetEventCardTrendingModels;
  // Models for WidgetEventCard dynamic component.
  late FlutterFlowDynamicModels<WidgetEventCardModel> widgetEventCardModels;

  @override
  void initState(BuildContext context) {
    widgetEventCardTrendingModels =
        FlutterFlowDynamicModels(() => WidgetEventCardTrendingModel());
    widgetEventCardModels =
        FlutterFlowDynamicModels(() => WidgetEventCardModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    widgetEventCardTrendingModels.dispose();
    widgetEventCardModels.dispose();
  }
}
