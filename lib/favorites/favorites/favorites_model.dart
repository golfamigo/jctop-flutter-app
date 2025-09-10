import '/backend/schema/structs/index.dart';
import '/explore/components/widget_event_card/widget_event_card_widget.dart';
import '/favorites/components/widget_empty_favorites/widget_empty_favorites_widget.dart';
import '/favorites/components/widget_favorites_options/widget_favorites_options_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home/components/widget_navbar/widget_navbar_widget.dart';
import 'dart:math';
import 'dart:ui';
import 'favorites_widget.dart' show FavoritesWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
