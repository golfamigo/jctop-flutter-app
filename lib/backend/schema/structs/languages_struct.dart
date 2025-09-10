// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LanguagesStruct extends BaseStruct {
  LanguagesStruct({
    String? title,
    String? image,
  })  : _title = title,
        _image = image;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  static LanguagesStruct fromMap(Map<String, dynamic> data) => LanguagesStruct(
        title: data['title'] as String?,
        image: data['image'] as String?,
      );

  static LanguagesStruct? maybeFromMap(dynamic data) => data is Map
      ? LanguagesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'image': _image,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
      }.withoutNulls;

  static LanguagesStruct fromSerializableMap(Map<String, dynamic> data) =>
      LanguagesStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LanguagesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LanguagesStruct &&
        title == other.title &&
        image == other.image;
  }

  @override
  int get hashCode => const ListEquality().hash([title, image]);
}

LanguagesStruct createLanguagesStruct({
  String? title,
  String? image,
}) =>
    LanguagesStruct(
      title: title,
      image: image,
    );
