import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EmployeesRecord extends FirestoreRecord {
  EmployeesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "assignProject" field.
  String? _assignProject;
  String get assignProject => _assignProject ?? '';
  bool hasAssignProject() => _assignProject != null;

  // "company_id" field.
  String? _companyId;
  String get companyId => _companyId ?? '';
  bool hasCompanyId() => _companyId != null;

  // "firstName" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "lastName" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "gcash" field.
  String? _gcash;
  String get gcash => _gcash ?? '';
  bool hasGcash() => _gcash != null;

  // "position" field.
  String? _position;
  String get position => _position ?? '';
  bool hasPosition() => _position != null;

  // "rate" field.
  String? _rate;
  String get rate => _rate ?? '';
  bool hasRate() => _rate != null;

  void _initializeFields() {
    _assignProject = snapshotData['assignProject'] as String?;
    _companyId = snapshotData['company_id'] as String?;
    _firstName = snapshotData['firstName'] as String?;
    _lastName = snapshotData['lastName'] as String?;
    _gcash = snapshotData['gcash'] as String?;
    _position = snapshotData['position'] as String?;
    _rate = snapshotData['rate'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('employees');

  static Stream<EmployeesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EmployeesRecord.fromSnapshot(s));

  static Future<EmployeesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EmployeesRecord.fromSnapshot(s));

  static EmployeesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EmployeesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EmployeesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EmployeesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EmployeesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EmployeesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEmployeesRecordData({
  String? assignProject,
  String? companyId,
  String? firstName,
  String? lastName,
  String? gcash,
  String? position,
  String? rate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'assignProject': assignProject,
      'company_id': companyId,
      'firstName': firstName,
      'lastName': lastName,
      'gcash': gcash,
      'position': position,
      'rate': rate,
    }.withoutNulls,
  );

  return firestoreData;
}

class EmployeesRecordDocumentEquality implements Equality<EmployeesRecord> {
  const EmployeesRecordDocumentEquality();

  @override
  bool equals(EmployeesRecord? e1, EmployeesRecord? e2) {
    return e1?.assignProject == e2?.assignProject &&
        e1?.companyId == e2?.companyId &&
        e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.gcash == e2?.gcash &&
        e1?.position == e2?.position &&
        e1?.rate == e2?.rate;
  }

  @override
  int hash(EmployeesRecord? e) => const ListEquality().hash([
        e?.assignProject,
        e?.companyId,
        e?.firstName,
        e?.lastName,
        e?.gcash,
        e?.position,
        e?.rate
      ]);

  @override
  bool isValidKey(Object? o) => o is EmployeesRecord;
}
