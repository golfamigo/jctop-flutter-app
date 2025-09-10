import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'day_text_model.dart';
export 'day_text_model.dart';

class DayTextWidget extends StatefulWidget {
  const DayTextWidget({
    super.key,
    this.day,
  });

  final String? day;

  @override
  State<DayTextWidget> createState() => _DayTextWidgetState();
}

class _DayTextWidgetState extends State<DayTextWidget> {
  late DayTextModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DayTextModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      valueOrDefault<String>(
        widget!.day,
        'null',
      ),
      textAlign: TextAlign.center,
      style: FlutterFlowTheme.of(context).bodyLarge.override(
            font: GoogleFonts.rubik(
              fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
              fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
            ),
            color: FlutterFlowTheme.of(context).secondaryText,
            letterSpacing: 0.0,
            fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
            fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
          ),
    );
  }
}
