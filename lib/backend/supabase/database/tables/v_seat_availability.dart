import '../database.dart';

class VSeatAvailabilityTable extends SupabaseTable<VSeatAvailabilityRow> {
  @override
  String get tableName => 'v_seat_availability';

  @override
  VSeatAvailabilityRow createRow(Map<String, dynamic> data) =>
      VSeatAvailabilityRow(data);
}

class VSeatAvailabilityRow extends SupabaseDataRow {
  VSeatAvailabilityRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VSeatAvailabilityTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get seatingZoneId => getField<String>('seating_zone_id');
  set seatingZoneId(String? value) =>
      setField<String>('seating_zone_id', value);

  String? get seatCode => getField<String>('seat_code');
  set seatCode(String? value) => setField<String>('seat_code', value);

  String? get rowCode => getField<String>('row_code');
  set rowCode(String? value) => setField<String>('row_code', value);

  int? get columnNumber => getField<int>('column_number');
  set columnNumber(int? value) => setField<int>('column_number', value);

  String? get seatType => getField<String>('seat_type');
  set seatType(String? value) => setField<String>('seat_type', value);

  bool? get isAvailable => getField<bool>('is_available');
  set isAvailable(bool? value) => setField<bool>('is_available', value);

  bool? get isBlocked => getField<bool>('is_blocked');
  set isBlocked(bool? value) => setField<bool>('is_blocked', value);

  String? get blockedReason => getField<String>('blocked_reason');
  set blockedReason(String? value) => setField<String>('blocked_reason', value);

  dynamic? get metadata => getField<dynamic>('metadata');
  set metadata(dynamic? value) => setField<dynamic>('metadata', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get zoneName => getField<String>('zone_name');
  set zoneName(String? value) => setField<String>('zone_name', value);

  String? get eventId => getField<String>('event_id');
  set eventId(String? value) => setField<String>('event_id', value);

  String? get eventTitle => getField<String>('event_title');
  set eventTitle(String? value) => setField<String>('event_title', value);

  String? get registrationId => getField<String>('registration_id');
  set registrationId(String? value) =>
      setField<String>('registration_id', value);

  String? get reservationStatus => getField<String>('reservation_status');
  set reservationStatus(String? value) =>
      setField<String>('reservation_status', value);

  String? get reservedByName => getField<String>('reserved_by_name');
  set reservedByName(String? value) =>
      setField<String>('reserved_by_name', value);
}
