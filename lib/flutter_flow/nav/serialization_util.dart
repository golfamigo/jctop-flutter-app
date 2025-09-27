import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';

import '/backend/schema/structs/index.dart';

import '/backend/supabase/supabase.dart';

import '../../flutter_flow/lat_lng.dart';
import '../../flutter_flow/place.dart';
import '../../flutter_flow/uploaded_file.dart';

/// SERIALIZATION HELPERS

String dateTimeRangeToString(DateTimeRange dateTimeRange) {
  final startStr = dateTimeRange.start.millisecondsSinceEpoch.toString();
  final endStr = dateTimeRange.end.millisecondsSinceEpoch.toString();
  return '$startStr|$endStr';
}

String placeToString(FFPlace place) => jsonEncode({
      'latLng': place.latLng.serialize(),
      'name': place.name,
      'address': place.address,
      'city': place.city,
      'state': place.state,
      'country': place.country,
      'zipCode': place.zipCode,
    });

String uploadedFileToString(FFUploadedFile uploadedFile) =>
    uploadedFile.serialize();

String? serializeParam(
  dynamic param,
  ParamType paramType, {
  bool isList = false,
}) {
  try {
    if (param == null) {
      return null;
    }
    if (isList) {
      final serializedValues = (param as Iterable)
          .map((p) => serializeParam(p, paramType, isList: false))
          .where((p) => p != null)
          .map((p) => p!)
          .toList();
      return json.encode(serializedValues);
    }
    String? data;
    switch (paramType) {
      case ParamType.int:
        data = param.toString();
      case ParamType.double:
        data = param.toString();
      case ParamType.String:
        data = param;
      case ParamType.bool:
        data = param ? 'true' : 'false';
      case ParamType.DateTime:
        data = (param as DateTime).millisecondsSinceEpoch.toString();
      case ParamType.DateTimeRange:
        data = dateTimeRangeToString(param as DateTimeRange);
      case ParamType.LatLng:
        data = (param as LatLng).serialize();
      case ParamType.Color:
        data = (param as Color).toCssString();
      case ParamType.FFPlace:
        data = placeToString(param as FFPlace);
      case ParamType.FFUploadedFile:
        data = uploadedFileToString(param as FFUploadedFile);
      case ParamType.JSON:
        data = json.encode(param);

      case ParamType.DataStruct:
        data = param is BaseStruct ? param.serialize() : null;

      case ParamType.SupabaseRow:
        return json.encode((param as SupabaseDataRow).data);

      default:
        data = null;
    }
    return data;
  } catch (e) {
    print('Error serializing parameter: $e');
    return null;
  }
}

/// END SERIALIZATION HELPERS

/// DESERIALIZATION HELPERS

DateTimeRange? dateTimeRangeFromString(String dateTimeRangeStr) {
  final pieces = dateTimeRangeStr.split('|');
  if (pieces.length != 2) {
    return null;
  }
  return DateTimeRange(
    start: DateTime.fromMillisecondsSinceEpoch(int.parse(pieces.first)),
    end: DateTime.fromMillisecondsSinceEpoch(int.parse(pieces.last)),
  );
}

LatLng? latLngFromString(String? latLngStr) {
  final pieces = latLngStr?.split(',');
  if (pieces == null || pieces.length != 2) {
    return null;
  }
  return LatLng(
    double.parse(pieces.first.trim()),
    double.parse(pieces.last.trim()),
  );
}

FFPlace placeFromString(String placeStr) {
  final serializedData = jsonDecode(placeStr) as Map<String, dynamic>;
  final data = {
    'latLng': serializedData.containsKey('latLng')
        ? latLngFromString(serializedData['latLng'] as String)
        : const LatLng(0.0, 0.0),
    'name': serializedData['name'] ?? '',
    'address': serializedData['address'] ?? '',
    'city': serializedData['city'] ?? '',
    'state': serializedData['state'] ?? '',
    'country': serializedData['country'] ?? '',
    'zipCode': serializedData['zipCode'] ?? '',
  };
  return FFPlace(
    latLng: data['latLng'] as LatLng,
    name: data['name'] as String,
    address: data['address'] as String,
    city: data['city'] as String,
    state: data['state'] as String,
    country: data['country'] as String,
    zipCode: data['zipCode'] as String,
  );
}

FFUploadedFile uploadedFileFromString(String uploadedFileStr) =>
    FFUploadedFile.deserialize(uploadedFileStr);

enum ParamType {
  int,
  double,
  String,
  bool,
  DateTime,
  DateTimeRange,
  LatLng,
  Color,
  FFPlace,
  FFUploadedFile,
  JSON,

  DataStruct,
  SupabaseRow,
}

dynamic deserializeParam<T>(
  String? param,
  ParamType paramType,
  bool isList, {
  StructBuilder<T>? structBuilder,
}) {
  try {
    if (param == null) {
      return null;
    }
    if (isList) {
      final paramValues = json.decode(param);
      if (paramValues is! Iterable || paramValues.isEmpty) {
        return null;
      }
      return paramValues
          .where((p) => p is String)
          .map((p) => p as String)
          .map((p) => deserializeParam<T>(
                p,
                paramType,
                false,
                structBuilder: structBuilder,
              ))
          .where((p) => p != null)
          .map((p) => p! as T)
          .toList();
    }
    switch (paramType) {
      case ParamType.int:
        return int.tryParse(param);
      case ParamType.double:
        return double.tryParse(param);
      case ParamType.String:
        return param;
      case ParamType.bool:
        return param == 'true';
      case ParamType.DateTime:
        final milliseconds = int.tryParse(param);
        return milliseconds != null
            ? DateTime.fromMillisecondsSinceEpoch(milliseconds)
            : null;
      case ParamType.DateTimeRange:
        return dateTimeRangeFromString(param);
      case ParamType.LatLng:
        return latLngFromString(param);
      case ParamType.Color:
        return fromCssColor(param);
      case ParamType.FFPlace:
        return placeFromString(param);
      case ParamType.FFUploadedFile:
        return uploadedFileFromString(param);
      case ParamType.JSON:
        return json.decode(param);

      case ParamType.SupabaseRow:
        final data = json.decode(param) as Map<String, dynamic>;
        switch (T) {
          case CategoryTranslationsRow:
            return CategoryTranslationsRow(data);
          case PaymentsRow:
            return PaymentsRow(data);
          case VEventsFullRow:
            return VEventsFullRow(data);
          case VEventsSimpleRow:
            return VEventsSimpleRow(data);
          case UserFollowsRow:
            return UserFollowsRow(data);
          case CollectionsRow:
            return CollectionsRow(data);
          case VDtCollectionsRow:
            return VDtCollectionsRow(data);
          case CollectionEventsRow:
            return CollectionEventsRow(data);
          case FaqsRow:
            return FaqsRow(data);
          case DiscountCodesRow:
            return DiscountCodesRow(data);
          case VCategoriesWithTranslationsRow:
            return VCategoriesWithTranslationsRow(data);
          case VDtEventsRow:
            return VDtEventsRow(data);
          case UserActivitiesRow:
            return UserActivitiesRow(data);
          case VDtOrganizatorsRow:
            return VDtOrganizatorsRow(data);
          case VTrendingEventsRow:
            return VTrendingEventsRow(data);
          case VOrganizatorsRow:
            return VOrganizatorsRow(data);
          case TicketTypesRow:
            return TicketTypesRow(data);
          case VAppConstantsWithTranslationsRow:
            return VAppConstantsWithTranslationsRow(data);
          case VUserRolesRow:
            return VUserRolesRow(data);
          case VArticlesRow:
            return VArticlesRow(data);
          case UserLookingForRow:
            return UserLookingForRow(data);
          case VEventTicketingSummaryRow:
            return VEventTicketingSummaryRow(data);
          case VMyEventsRow:
            return VMyEventsRow(data);
          case SeatReservationsRow:
            return SeatReservationsRow(data);
          case VUserStatisticsRow:
            return VUserStatisticsRow(data);
          case SeatsRow:
            return SeatsRow(data);
          case VSeatAvailabilityRow:
            return VSeatAvailabilityRow(data);
          case SeatingZonesRow:
            return SeatingZonesRow(data);
          case VEventsListRow:
            return VEventsListRow(data);
          case PaymentProvidersRow:
            return PaymentProvidersRow(data);
          case CustomRegistrationFieldsRow:
            return CustomRegistrationFieldsRow(data);
          case AppConstantTranslationsRow:
            return AppConstantTranslationsRow(data);
          case VEventStatsRow:
            return VEventStatsRow(data);
          case VDtTrendingEventsRow:
            return VDtTrendingEventsRow(data);
          case RegistrationTicketsRow:
            return RegistrationTicketsRow(data);
          case ArticlesRow:
            return ArticlesRow(data);
          case VRegistrationDetailsRow:
            return VRegistrationDetailsRow(data);
          case EventsRow:
            return EventsRow(data);
          case CommentsRow:
            return CommentsRow(data);
          case UserInterestsRow:
            return UserInterestsRow(data);
          case UsersRow:
            return UsersRow(data);
          case ApiKeysRow:
            return ApiKeysRow(data);
          case AppConstantsRow:
            return AppConstantsRow(data);
          case UserFavoritesRow:
            return UserFavoritesRow(data);
          case RegistrationsRow:
            return RegistrationsRow(data);
          case VDtCommentsRow:
            return VDtCommentsRow(data);
          case VAppConstantsSmartRow:
            return VAppConstantsSmartRow(data);
          case VDtCategoriesRow:
            return VDtCategoriesRow(data);
          case CategoriesRow:
            return CategoriesRow(data);
          case VTicketTypesDetailRow:
            return VTicketTypesDetailRow(data);
          case VNotificationsRow:
            return VNotificationsRow(data);
          case VenuesRow:
            return VenuesRow(data);
          case NotificationsRow:
            return NotificationsRow(data);
          case InvoiceSettingsRow:
            return InvoiceSettingsRow(data);
          case VEventsCompleteRow:
            return VEventsCompleteRow(data);
          case VDtTicketsRow:
            return VDtTicketsRow(data);
          default:
            return null;
        }

      case ParamType.DataStruct:
        final data = json.decode(param) as Map<String, dynamic>? ?? {};
        return structBuilder != null ? structBuilder(data) : null;

      default:
        return null;
    }
  } catch (e) {
    print('Error deserializing parameter: $e');
    return null;
  }
}
