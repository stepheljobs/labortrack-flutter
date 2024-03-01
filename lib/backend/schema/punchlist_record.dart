import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PunchlistRecord extends FirestoreRecord {
  PunchlistRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ImgPath" field.
  List<String>? _imgPath;
  List<String> get imgPath => _imgPath ?? const [];
  bool hasImgPath() => _imgPath != null;

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  bool hasNotes() => _notes != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "project_name" field.
  String? _projectName;
  String get projectName => _projectName ?? '';
  bool hasProjectName() => _projectName != null;

  // "posted_by" field.
  String? _postedBy;
  String get postedBy => _postedBy ?? '';
  bool hasPostedBy() => _postedBy != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  bool hasDate() => _date != null;

  // "company_id" field.
  String? _companyId;
  String get companyId => _companyId ?? '';
  bool hasCompanyId() => _companyId != null;

  void _initializeFields() {
    _imgPath = getDataList(snapshotData['ImgPath']);
    _notes = snapshotData['notes'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _projectName = snapshotData['project_name'] as String?;
    _postedBy = snapshotData['posted_by'] as String?;
    _date = snapshotData['date'] as String?;
    _companyId = snapshotData['company_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('punchlist');

  static Stream<PunchlistRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PunchlistRecord.fromSnapshot(s));

  static Future<PunchlistRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PunchlistRecord.fromSnapshot(s));

  static PunchlistRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PunchlistRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PunchlistRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PunchlistRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PunchlistRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PunchlistRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPunchlistRecordData({
  String? notes,
  DateTime? createdTime,
  String? projectName,
  String? postedBy,
  String? date,
  String? companyId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'notes': notes,
      'created_time': createdTime,
      'project_name': projectName,
      'posted_by': postedBy,
      'date': date,
      'company_id': companyId,
    }.withoutNulls,
  );

  return firestoreData;
}

class PunchlistRecordDocumentEquality implements Equality<PunchlistRecord> {
  const PunchlistRecordDocumentEquality();

  @override
  bool equals(PunchlistRecord? e1, PunchlistRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.imgPath, e2?.imgPath) &&
        e1?.notes == e2?.notes &&
        e1?.createdTime == e2?.createdTime &&
        e1?.projectName == e2?.projectName &&
        e1?.postedBy == e2?.postedBy &&
        e1?.date == e2?.date &&
        e1?.companyId == e2?.companyId;
  }

  @override
  int hash(PunchlistRecord? e) => const ListEquality().hash([
        e?.imgPath,
        e?.notes,
        e?.createdTime,
        e?.projectName,
        e?.postedBy,
        e?.date,
        e?.companyId
      ]);

  @override
  bool isValidKey(Object? o) => o is PunchlistRecord;
}
