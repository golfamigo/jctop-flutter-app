import '../database.dart';

class SeatReservationsTable extends SupabaseTable<SeatReservationsRow> {
  @override
  String get tableName => 'seat_reservations';

  @override
  SeatReservationsRow createRow(Map<String, dynamic> data) =>
      SeatReservationsRow(data);
}

class SeatReservationsRow extends SupabaseDataRow {
  SeatReservationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SeatReservationsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get seatId => getField<String>('seat_id')!;
  set seatId(String value) => setField<String>('seat_id', value);

  String get registrationId => getField<String>('registration_id')!;
  set registrationId(String value) =>
      setField<String>('registration_id', value);

  String? get registrationTicketId =>
      getField<String>('registration_ticket_id');
  set registrationTicketId(String? value) =>
      setField<String>('registration_ticket_id', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  DateTime? get reservedAt => getField<DateTime>('reserved_at');
  set reservedAt(DateTime? value) => setField<DateTime>('reserved_at', value);

  DateTime? get confirmedAt => getField<DateTime>('confirmed_at');
  set confirmedAt(DateTime? value) => setField<DateTime>('confirmed_at', value);

  DateTime? get cancelledAt => getField<DateTime>('cancelled_at');
  set cancelledAt(DateTime? value) => setField<DateTime>('cancelled_at', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
