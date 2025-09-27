import '../database.dart';

class VDtEventsTable extends SupabaseTable<VDtEventsRow> {
  @override
  String get tableName => 'v_dt_events';

  @override
  VDtEventsRow createRow(Map<String, dynamic> data) => VDtEventsRow(data);
}

class VDtEventsRow extends SupabaseDataRow {
  VDtEventsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VDtEventsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get location => getField<String>('location');
  set location(String? value) => setField<String>('location', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  DateTime? get date => getField<DateTime>('date');
  set date(DateTime? value) => setField<DateTime>('date', value);

  double? get minPrice => getField<double>('min_price');
  set minPrice(double? value) => setField<double>('min_price', value);

  double? get maxPrice => getField<double>('max_price');
  set maxPrice(double? value) => setField<double>('max_price', value);

  double? get avgPrice => getField<double>('avg_price');
  set avgPrice(double? value) => setField<double>('avg_price', value);

  double? get rating => getField<double>('rating');
  set rating(double? value) => setField<double>('rating', value);

  String? get tag => getField<String>('tag');
  set tag(String? value) => setField<String>('tag', value);

  String? get img => getField<String>('img');
  set img(String? value) => setField<String>('img', value);

  String? get descr => getField<String>('descr');
  set descr(String? value) => setField<String>('descr', value);

  int? get tickets => getField<int>('tickets');
  set tickets(int? value) => setField<int>('tickets', value);

  int? get dayleft => getField<int>('dayleft');
  set dayleft(int? value) => setField<int>('dayleft', value);

  String? get ticketStatus => getField<String>('ticketStatus');
  set ticketStatus(String? value) => setField<String>('ticketStatus', value);

  String? get city => getField<String>('city');
  set city(String? value) => setField<String>('city', value);

  DateTime? get createdAt => getField<DateTime>('createdAt');
  set createdAt(DateTime? value) => setField<DateTime>('createdAt', value);

  int? get startHour => getField<int>('startHour');
  set startHour(int? value) => setField<int>('startHour', value);

  bool? get isFavorite => getField<bool>('isFavorite');
  set isFavorite(bool? value) => setField<bool>('isFavorite', value);
}
