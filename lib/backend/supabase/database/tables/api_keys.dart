import '../database.dart';

class ApiKeysTable extends SupabaseTable<ApiKeysRow> {
  @override
  String get tableName => 'api_keys';

  @override
  ApiKeysRow createRow(Map<String, dynamic> data) => ApiKeysRow(data);
}

class ApiKeysRow extends SupabaseDataRow {
  ApiKeysRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ApiKeysTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get serviceName => getField<String>('service_name')!;
  set serviceName(String value) => setField<String>('service_name', value);

  String get apiKeyValue => getField<String>('api_key_value')!;
  set apiKeyValue(String value) => setField<String>('api_key_value', value);

  bool? get isActive => getField<bool>('is_active');
  set isActive(bool? value) => setField<bool>('is_active', value);

  String? get environment => getField<String>('environment');
  set environment(String? value) => setField<String>('environment', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
