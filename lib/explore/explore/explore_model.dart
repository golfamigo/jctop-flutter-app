import '/explore/components/widget_categories_card2/widget_categories_card2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/home/components/widget_navbar/widget_navbar_widget.dart';
import '/index.dart';
import 'explore_widget.dart' show ExploreWidget;
import 'package:flutter/material.dart';

class ExploreModel extends FlutterFlowModel<ExploreWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for WidgetCategoriesCard2 dynamic component.
  late FlutterFlowDynamicModels<WidgetCategoriesCard2Model>
      widgetCategoriesCard2Models;
  // Model for WidgetNavbar component.
  late WidgetNavbarModel widgetNavbarModel;

  @override
  void initState(BuildContext context) {
    widgetCategoriesCard2Models =
        FlutterFlowDynamicModels(() => WidgetCategoriesCard2Model());
    widgetNavbarModel = createModel(context, () => WidgetNavbarModel());
  }

  @override
  void dispose() {
    widgetCategoriesCard2Models.dispose();
    widgetNavbarModel.dispose();
  }
}
