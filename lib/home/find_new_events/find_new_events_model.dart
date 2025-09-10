import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'find_new_events_widget.dart' show FindNewEventsWidget;
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class FindNewEventsModel extends FlutterFlowModel<FindNewEventsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController;

  @override
  void initState(BuildContext context) {
    swipeableStackController = CardSwiperController();
  }

  @override
  void dispose() {}
}
