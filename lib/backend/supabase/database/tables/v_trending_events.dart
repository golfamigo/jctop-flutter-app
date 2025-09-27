import '../database.dart';

class VTrendingEventsTable extends SupabaseTable<VTrendingEventsRow> {
  @override
  String get tableName => 'v_trending_events';

  @override
  VTrendingEventsRow createRow(Map<String, dynamic> data) =>
      VTrendingEventsRow(data);
}

class VTrendingEventsRow extends SupabaseDataRow {
  VTrendingEventsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VTrendingEventsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get title => getField<String>('Title');
  set title(String? value) => setField<String>('Title', value);

  String? get img => getField<String>('img');
  set img(String? value) => setField<String>('img', value);

  String? get category => getField<String>('Category');
  set category(String? value) => setField<String>('Category', value);

  String? get price => getField<String>('Price');
  set price(String? value) => setField<String>('Price', value);
}
