import '../database.dart';

class PaymentProvidersTable extends SupabaseTable<PaymentProvidersRow> {
  @override
  String get tableName => 'payment_providers';

  @override
  PaymentProvidersRow createRow(Map<String, dynamic> data) =>
      PaymentProvidersRow(data);
}

class PaymentProvidersRow extends SupabaseDataRow {
  PaymentProvidersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PaymentProvidersTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get organizerId => getField<String>('organizer_id');
  set organizerId(String? value) => setField<String>('organizer_id', value);

  String get providerType => getField<String>('provider_type')!;
  set providerType(String value) => setField<String>('provider_type', value);

  dynamic get credentials => getField<dynamic>('credentials')!;
  set credentials(dynamic value) => setField<dynamic>('credentials', value);

  bool? get isActive => getField<bool>('is_active');
  set isActive(bool? value) => setField<bool>('is_active', value);

  bool? get isDefault => getField<bool>('is_default');
  set isDefault(bool? value) => setField<bool>('is_default', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
