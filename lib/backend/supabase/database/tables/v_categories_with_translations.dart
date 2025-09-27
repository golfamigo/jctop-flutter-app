import '../database.dart';

class VCategoriesWithTranslationsTable
    extends SupabaseTable<VCategoriesWithTranslationsRow> {
  @override
  String get tableName => 'v_categories_with_translations';

  @override
  VCategoriesWithTranslationsRow createRow(Map<String, dynamic> data) =>
      VCategoriesWithTranslationsRow(data);
}

class VCategoriesWithTranslationsRow extends SupabaseDataRow {
  VCategoriesWithTranslationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VCategoriesWithTranslationsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get slug => getField<String>('slug');
  set slug(String? value) => setField<String>('slug', value);

  String? get icon => getField<String>('icon');
  set icon(String? value) => setField<String>('icon', value);

  String? get color => getField<String>('color');
  set color(String? value) => setField<String>('color', value);

  String? get img => getField<String>('img');
  set img(String? value) => setField<String>('img', value);

  int? get sortOrder => getField<int>('sort_order');
  set sortOrder(int? value) => setField<int>('sort_order', value);

  bool? get isActive => getField<bool>('is_active');
  set isActive(bool? value) => setField<bool>('is_active', value);

  int? get eventCount => getField<int>('event_count');
  set eventCount(int? value) => setField<int>('event_count', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get languageCode => getField<String>('language_code');
  set languageCode(String? value) => setField<String>('language_code', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
