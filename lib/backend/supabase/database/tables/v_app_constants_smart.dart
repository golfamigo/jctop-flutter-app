import '../database.dart';

class VAppConstantsSmartTable extends SupabaseTable<VAppConstantsSmartRow> {
  @override
  String get tableName => 'v_app_constants_smart';

  @override
  VAppConstantsSmartRow createRow(Map<String, dynamic> data) =>
      VAppConstantsSmartRow(data);
}

class VAppConstantsSmartRow extends SupabaseDataRow {
  VAppConstantsSmartRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VAppConstantsSmartTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get constantType => getField<String>('constant_type');
  set constantType(String? value) => setField<String>('constant_type', value);

  String? get constantKey => getField<String>('constant_key');
  set constantKey(String? value) => setField<String>('constant_key', value);

  int? get displayOrder => getField<int>('display_order');
  set displayOrder(int? value) => setField<int>('display_order', value);

  String? get originalLanguageCode =>
      getField<String>('original_language_code');
  set originalLanguageCode(String? value) =>
      setField<String>('original_language_code', value);

  String? get languageCode => getField<String>('language_code');
  set languageCode(String? value) => setField<String>('language_code', value);

  String? get displayText => getField<String>('display_text');
  set displayText(String? value) => setField<String>('display_text', value);
}
