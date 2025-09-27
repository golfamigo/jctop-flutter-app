// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrganizatorsStruct extends BaseStruct {
  OrganizatorsStruct({
    String? title,
    String? followers,
    String? img,
    String? id,
  })  : _title = title,
        _followers = followers,
        _img = img,
        _id = id;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "followers" field.
  String? _followers;
  String get followers => _followers ?? '';
  set followers(String? val) => _followers = val;

  bool hasFollowers() => _followers != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  set img(String? val) => _img = val;

  bool hasImg() => _img != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  static OrganizatorsStruct fromMap(Map<String, dynamic> data) =>
      OrganizatorsStruct(
        title: data['title'] as String?,
        followers: data['followers'] as String?,
        img: data['img'] as String?,
        id: data['id'] as String?,
      );

  static OrganizatorsStruct? maybeFromMap(dynamic data) => data is Map
      ? OrganizatorsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'followers': _followers,
        'img': _img,
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'followers': serializeParam(
          _followers,
          ParamType.String,
        ),
        'img': serializeParam(
          _img,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
      }.withoutNulls;

  static OrganizatorsStruct fromSerializableMap(Map<String, dynamic> data) =>
      OrganizatorsStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        followers: deserializeParam(
          data['followers'],
          ParamType.String,
          false,
        ),
        img: deserializeParam(
          data['img'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'OrganizatorsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OrganizatorsStruct &&
        title == other.title &&
        followers == other.followers &&
        img == other.img &&
        id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([title, followers, img, id]);
}

OrganizatorsStruct createOrganizatorsStruct({
  String? title,
  String? followers,
  String? img,
  String? id,
}) =>
    OrganizatorsStruct(
      title: title,
      followers: followers,
      img: img,
      id: id,
    );
