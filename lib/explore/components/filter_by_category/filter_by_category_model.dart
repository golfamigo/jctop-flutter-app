import '/explore/components/widget_categories_card/widget_categories_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'filter_by_category_widget.dart' show FilterByCategoryWidget;
import 'package:flutter/material.dart';

class FilterByCategoryModel extends FlutterFlowModel<FilterByCategoryWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for WidgetCategoriesCard dynamic component.
  late FlutterFlowDynamicModels<WidgetCategoriesCardModel>
      widgetCategoriesCardModels;

  @override
  void initState(BuildContext context) {
    widgetCategoriesCardModels =
        FlutterFlowDynamicModels(() => WidgetCategoriesCardModel());
  }

  @override
  void dispose() {
    widgetCategoriesCardModels.dispose();
  }
}
