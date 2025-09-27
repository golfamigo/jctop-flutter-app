import '../database.dart';

class VDtTicketsTable extends SupabaseTable<VDtTicketsRow> {
  @override
  String get tableName => 'v_dt_tickets';

  @override
  VDtTicketsRow createRow(Map<String, dynamic> data) => VDtTicketsRow(data);
}

class VDtTicketsRow extends SupabaseDataRow {
  VDtTicketsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VDtTicketsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get eventId => getField<String>('event_id');
  set eventId(String? value) => setField<String>('event_id', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  double? get price => getField<double>('price');
  set price(double? value) => setField<double>('price', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  int? get quantity => getField<int>('quantity');
  set quantity(int? value) => setField<int>('quantity', value);
}
