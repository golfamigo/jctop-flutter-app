import '../database.dart';

class VDtCategoriesTable extends SupabaseTable<VDtCategoriesRow> {
  @override
  String get tableName => 'v_dt_categories';

  @override
  VDtCategoriesRow createRow(Map<String, dynamic> data) =>
      VDtCategoriesRow(data);
}

class VDtCategoriesRow extends SupabaseDataRow {
  VDtCategoriesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VDtCategoriesTable();

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get img => getField<String>('img');
  set img(String? value) => setField<String>('img', value);

  String? get icon => getField<String>('icon');
  set icon(String? value) => setField<String>('icon', value);

  String? get descr => getField<String>('descr');
  set descr(String? value) => setField<String>('descr', value);

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  int? get sortOrder => getField<int>('sort_order');
  set sortOrder(int? value) => setField<int>('sort_order', value);

  bool? get isActive => getField<bool>('is_active');
  set isActive(bool? value) => setField<bool>('is_active', value);

  int? get eventCount => getField<int>('event_count');
  set eventCount(int? value) => setField<int>('event_count', value);
}
