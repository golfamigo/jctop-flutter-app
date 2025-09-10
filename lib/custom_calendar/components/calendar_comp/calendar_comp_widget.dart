import '/backend/schema/structs/index.dart';
import '/custom_calendar/components/day_text/day_text_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'calendar_comp_model.dart';
export 'calendar_comp_model.dart';

class CalendarCompWidget extends StatefulWidget {
  const CalendarCompWidget({
    super.key,
    required this.inputDate,
    this.onSelectDateAction,
    this.initialSelectedDate,
  });

  final DateTime? inputDate;
  final Future Function(DateTime? selectedDate)? onSelectDateAction;
  final DateTime? initialSelectedDate;

  @override
  State<CalendarCompWidget> createState() => _CalendarCompWidgetState();
}

class _CalendarCompWidgetState extends State<CalendarCompWidget> {
  late CalendarCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalendarCompModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.inputDate = widget!.inputDate;
      safeSetState(() {});
      if (widget!.initialSelectedDate != null) {
        _model.selectedDate = widget!.initialSelectedDate;
        safeSetState(() {});
      }
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
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlutterFlowIconButton(
                borderRadius: 10.0,
                buttonSize: 45.0,
                fillColor: FlutterFlowTheme.of(context).accent1,
                icon: Icon(
                  FFIcons.kchevronLeft,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  _model.inputDate =
                      functions.getLastMonthDateTime(_model.inputDate!);
                  safeSetState(() {});
                },
              ),
              Text(
                '${dateTimeFormat(
                  "MMMM",
                  dateTimeFromSecondsSinceEpoch(valueOrDefault<int>(
                    _model.inputDate?.secondsSinceEpoch,
                    0,
                  )),
                  locale: FFLocalizations.of(context).languageCode,
                )} ${valueOrDefault<String>(
                  dateTimeFormat(
                    "y",
                    _model.inputDate,
                    locale: FFLocalizations.of(context).languageCode,
                  ),
                  '0',
                )}',
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
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 10.0,
                buttonSize: 45.0,
                fillColor: FlutterFlowTheme.of(context).accent1,
                icon: Icon(
                  FFIcons.kchevronRight,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  _model.inputDate =
                      functions.getNextMonthDateTime(_model.inputDate!);
                  safeSetState(() {});
                },
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 10.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: wrapWithModel(
                    model: _model.dayTextModel1,
                    updateCallback: () => safeSetState(() {}),
                    child: DayTextWidget(
                      day: 'Mon',
                    ),
                  ),
                ),
                Expanded(
                  child: wrapWithModel(
                    model: _model.dayTextModel2,
                    updateCallback: () => safeSetState(() {}),
                    child: DayTextWidget(
                      day: 'Tue',
                    ),
                  ),
                ),
                Expanded(
                  child: wrapWithModel(
                    model: _model.dayTextModel3,
                    updateCallback: () => safeSetState(() {}),
                    child: DayTextWidget(
                      day: 'Wed',
                    ),
                  ),
                ),
                Expanded(
                  child: wrapWithModel(
                    model: _model.dayTextModel4,
                    updateCallback: () => safeSetState(() {}),
                    child: DayTextWidget(
                      day: 'Thu',
                    ),
                  ),
                ),
                Expanded(
                  child: wrapWithModel(
                    model: _model.dayTextModel5,
                    updateCallback: () => safeSetState(() {}),
                    child: DayTextWidget(
                      day: 'Fri',
                    ),
                  ),
                ),
                Expanded(
                  child: wrapWithModel(
                    model: _model.dayTextModel6,
                    updateCallback: () => safeSetState(() {}),
                    child: DayTextWidget(
                      day: 'Sat',
                    ),
                  ),
                ),
                Expanded(
                  child: wrapWithModel(
                    model: _model.dayTextModel7,
                    updateCallback: () => safeSetState(() {}),
                    child: DayTextWidget(
                      day: 'Sun',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(),
            child: Builder(
              builder: (context) {
                final calendar =
                    functions.getCalendarForMonth(_model.inputDate!).toList();

                return GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    crossAxisSpacing: 2.0,
                    mainAxisSpacing: 2.0,
                    childAspectRatio: 1.0,
                  ),
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: calendar.length,
                  itemBuilder: (context, calendarIndex) {
                    final calendarItem = calendar[calendarIndex];
                    return InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _model.selectedDate = calendarItem.calendarDate;
                        safeSetState(() {});
                        FFAppState().SelectedFilterDate =
                            calendarItem.calendarDate;
                        _model.updatePage(() {});
                        await widget.onSelectDateAction?.call(
                          _model.selectedDate,
                        );
                      },
                      child: Container(
                        width: 30.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color: dateTimeFormat(
                                    "d/M/y",
                                    calendarItem.calendarDate,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ) ==
                                  dateTimeFormat(
                                    "d/M/y",
                                    _model.selectedDate,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  )
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context).accent4,
                          borderRadius: BorderRadius.circular(10.0),
                          shape: BoxShape.rectangle,
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            dateTimeFormat(
                              "d",
                              dateTimeFromSecondsSinceEpoch(valueOrDefault<int>(
                                calendarItem.calendarDate?.secondsSinceEpoch,
                                0,
                              )),
                              locale: FFLocalizations.of(context).languageCode,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  font: GoogleFonts.rubik(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontStyle,
                                  ),
                                  color: dateTimeFormat(
                                            "d/M/y",
                                            calendarItem.calendarDate,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ) ==
                                          dateTimeFormat(
                                            "d/M/y",
                                            _model.selectedDate,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          )
                                      ? FlutterFlowTheme.of(context).info
                                      : FlutterFlowTheme.of(context)
                                          .primaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
