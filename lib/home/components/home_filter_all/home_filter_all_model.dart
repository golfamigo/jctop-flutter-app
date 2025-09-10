import '/backend/schema/structs/index.dart';
import '/custom_calendar/components/calendar_comp/calendar_comp_widget.dart';
import '/explore/components/widget_categories_card/widget_categories_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'home_filter_all_widget.dart' show HomeFilterAllWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeFilterAllModel extends FlutterFlowModel<HomeFilterAllWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for CalendarComp component.
  late CalendarCompModel calendarCompModel;
  // Models for WidgetCategoriesCard dynamic component.
  late FlutterFlowDynamicModels<WidgetCategoriesCardModel>
      widgetCategoriesCardModels;

  @override
  void initState(BuildContext context) {
    calendarCompModel = createModel(context, () => CalendarCompModel());
    widgetCategoriesCardModels =
        FlutterFlowDynamicModels(() => WidgetCategoriesCardModel());
  }

  @override
  void dispose() {
    calendarCompModel.dispose();
    widgetCategoriesCardModels.dispose();
  }
}
