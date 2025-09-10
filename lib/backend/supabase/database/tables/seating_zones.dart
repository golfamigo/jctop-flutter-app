import '../database.dart';

class SeatingZonesTable extends SupabaseTable<SeatingZonesRow> {
  @override
  String get tableName => 'seating_zones';

  @override
  SeatingZonesRow createRow(Map<String, dynamic> data) => SeatingZonesRow(data);
}

class SeatingZonesRow extends SupabaseDataRow {
  SeatingZonesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SeatingZonesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get eventId => getField<String>('event_id');
  set eventId(String? value) => setField<String>('event_id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  int get capacity => getField<int>('capacity')!;
  set capacity(int value) => setField<int>('capacity', value);

  double? get priceModifier => getField<double>('price_modifier');
  set priceModifier(double? value) => setField<double>('price_modifier', value);

  dynamic get layoutData => getField<dynamic>('layout_data');
  set layoutData(dynamic value) => setField<dynamic>('layout_data', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
