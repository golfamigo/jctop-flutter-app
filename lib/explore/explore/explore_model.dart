import '/backend/schema/structs/index.dart';
import '/explore/components/widget_categories_card2/widget_categories_card2_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home/components/widget_navbar/widget_navbar_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'explore_widget.dart' show ExploreWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
