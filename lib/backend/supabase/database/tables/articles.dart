import '../database.dart';

class ArticlesTable extends SupabaseTable<ArticlesRow> {
  @override
  String get tableName => 'articles';

  @override
  ArticlesRow createRow(Map<String, dynamic> data) => ArticlesRow(data);
}

class ArticlesRow extends SupabaseDataRow {
  ArticlesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ArticlesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get title => getField<String>('title')!;
  set title(String value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  DateTime? get publishedDate => getField<DateTime>('published_date');
  set publishedDate(DateTime? value) =>
      setField<DateTime>('published_date', value);

  String? get tag => getField<String>('tag');
  set tag(String? value) => setField<String>('tag', value);

  String? get imageUrl => getField<String>('image_url');
  set imageUrl(String? value) => setField<String>('image_url', value);

  String? get authorId => getField<String>('author_id');
  set authorId(String? value) => setField<String>('author_id', value);

  bool? get isPublished => getField<bool>('is_published');
  set isPublished(bool? value) => setField<bool>('is_published', value);

  int? get viewCount => getField<int>('view_count');
  set viewCount(int? value) => setField<int>('view_count', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
