// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TrandingEventsStruct extends BaseStruct {
  TrandingEventsStruct({
    String? price,
    String? category,
    String? title,
    String? img,
  })  : _price = price,
        _category = category,
        _title = title,
        _img = img;

  // "Price" field.
  String? _price;
  String get price => _price ?? '';
  set price(String? val) => _price = val;

  bool hasPrice() => _price != null;

  // "Category" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;

  bool hasCategory() => _category != null;

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  set img(String? val) => _img = val;

  bool hasImg() => _img != null;

  static TrandingEventsStruct fromMap(Map<String, dynamic> data) =>
      TrandingEventsStruct(
        price: data['Price'] as String?,
        category: data['Category'] as String?,
        title: data['Title'] as String?,
        img: data['img'] as String?,
      );

  static TrandingEventsStruct? maybeFromMap(dynamic data) => data is Map
      ? TrandingEventsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Price': _price,
        'Category': _category,
        'Title': _title,
        'img': _img,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Price': serializeParam(
          _price,
          ParamType.String,
        ),
        'Category': serializeParam(
          _category,
          ParamType.String,
        ),
        'Title': serializeParam(
          _title,
          ParamType.String,
        ),
        'img': serializeParam(
          _img,
          ParamType.String,
        ),
      }.withoutNulls;

  static TrandingEventsStruct fromSerializableMap(Map<String, dynamic> data) =>
      TrandingEventsStruct(
        price: deserializeParam(
          data['Price'],
          ParamType.String,
          false,
        ),
        category: deserializeParam(
          data['Category'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['Title'],
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
  String toString() => 'TrandingEventsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TrandingEventsStruct &&
        price == other.price &&
        category == other.category &&
        title == other.title &&
        img == other.img;
  }

  @override
  int get hashCode => const ListEquality().hash([price, category, title, img]);
}

TrandingEventsStruct createTrandingEventsStruct({
  String? price,
  String? category,
  String? title,
  String? img,
}) =>
    TrandingEventsStruct(
      price: price,
      category: category,
      title: title,
      img: img,
    );
