// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrganizatorsStruct extends BaseStruct {
  OrganizatorsStruct({
    String? title,
    String? followers,
    String? img,
  })  : _title = title,
        _followers = followers,
        _img = img;

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

  static OrganizatorsStruct fromMap(Map<String, dynamic> data) =>
      OrganizatorsStruct(
        title: data['title'] as String?,
        followers: data['followers'] as String?,
        img: data['img'] as String?,
      );

  static OrganizatorsStruct? maybeFromMap(dynamic data) => data is Map
      ? OrganizatorsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'followers': _followers,
        'img': _img,
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
      );

  @override
  String toString() => 'OrganizatorsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OrganizatorsStruct &&
        title == other.title &&
        followers == other.followers &&
        img == other.img;
  }

  @override
  int get hashCode => const ListEquality().hash([title, followers, img]);
}

OrganizatorsStruct createOrganizatorsStruct({
  String? title,
  String? followers,
  String? img,
}) =>
    OrganizatorsStruct(
      title: title,
      followers: followers,
      img: img,
    );
