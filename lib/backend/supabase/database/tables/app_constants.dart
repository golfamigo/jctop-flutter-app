import '../database.dart';

class AppConstantsTable extends SupabaseTable<AppConstantsRow> {
  @override
  String get tableName => 'app_constants';

  @override
  AppConstantsRow createRow(Map<String, dynamic> data) => AppConstantsRow(data);
}

class AppConstantsRow extends SupabaseDataRow {
  AppConstantsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AppConstantsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get constantType => getField<String>('constant_type')!;
  set constantType(String value) => setField<String>('constant_type', value);

  String get constantKey => getField<String>('constant_key')!;
  set constantKey(String value) => setField<String>('constant_key', value);

  int? get displayOrder => getField<int>('display_order');
  set displayOrder(int? value) => setField<int>('display_order', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
