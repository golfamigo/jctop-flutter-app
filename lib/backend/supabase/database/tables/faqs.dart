import '../database.dart';

class FaqsTable extends SupabaseTable<FaqsRow> {
  @override
  String get tableName => 'faqs';

  @override
  FaqsRow createRow(Map<String, dynamic> data) => FaqsRow(data);
}

class FaqsRow extends SupabaseDataRow {
  FaqsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FaqsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get question => getField<String>('question')!;
  set question(String value) => setField<String>('question', value);

  String get answer => getField<String>('answer')!;
  set answer(String value) => setField<String>('answer', value);

  String? get category => getField<String>('category');
  set category(String? value) => setField<String>('category', value);

  int? get displayOrder => getField<int>('display_order');
  set displayOrder(int? value) => setField<int>('display_order', value);

  bool? get isActive => getField<bool>('is_active');
  set isActive(bool? value) => setField<bool>('is_active', value);

  String? get languageCode => getField<String>('language_code');
  set languageCode(String? value) => setField<String>('language_code', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
