import '../database.dart';

class VEventsSimpleTable extends SupabaseTable<VEventsSimpleRow> {
  @override
  String get tableName => 'v_events_simple';

  @override
  VEventsSimpleRow createRow(Map<String, dynamic> data) =>
      VEventsSimpleRow(data);
}

class VEventsSimpleRow extends SupabaseDataRow {
  VEventsSimpleRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VEventsSimpleTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get img => getField<String>('img');
  set img(String? value) => setField<String>('img', value);

  String? get category => getField<String>('category');
  set category(String? value) => setField<String>('category', value);

  double? get price => getField<double>('price');
  set price(double? value) => setField<double>('price', value);
}
