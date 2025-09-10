import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'widget_event_card3_model.dart';
export 'widget_event_card3_model.dart';

class WidgetEventCard3Widget extends StatefulWidget {
  const WidgetEventCard3Widget({
    super.key,
    this.data,
  });

  final EventsStruct? data;

  @override
  State<WidgetEventCard3Widget> createState() => _WidgetEventCard3WidgetState();
}

class _WidgetEventCard3WidgetState extends State<WidgetEventCard3Widget> {
  late WidgetEventCard3Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WidgetEventCard3Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        context.pushNamed(
          SingleEventWidget.routeName,
          queryParameters: {
            'data': serializeParam(
              widget.data,
              ParamType.DataStruct,
            ),
          }.withoutNulls,
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).accent1,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.network(
                  widget.data!.img,
                ).image,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            alignment: AlignmentDirectional(1.0, -1.0),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 10.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        FFIcons.kmapPin,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 16.0,
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget.data?.location,
                            'location',
                          ).maybeHandleOverflow(
                            maxChars: 20,
                            replacement: '…',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: GoogleFonts.rubik(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                    child: Text(
                      valueOrDefault<String>(
                        widget.data?.title,
                        'Sunrise Trek and Cultural Tour',
                      ),
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                            font: GoogleFonts.rubik(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontStyle,
                            ),
                            fontSize: 15.0,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                    child: Text(
                      valueOrDefault<String>(
                        widget.data?.date,
                        'Jan 10, 2025, 05:00 AM',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.rubik(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).primary,
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 36.0,
            height: 36.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              shape: BoxShape.circle,
            ),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: ToggleIcon(
                onPressed: () async {
                  safeSetState(
                    () => FFAppState().EVENTSFAVORITES.contains(widget.data)
                        ? FFAppState().removeFromEVENTSFAVORITES(widget.data!)
                        : FFAppState().addToEVENTSFAVORITES(widget.data!),
                  );
                },
                value: FFAppState().EVENTSFAVORITES.contains(widget.data),
                onIcon: Icon(
                  Icons.favorite_rounded,
                  color: FlutterFlowTheme.of(context).error,
                  size: 20.0,
                ),
                offIcon: Icon(
                  Icons.favorite_border_rounded,
                  color: FlutterFlowTheme.of(context).icon,
                  size: 20.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
