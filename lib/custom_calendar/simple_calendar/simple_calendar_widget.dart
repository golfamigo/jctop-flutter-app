import '/custom_calendar/components/calendar_comp/calendar_comp_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'simple_calendar_model.dart';
export 'simple_calendar_model.dart';

class SimpleCalendarWidget extends StatefulWidget {
  const SimpleCalendarWidget({super.key});

  static String routeName = 'SimpleCalendar';
  static String routePath = '/simpleCalendar';

  @override
  State<SimpleCalendarWidget> createState() => _SimpleCalendarWidgetState();
}

class _SimpleCalendarWidgetState extends State<SimpleCalendarWidget> {
  late SimpleCalendarModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SimpleCalendarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                child: wrapWithModel(
                  model: _model.calendarCompModel,
                  updateCallback: () => safeSetState(() {}),
                  child: CalendarCompWidget(
                    inputDate: getCurrentTimestamp,
                    initialSelectedDate: getCurrentTimestamp,
                    onSelectDateAction: (selectedDate) async {
                      FFAppState().SelectedDate = selectedDate;
                      safeSetState(() {});
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
