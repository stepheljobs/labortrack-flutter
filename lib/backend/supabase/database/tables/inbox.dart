import '../database.dart';

class InboxTable extends SupabaseTable<InboxRow> {
  @override
  String get tableName => 'inbox';

  @override
  InboxRow createRow(Map<String, dynamic> data) => InboxRow(data);
}

class InboxRow extends SupabaseDataRow {
  InboxRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => InboxTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get companyCode => getField<String>('company_code')!;
  set companyCode(String value) => setField<String>('company_code', value);

  String get projectName => getField<String>('project_name')!;
  set projectName(String value) => setField<String>('project_name', value);

  String get message => getField<String>('message')!;
  set message(String value) => setField<String>('message', value);

  String get senderId => getField<String>('sender_id')!;
  set senderId(String value) => setField<String>('sender_id', value);

  String get senderName => getField<String>('sender_name')!;
  set senderName(String value) => setField<String>('sender_name', value);

  String? get senderPhotoUrl => getField<String>('sender_photo_url');
  set senderPhotoUrl(String? value) =>
      setField<String>('sender_photo_url', value);
}
