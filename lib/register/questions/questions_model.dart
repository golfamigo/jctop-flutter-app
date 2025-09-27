import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'questions_widget.dart' show QuestionsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuestionsModel extends FlutterFlowModel<QuestionsWidget> {
  ///  Local state fields for this page.

  String? yourLocation = 'unknow';

  List<VAppConstantsWithTranslationsRow> interestsList = [];
  void addToInterestsList(VAppConstantsWithTranslationsRow item) =>
      interestsList.add(item);
  void removeFromInterestsList(VAppConstantsWithTranslationsRow item) =>
      interestsList.remove(item);
  void removeAtIndexFromInterestsList(int index) =>
      interestsList.removeAt(index);
  void insertAtIndexInInterestsList(
          int index, VAppConstantsWithTranslationsRow item) =>
      interestsList.insert(index, item);
  void updateInterestsListAtIndex(
          int index, Function(VAppConstantsWithTranslationsRow) updateFn) =>
      interestsList[index] = updateFn(interestsList[index]);

  List<VAppConstantsWithTranslationsRow> lookingForList = [];
  void addToLookingForList(VAppConstantsWithTranslationsRow item) =>
      lookingForList.add(item);
  void removeFromLookingForList(VAppConstantsWithTranslationsRow item) =>
      lookingForList.remove(item);
  void removeAtIndexFromLookingForList(int index) =>
      lookingForList.removeAt(index);
  void insertAtIndexInLookingForList(
          int index, VAppConstantsWithTranslationsRow item) =>
      lookingForList.insert(index, item);
  void updateLookingForListAtIndex(
          int index, Function(VAppConstantsWithTranslationsRow) updateFn) =>
      lookingForList[index] = updateFn(lookingForList[index]);

  List<UsersRow> organizersList = [];
  void addToOrganizersList(UsersRow item) => organizersList.add(item);
  void removeFromOrganizersList(UsersRow item) => organizersList.remove(item);
  void removeAtIndexFromOrganizersList(int index) =>
      organizersList.removeAt(index);
  void insertAtIndexInOrganizersList(int index, UsersRow item) =>
      organizersList.insert(index, item);
  void updateOrganizersListAtIndex(int index, Function(UsersRow) updateFn) =>
      organizersList[index] = updateFn(organizersList[index]);

  bool isDataLoaded = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in Questions widget.
  List<VAppConstantsWithTranslationsRow>? interestsQuery;
  // Stores action output result for [Backend Call - Query Rows] action in Questions widget.
  List<VAppConstantsWithTranslationsRow>? lookingForQuery;
  // Stores action output result for [Backend Call - Query Rows] action in Questions widget.
  List<UsersRow>? organizersQuery;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
