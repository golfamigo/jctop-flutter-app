import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'widget_event_card3_widget.dart' show WidgetEventCard3Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WidgetEventCard3Model extends FlutterFlowModel<WidgetEventCard3Widget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Insert Row] action in ToggleIcon widget.
  UserFavoritesRow? addFavorite;
  // Stores action output result for [Backend Call - Delete Row(s)] action in ToggleIcon widget.
  List<UserFavoritesRow>? delFavorite;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
