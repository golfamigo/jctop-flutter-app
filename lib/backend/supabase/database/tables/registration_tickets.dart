import '../database.dart';

class RegistrationTicketsTable extends SupabaseTable<RegistrationTicketsRow> {
  @override
  String get tableName => 'registration_tickets';

  @override
  RegistrationTicketsRow createRow(Map<String, dynamic> data) =>
      RegistrationTicketsRow(data);
}

class RegistrationTicketsRow extends SupabaseDataRow {
  RegistrationTicketsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RegistrationTicketsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get registrationId => getField<String>('registration_id')!;
  set registrationId(String value) =>
      setField<String>('registration_id', value);

  String get ticketTypeId => getField<String>('ticket_type_id')!;
  set ticketTypeId(String value) => setField<String>('ticket_type_id', value);

  int get quantity => getField<int>('quantity')!;
  set quantity(int value) => setField<int>('quantity', value);

  double get unitPrice => getField<double>('unit_price')!;
  set unitPrice(double value) => setField<double>('unit_price', value);

  double? get subtotal => getField<double>('subtotal');
  set subtotal(double? value) => setField<double>('subtotal', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
