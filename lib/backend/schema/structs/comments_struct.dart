// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentsStruct extends BaseStruct {
  CommentsStruct({
    String? name,
    String? date,
    String? comment,
  })  : _name = name,
        _date = date,
        _comment = comment;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  set date(String? val) => _date = val;

  bool hasDate() => _date != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  set comment(String? val) => _comment = val;

  bool hasComment() => _comment != null;

  static CommentsStruct fromMap(Map<String, dynamic> data) => CommentsStruct(
        name: data['name'] as String?,
        date: data['date'] as String?,
        comment: data['comment'] as String?,
      );

  static CommentsStruct? maybeFromMap(dynamic data) =>
      data is Map ? CommentsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'date': _date,
        'comment': _comment,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.String,
        ),
        'comment': serializeParam(
          _comment,
          ParamType.String,
        ),
      }.withoutNulls;

  static CommentsStruct fromSerializableMap(Map<String, dynamic> data) =>
      CommentsStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.String,
          false,
        ),
        comment: deserializeParam(
          data['comment'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CommentsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CommentsStruct &&
        name == other.name &&
        date == other.date &&
        comment == other.comment;
  }

  @override
  int get hashCode => const ListEquality().hash([name, date, comment]);
}

CommentsStruct createCommentsStruct({
  String? name,
  String? date,
  String? comment,
}) =>
    CommentsStruct(
      name: name,
      date: date,
      comment: comment,
    );
