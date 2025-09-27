import '../database.dart';

class AppConstantTranslationsTable
    extends SupabaseTable<AppConstantTranslationsRow> {
  @override
  String get tableName => 'app_constant_translations';

  @override
  AppConstantTranslationsRow createRow(Map<String, dynamic> data) =>
      AppConstantTranslationsRow(data);
}

class AppConstantTranslationsRow extends SupabaseDataRow {
  AppConstantTranslationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AppConstantTranslationsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get constantId => getField<String>('constant_id');
  set constantId(String? value) => setField<String>('constant_id', value);

  String get languageCode => getField<String>('language_code')!;
  set languageCode(String value) => setField<String>('language_code', value);

  String get displayText => getField<String>('display_text')!;
  set displayText(String value) => setField<String>('display_text', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
