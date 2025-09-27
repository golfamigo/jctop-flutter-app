// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class Events2Struct extends BaseStruct {
  Events2Struct({
    double? minPrice,
    String? category,
    String? title,
    String? img,
  })  : _minPrice = minPrice,
        _category = category,
        _title = title,
        _img = img;

  // "minPrice" field.
  double? _minPrice;
  double get minPrice => _minPrice ?? 0.0;
  set minPrice(double? val) => _minPrice = val;

  void incrementMinPrice(double amount) => minPrice = minPrice + amount;

  bool hasMinPrice() => _minPrice != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;

  bool hasCategory() => _category != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  set img(String? val) => _img = val;

  bool hasImg() => _img != null;

  static Events2Struct fromMap(Map<String, dynamic> data) => Events2Struct(
        minPrice: castToType<double>(data['minPrice']),
        category: data['category'] as String?,
        title: data['title'] as String?,
        img: data['img'] as String?,
      );

  static Events2Struct? maybeFromMap(dynamic data) =>
      data is Map ? Events2Struct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'minPrice': _minPrice,
        'category': _category,
        'title': _title,
        'img': _img,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'minPrice': serializeParam(
          _minPrice,
          ParamType.double,
        ),
        'category': serializeParam(
          _category,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'img': serializeParam(
          _img,
          ParamType.String,
        ),
      }.withoutNulls;

  static Events2Struct fromSerializableMap(Map<String, dynamic> data) =>
      Events2Struct(
        minPrice: deserializeParam(
          data['minPrice'],
          ParamType.double,
          false,
        ),
        category: deserializeParam(
          data['category'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
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
  String toString() => 'Events2Struct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is Events2Struct &&
        minPrice == other.minPrice &&
        category == other.category &&
        title == other.title &&
        img == other.img;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([minPrice, category, title, img]);
}

Events2Struct createEvents2Struct({
  double? minPrice,
  String? category,
  String? title,
  String? img,
}) =>
    Events2Struct(
      minPrice: minPrice,
      category: category,
      title: title,
      img: img,
    );
