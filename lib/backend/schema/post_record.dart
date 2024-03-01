import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostRecord extends FirestoreRecord {
  PostRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "project_name" field.
  String? _projectName;
  String get projectName => _projectName ?? '';
  bool hasProjectName() => _projectName != null;

  // "posted_by" field.
  String? _postedBy;
  String get postedBy => _postedBy ?? '';
  bool hasPostedBy() => _postedBy != null;

  // "company_id" field.
  String? _companyId;
  String get companyId => _companyId ?? '';
  bool hasCompanyId() => _companyId != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  bool hasNotes() => _notes != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  bool hasDate() => _date != null;

  // "ImgPath" field.
  String? _imgPath;
  String get imgPath => _imgPath ?? '';
  bool hasImgPath() => _imgPath != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "note_employee" field.
  List<String>? _noteEmployee;
  List<String> get noteEmployee => _noteEmployee ?? const [];
  bool hasNoteEmployee() => _noteEmployee != null;

  void _initializeFields() {
    _projectName = snapshotData['project_name'] as String?;
    _postedBy = snapshotData['posted_by'] as String?;
    _companyId = snapshotData['company_id'] as String?;
    _status = snapshotData['status'] as String?;
    _location = snapshotData['location'] as String?;
    _notes = snapshotData['notes'] as String?;
    _date = snapshotData['date'] as String?;
    _imgPath = snapshotData['ImgPath'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _noteEmployee = getDataList(snapshotData['note_employee']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('post');

  static Stream<PostRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostRecord.fromSnapshot(s));

  static Future<PostRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostRecord.fromSnapshot(s));

  static PostRecord fromSnapshot(DocumentSnapshot snapshot) => PostRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostRecordData({
  String? projectName,
  String? postedBy,
  String? companyId,
  String? status,
  String? location,
  String? notes,
  String? date,
  String? imgPath,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'project_name': projectName,
      'posted_by': postedBy,
      'company_id': companyId,
      'status': status,
      'location': location,
      'notes': notes,
      'date': date,
      'ImgPath': imgPath,
      'created_time': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostRecordDocumentEquality implements Equality<PostRecord> {
  const PostRecordDocumentEquality();

  @override
  bool equals(PostRecord? e1, PostRecord? e2) {
    const listEquality = ListEquality();
    return e1?.projectName == e2?.projectName &&
        e1?.postedBy == e2?.postedBy &&
        e1?.companyId == e2?.companyId &&
        e1?.status == e2?.status &&
        e1?.location == e2?.location &&
        e1?.notes == e2?.notes &&
        e1?.date == e2?.date &&
        e1?.imgPath == e2?.imgPath &&
        e1?.createdTime == e2?.createdTime &&
        listEquality.equals(e1?.noteEmployee, e2?.noteEmployee);
  }

  @override
  int hash(PostRecord? e) => const ListEquality().hash([
        e?.projectName,
        e?.postedBy,
        e?.companyId,
        e?.status,
        e?.location,
        e?.notes,
        e?.date,
        e?.imgPath,
        e?.createdTime,
        e?.noteEmployee
      ]);

  @override
  bool isValidKey(Object? o) => o is PostRecord;
}
