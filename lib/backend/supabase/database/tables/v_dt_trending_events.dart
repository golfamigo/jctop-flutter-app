import '../database.dart';

class VDtTrendingEventsTable extends SupabaseTable<VDtTrendingEventsRow> {
  @override
  String get tableName => 'v_dt_trending_events';

  @override
  VDtTrendingEventsRow createRow(Map<String, dynamic> data) =>
      VDtTrendingEventsRow(data);
}

class VDtTrendingEventsRow extends SupabaseDataRow {
  VDtTrendingEventsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VDtTrendingEventsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  double? get price => getField<double>('price');
  set price(double? value) => setField<double>('price', value);

  String? get category => getField<String>('category');
  set category(String? value) => setField<String>('category', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get img => getField<String>('img');
  set img(String? value) => setField<String>('img', value);
}
