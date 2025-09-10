import '../database.dart';

class TicketTypesTable extends SupabaseTable<TicketTypesRow> {
  @override
  String get tableName => 'ticket_types';

  @override
  TicketTypesRow createRow(Map<String, dynamic> data) => TicketTypesRow(data);
}

class TicketTypesRow extends SupabaseDataRow {
  TicketTypesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TicketTypesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get eventId => getField<String>('event_id');
  set eventId(String? value) => setField<String>('event_id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  double? get price => getField<double>('price');
  set price(double? value) => setField<double>('price', value);

  int get quantity => getField<int>('quantity')!;
  set quantity(int value) => setField<int>('quantity', value);

  int? get soldCount => getField<int>('sold_count');
  set soldCount(int? value) => setField<int>('sold_count', value);

  String? get color => getField<String>('color');
  set color(String? value) => setField<String>('color', value);

  String? get icon => getField<String>('icon');
  set icon(String? value) => setField<String>('icon', value);

  int? get displayOrder => getField<int>('display_order');
  set displayOrder(int? value) => setField<int>('display_order', value);

  bool? get isActive => getField<bool>('is_active');
  set isActive(bool? value) => setField<bool>('is_active', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  int? get maxPerUser => getField<int>('max_per_user');
  set maxPerUser(int? value) => setField<int>('max_per_user', value);
}
