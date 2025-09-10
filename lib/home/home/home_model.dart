import '/explore/components/widget_categories_card2/widget_categories_card2_widget.dart';
import '/explore/components/widget_event_card/widget_event_card_widget.dart';
import '/explore/components/widget_event_card2/widget_event_card2_widget.dart';
import '/explore/components/widget_event_card3/widget_event_card3_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/home/components/widget_navbar/widget_navbar_widget.dart';
import '/index.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? homeController;
  // Models for WidgetCategoriesCard2 dynamic component.
  late FlutterFlowDynamicModels<WidgetCategoriesCard2Model>
      widgetCategoriesCard2Models;
  // Models for WidgetEventCard2 dynamic component.
  late FlutterFlowDynamicModels<WidgetEventCard2Model> widgetEventCard2Models;
  // Models for WidgetEventCard3 dynamic component.
  late FlutterFlowDynamicModels<WidgetEventCard3Model> widgetEventCard3Models;
  // Models for WidgetEventCard dynamic component.
  late FlutterFlowDynamicModels<WidgetEventCardModel> widgetEventCardModels;
  // Model for WidgetNavbar component.
  late WidgetNavbarModel widgetNavbarModel;

  @override
  void initState(BuildContext context) {
    widgetCategoriesCard2Models =
        FlutterFlowDynamicModels(() => WidgetCategoriesCard2Model());
    widgetEventCard2Models =
        FlutterFlowDynamicModels(() => WidgetEventCard2Model());
    widgetEventCard3Models =
        FlutterFlowDynamicModels(() => WidgetEventCard3Model());
    widgetEventCardModels =
        FlutterFlowDynamicModels(() => WidgetEventCardModel());
    widgetNavbarModel = createModel(context, () => WidgetNavbarModel());
  }

  @override
  void dispose() {
    homeController?.finish();
    widgetCategoriesCard2Models.dispose();
    widgetEventCard2Models.dispose();
    widgetEventCard3Models.dispose();
    widgetEventCardModels.dispose();
    widgetNavbarModel.dispose();
  }
}
