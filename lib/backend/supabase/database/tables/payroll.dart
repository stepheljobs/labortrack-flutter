import '../database.dart';

class PayrollTable extends SupabaseTable<PayrollRow> {
  @override
  String get tableName => 'payroll';

  @override
  PayrollRow createRow(Map<String, dynamic> data) => PayrollRow(data);
}

class PayrollRow extends SupabaseDataRow {
  PayrollRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PayrollTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get companyCode => getField<String>('company_code');
  set companyCode(String? value) => setField<String>('company_code', value);

  String get projectName => getField<String>('project_name')!;
  set projectName(String value) => setField<String>('project_name', value);

  String get disbursement => getField<String>('disbursement')!;
  set disbursement(String value) => setField<String>('disbursement', value);

  String get status => getField<String>('status')!;
  set status(String value) => setField<String>('status', value);

  String get totalNetPay => getField<String>('total_net_pay')!;
  set totalNetPay(String value) => setField<String>('total_net_pay', value);

  String? get bankAccount => getField<String>('bank_account');
  set bankAccount(String? value) => setField<String>('bank_account', value);

  String get receiver => getField<String>('receiver')!;
  set receiver(String value) => setField<String>('receiver', value);

  String get weekNo => getField<String>('week_no')!;
  set weekNo(String value) => setField<String>('week_no', value);
}
