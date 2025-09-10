import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'widget_checkout_loading_model.dart';
export 'widget_checkout_loading_model.dart';

class WidgetCheckoutLoadingWidget extends StatefulWidget {
  const WidgetCheckoutLoadingWidget({
    super.key,
    this.data,
  });

  final EventsStruct? data;

  @override
  State<WidgetCheckoutLoadingWidget> createState() =>
      _WidgetCheckoutLoadingWidgetState();
}

class _WidgetCheckoutLoadingWidgetState
    extends State<WidgetCheckoutLoadingWidget> {
  late WidgetCheckoutLoadingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WidgetCheckoutLoadingModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(
        Duration(
          milliseconds: 3000,
        ),
      );
      Navigator.pop(context);

      context.pushNamed(
        SingleEventCheckoutSuccessWidget.routeName,
        queryParameters: {
          'eventData': serializeParam(
            widget.data,
            ParamType.DataStruct,
          ),
        }.withoutNulls,
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: 180.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
              child: Lottie.asset(
                'assets/jsons/64y5hrhh.json',
                width: 100.0,
                height: 100.0,
                fit: BoxFit.contain,
                animate: true,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'kybdstoo' /* Please wait ... */,
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).titleMedium.override(
                      font: GoogleFonts.rubik(
                        fontWeight:
                            FlutterFlowTheme.of(context).titleMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleMedium.fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).titleMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleMedium.fontStyle,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
