// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ArticlesStruct extends BaseStruct {
  ArticlesStruct({
    String? title,
    String? description,
    DateTime? date,
    String? tag,
    String? img,
  })  : _title = title,
        _description = description,
        _date = date,
        _tag = tag,
        _img = img;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  // "tag" field.
  String? _tag;
  String get tag => _tag ?? '';
  set tag(String? val) => _tag = val;

  bool hasTag() => _tag != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  set img(String? val) => _img = val;

  bool hasImg() => _img != null;

  static ArticlesStruct fromMap(Map<String, dynamic> data) => ArticlesStruct(
        title: data['title'] as String?,
        description: data['description'] as String?,
        date: data['date'] as DateTime?,
        tag: data['tag'] as String?,
        img: data['img'] as String?,
      );

  static ArticlesStruct? maybeFromMap(dynamic data) =>
      data is Map ? ArticlesStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'description': _description,
        'date': _date,
        'tag': _tag,
        'img': _img,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'tag': serializeParam(
          _tag,
          ParamType.String,
        ),
        'img': serializeParam(
          _img,
          ParamType.String,
        ),
      }.withoutNulls;

  static ArticlesStruct fromSerializableMap(Map<String, dynamic> data) =>
      ArticlesStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        tag: deserializeParam(
          data['tag'],
          ParamType.String,
          false,
        ),
        img: deserializeParam(
          data['img'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ArticlesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ArticlesStruct &&
        title == other.title &&
        description == other.description &&
        date == other.date &&
        tag == other.tag &&
        img == other.img;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([title, description, date, tag, img]);
}

ArticlesStruct createArticlesStruct({
  String? title,
  String? description,
  DateTime? date,
  String? tag,
  String? img,
}) =>
    ArticlesStruct(
      title: title,
      description: description,
      date: date,
      tag: tag,
      img: img,
    );
