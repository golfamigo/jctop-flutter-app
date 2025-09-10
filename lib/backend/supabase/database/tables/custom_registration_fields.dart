import '../database.dart';

class CustomRegistrationFieldsTable
    extends SupabaseTable<CustomRegistrationFieldsRow> {
  @override
  String get tableName => 'custom_registration_fields';

  @override
  CustomRegistrationFieldsRow createRow(Map<String, dynamic> data) =>
      CustomRegistrationFieldsRow(data);
}

class CustomRegistrationFieldsRow extends SupabaseDataRow {
  CustomRegistrationFieldsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CustomRegistrationFieldsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get eventId => getField<String>('event_id');
  set eventId(String? value) => setField<String>('event_id', value);

  String get fieldName => getField<String>('field_name')!;
  set fieldName(String value) => setField<String>('field_name', value);

  String get fieldType => getField<String>('field_type')!;
  set fieldType(String value) => setField<String>('field_type', value);

  String get fieldLabel => getField<String>('field_label')!;
  set fieldLabel(String value) => setField<String>('field_label', value);

  bool? get isRequired => getField<bool>('is_required');
  set isRequired(bool? value) => setField<bool>('is_required', value);

  dynamic get fieldOptions => getField<dynamic>('field_options');
  set fieldOptions(dynamic value) => setField<dynamic>('field_options', value);

  int? get displayOrder => getField<int>('display_order');
  set displayOrder(int? value) => setField<int>('display_order', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
