import '/custom_calendar/components/calendar_comp2/calendar_comp2_widget.dart';
import '/explore/components/ticket_card/ticket_card_widget.dart';
import '/explore/components/widget_comment_card/widget_comment_card_widget.dart';
import '/explore/components/widget_event_card2/widget_event_card2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'single_event2_widget.dart' show SingleEvent2Widget;
import 'package:flutter/material.dart';

class SingleEvent2Model extends FlutterFlowModel<SingleEvent2Widget> {
  ///  Local state fields for this page.

  bool fullDescription = false;

  ///  State fields for stateful widgets in this page.

  // Models for WidgetCommentCard dynamic component.
  late FlutterFlowDynamicModels<WidgetCommentCardModel> widgetCommentCardModels;
  // Model for CalendarComp2 component.
  late CalendarComp2Model calendarComp2Model;
  // Models for TicketCard dynamic component.
  late FlutterFlowDynamicModels<TicketCardModel> ticketCardModels;
  // Models for WidgetEventCard2 dynamic component.
  late FlutterFlowDynamicModels<WidgetEventCard2Model> widgetEventCard2Models;

  @override
  void initState(BuildContext context) {
    widgetCommentCardModels =
        FlutterFlowDynamicModels(() => WidgetCommentCardModel());
    calendarComp2Model = createModel(context, () => CalendarComp2Model());
    ticketCardModels = FlutterFlowDynamicModels(() => TicketCardModel());
    widgetEventCard2Models =
        FlutterFlowDynamicModels(() => WidgetEventCard2Model());
  }

  @override
  void dispose() {
    widgetCommentCardModels.dispose();
    calendarComp2Model.dispose();
    ticketCardModels.dispose();
    widgetEventCard2Models.dispose();
  }
}
