import '../database.dart';

class VenuesTable extends SupabaseTable<VenuesRow> {
  @override
  String get tableName => 'venues';

  @override
  VenuesRow createRow(Map<String, dynamic> data) => VenuesRow(data);
}

class VenuesRow extends SupabaseDataRow {
  VenuesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VenuesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String? get address => getField<String>('address');
  set address(String? value) => setField<String>('address', value);

  String? get city => getField<String>('city');
  set city(String? value) => setField<String>('city', value);

  int? get capacity => getField<int>('capacity');
  set capacity(int? value) => setField<int>('capacity', value);

  double? get latitude => getField<double>('latitude');
  set latitude(double? value) => setField<double>('latitude', value);

  double? get longitude => getField<double>('longitude');
  set longitude(double? value) => setField<double>('longitude', value);

  dynamic? get amenities => getField<dynamic>('amenities');
  set amenities(dynamic? value) => setField<dynamic>('amenities', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
