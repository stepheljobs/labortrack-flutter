import '../database.dart';

class AttendanceRecordTable extends SupabaseTable<AttendanceRecordRow> {
  @override
  String get tableName => 'attendance_record';

  @override
  AttendanceRecordRow createRow(Map<String, dynamic> data) =>
      AttendanceRecordRow(data);
}

class AttendanceRecordRow extends SupabaseDataRow {
  AttendanceRecordRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AttendanceRecordTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get companyCode => getField<String>('company_code')!;
  set companyCode(String value) => setField<String>('company_code', value);

  String get employeeId => getField<String>('employee_id')!;
  set employeeId(String value) => setField<String>('employee_id', value);

  double? get cashAdvance => getField<double>('cash_advance');
  set cashAdvance(double? value) => setField<double>('cash_advance', value);

  double get netPay => getField<double>('net_pay')!;
  set netPay(double value) => setField<double>('net_pay', value);

  double? get otHour => getField<double>('ot_hour');
  set otHour(double? value) => setField<double>('ot_hour', value);

  String get projectName => getField<String>('project_name')!;
  set projectName(String value) => setField<String>('project_name', value);

  double? get reimbursement => getField<double>('reimbursement');
  set reimbursement(double? value) => setField<double>('reimbursement', value);

  List<dynamic> get selectedDays => getListField<dynamic>('selected_days ')!;
  set selectedDays(List<dynamic> value) =>
      setListField<dynamic>('selected_days ', value);

  String get weekNo => getField<String>('week_no')!;
  set weekNo(String value) => setField<String>('week_no', value);
}
