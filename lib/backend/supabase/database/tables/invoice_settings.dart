import '../database.dart';

class InvoiceSettingsTable extends SupabaseTable<InvoiceSettingsRow> {
  @override
  String get tableName => 'invoice_settings';

  @override
  InvoiceSettingsRow createRow(Map<String, dynamic> data) =>
      InvoiceSettingsRow(data);
}

class InvoiceSettingsRow extends SupabaseDataRow {
  InvoiceSettingsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => InvoiceSettingsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get organizerId => getField<String>('organizer_id');
  set organizerId(String? value) => setField<String>('organizer_id', value);

  String? get companyName => getField<String>('company_name');
  set companyName(String? value) => setField<String>('company_name', value);

  String? get taxId => getField<String>('tax_id');
  set taxId(String? value) => setField<String>('tax_id', value);

  String? get address => getField<String>('address');
  set address(String? value) => setField<String>('address', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get logoUrl => getField<String>('logo_url');
  set logoUrl(String? value) => setField<String>('logo_url', value);

  String? get footerText => getField<String>('footer_text');
  set footerText(String? value) => setField<String>('footer_text', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
