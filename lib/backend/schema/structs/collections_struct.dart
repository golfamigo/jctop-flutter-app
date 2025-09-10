// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CollectionsStruct extends BaseStruct {
  CollectionsStruct({
    String? title,
    String? descr,
    String? img,
  })  : _title = title,
        _descr = descr,
        _img = img;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "descr" field.
  String? _descr;
  String get descr => _descr ?? '';
  set descr(String? val) => _descr = val;

  bool hasDescr() => _descr != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  set img(String? val) => _img = val;

  bool hasImg() => _img != null;

  static CollectionsStruct fromMap(Map<String, dynamic> data) =>
      CollectionsStruct(
        title: data['title'] as String?,
        descr: data['descr'] as String?,
        img: data['img'] as String?,
      );

  static CollectionsStruct? maybeFromMap(dynamic data) => data is Map
      ? CollectionsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'descr': _descr,
        'img': _img,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'descr': serializeParam(
          _descr,
          ParamType.String,
        ),
        'img': serializeParam(
          _img,
          ParamType.String,
        ),
      }.withoutNulls;

  static CollectionsStruct fromSerializableMap(Map<String, dynamic> data) =>
      CollectionsStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        descr: deserializeParam(
          data['descr'],
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
  String toString() => 'CollectionsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CollectionsStruct &&
        title == other.title &&
        descr == other.descr &&
        img == other.img;
  }

  @override
  int get hashCode => const ListEquality().hash([title, descr, img]);
}

CollectionsStruct createCollectionsStruct({
  String? title,
  String? descr,
  String? img,
}) =>
    CollectionsStruct(
      title: title,
      descr: descr,
      img: img,
    );
