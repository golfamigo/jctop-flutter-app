// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MetadataStruct extends BaseStruct {
  MetadataStruct({
    bool? wheelchairAccessible,
    bool? hasArmrest,
    int? sightlineRating,
  })  : _wheelchairAccessible = wheelchairAccessible,
        _hasArmrest = hasArmrest,
        _sightlineRating = sightlineRating;

  // "wheelchairAccessible" field.
  bool? _wheelchairAccessible;
  bool get wheelchairAccessible => _wheelchairAccessible ?? false;
  set wheelchairAccessible(bool? val) => _wheelchairAccessible = val;

  bool hasWheelchairAccessible() => _wheelchairAccessible != null;

  // "hasArmrest" field.
  bool? _hasArmrest;
  bool get hasArmrest => _hasArmrest ?? false;
  set hasArmrest(bool? val) => _hasArmrest = val;

  bool hasHasArmrest() => _hasArmrest != null;

  // "sightlineRating" field.
  int? _sightlineRating;
  int get sightlineRating => _sightlineRating ?? 0;
  set sightlineRating(int? val) => _sightlineRating = val;

  void incrementSightlineRating(int amount) =>
      sightlineRating = sightlineRating + amount;

  bool hasSightlineRating() => _sightlineRating != null;

  static MetadataStruct fromMap(Map<String, dynamic> data) => MetadataStruct(
        wheelchairAccessible: data['wheelchairAccessible'] as bool?,
        hasArmrest: data['hasArmrest'] as bool?,
        sightlineRating: castToType<int>(data['sightlineRating']),
      );

  static MetadataStruct? maybeFromMap(dynamic data) =>
      data is Map ? MetadataStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'wheelchairAccessible': _wheelchairAccessible,
        'hasArmrest': _hasArmrest,
        'sightlineRating': _sightlineRating,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'wheelchairAccessible': serializeParam(
          _wheelchairAccessible,
          ParamType.bool,
        ),
        'hasArmrest': serializeParam(
          _hasArmrest,
          ParamType.bool,
        ),
        'sightlineRating': serializeParam(
          _sightlineRating,
          ParamType.int,
        ),
      }.withoutNulls;

  static MetadataStruct fromSerializableMap(Map<String, dynamic> data) =>
      MetadataStruct(
        wheelchairAccessible: deserializeParam(
          data['wheelchairAccessible'],
          ParamType.bool,
          false,
        ),
        hasArmrest: deserializeParam(
          data['hasArmrest'],
          ParamType.bool,
          false,
        ),
        sightlineRating: deserializeParam(
          data['sightlineRating'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'MetadataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MetadataStruct &&
        wheelchairAccessible == other.wheelchairAccessible &&
        hasArmrest == other.hasArmrest &&
        sightlineRating == other.sightlineRating;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([wheelchairAccessible, hasArmrest, sightlineRating]);
}

MetadataStruct createMetadataStruct({
  bool? wheelchairAccessible,
  bool? hasArmrest,
  int? sightlineRating,
}) =>
    MetadataStruct(
      wheelchairAccessible: wheelchairAccessible,
      hasArmrest: hasArmrest,
      sightlineRating: sightlineRating,
    );
