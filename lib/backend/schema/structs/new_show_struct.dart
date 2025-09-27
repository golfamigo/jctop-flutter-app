// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NewShowStruct extends BaseStruct {
  NewShowStruct({
    String? location,
    String? title,
    DateTime? date,
    String? img,
  })  : _location = location,
        _title = title,
        _date = date,
        _img = img;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  set location(String? val) => _location = val;

  bool hasLocation() => _location != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  set img(String? val) => _img = val;

  bool hasImg() => _img != null;

  static NewShowStruct fromMap(Map<String, dynamic> data) => NewShowStruct(
        location: data['location'] as String?,
        title: data['title'] as String?,
        date: data['date'] as DateTime?,
        img: data['img'] as String?,
      );

  static NewShowStruct? maybeFromMap(dynamic data) =>
      data is Map ? NewShowStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'location': _location,
        'title': _title,
        'date': _date,
        'img': _img,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'location': serializeParam(
          _location,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'img': serializeParam(
          _img,
          ParamType.String,
        ),
      }.withoutNulls;

  static NewShowStruct fromSerializableMap(Map<String, dynamic> data) =>
      NewShowStruct(
        location: deserializeParam(
          data['location'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        img: deserializeParam(
          data['img'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'NewShowStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NewShowStruct &&
        location == other.location &&
        title == other.title &&
        date == other.date &&
        img == other.img;
  }

  @override
  int get hashCode => const ListEquality().hash([location, title, date, img]);
}

NewShowStruct createNewShowStruct({
  String? location,
  String? title,
  DateTime? date,
  String? img,
}) =>
    NewShowStruct(
      location: location,
      title: title,
      date: date,
      img: img,
    );
