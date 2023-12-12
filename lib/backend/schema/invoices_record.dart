import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InvoicesRecord extends FirestoreRecord {
  InvoicesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "customerReference" field.
  DocumentReference? _customerReference;
  DocumentReference? get customerReference => _customerReference;
  bool hasCustomerReference() => _customerReference != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  bool hasUrl() => _url != null;

  // "number" field.
  String? _number;
  String get number => _number ?? '';
  bool hasNumber() => _number != null;

  // "paymentMethod" field.
  String? _paymentMethod;
  String get paymentMethod => _paymentMethod ?? '';
  bool hasPaymentMethod() => _paymentMethod != null;

  // "items" field.
  List<ItemStruct>? _items;
  List<ItemStruct> get items => _items ?? const [];
  bool hasItems() => _items != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  bool hasTotal() => _total != null;

  // "subtotal" field.
  double? _subtotal;
  double get subtotal => _subtotal ?? 0.0;
  bool hasSubtotal() => _subtotal != null;

  // "taxes" field.
  double? _taxes;
  double get taxes => _taxes ?? 0.0;
  bool hasTaxes() => _taxes != null;

  // "taxesPercentage" field.
  double? _taxesPercentage;
  double get taxesPercentage => _taxesPercentage ?? 0.0;
  bool hasTaxesPercentage() => _taxesPercentage != null;

  // "paymentDue" field.
  String? _paymentDue;
  String get paymentDue => _paymentDue ?? '';
  bool hasPaymentDue() => _paymentDue != null;

  // "greetings" field.
  String? _greetings;
  String get greetings => _greetings ?? '';
  bool hasGreetings() => _greetings != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "customerName" field.
  String? _customerName;
  String get customerName => _customerName ?? '';
  bool hasCustomerName() => _customerName != null;

  // "customerAddress" field.
  String? _customerAddress;
  String get customerAddress => _customerAddress ?? '';
  bool hasCustomerAddress() => _customerAddress != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _customerReference =
        snapshotData['customerReference'] as DocumentReference?;
    _url = snapshotData['url'] as String?;
    _number = snapshotData['number'] as String?;
    _paymentMethod = snapshotData['paymentMethod'] as String?;
    _items = getStructList(
      snapshotData['items'],
      ItemStruct.fromMap,
    );
    _status = snapshotData['status'] as String?;
    _total = castToType<double>(snapshotData['total']);
    _subtotal = castToType<double>(snapshotData['subtotal']);
    _taxes = castToType<double>(snapshotData['taxes']);
    _taxesPercentage = castToType<double>(snapshotData['taxesPercentage']);
    _paymentDue = snapshotData['paymentDue'] as String?;
    _greetings = snapshotData['greetings'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _customerName = snapshotData['customerName'] as String?;
    _customerAddress = snapshotData['customerAddress'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('invoices')
          : FirebaseFirestore.instance.collectionGroup('invoices');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('invoices').doc();

  static Stream<InvoicesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InvoicesRecord.fromSnapshot(s));

  static Future<InvoicesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InvoicesRecord.fromSnapshot(s));

  static InvoicesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InvoicesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InvoicesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InvoicesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InvoicesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InvoicesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInvoicesRecordData({
  DocumentReference? createdBy,
  DateTime? createdAt,
  DocumentReference? customerReference,
  String? url,
  String? number,
  String? paymentMethod,
  String? status,
  double? total,
  double? subtotal,
  double? taxes,
  double? taxesPercentage,
  String? paymentDue,
  String? greetings,
  DateTime? date,
  String? customerName,
  String? customerAddress,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'createdBy': createdBy,
      'createdAt': createdAt,
      'customerReference': customerReference,
      'url': url,
      'number': number,
      'paymentMethod': paymentMethod,
      'status': status,
      'total': total,
      'subtotal': subtotal,
      'taxes': taxes,
      'taxesPercentage': taxesPercentage,
      'paymentDue': paymentDue,
      'greetings': greetings,
      'date': date,
      'customerName': customerName,
      'customerAddress': customerAddress,
    }.withoutNulls,
  );

  return firestoreData;
}

class InvoicesRecordDocumentEquality implements Equality<InvoicesRecord> {
  const InvoicesRecordDocumentEquality();

  @override
  bool equals(InvoicesRecord? e1, InvoicesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdBy == e2?.createdBy &&
        e1?.createdAt == e2?.createdAt &&
        e1?.customerReference == e2?.customerReference &&
        e1?.url == e2?.url &&
        e1?.number == e2?.number &&
        e1?.paymentMethod == e2?.paymentMethod &&
        listEquality.equals(e1?.items, e2?.items) &&
        e1?.status == e2?.status &&
        e1?.total == e2?.total &&
        e1?.subtotal == e2?.subtotal &&
        e1?.taxes == e2?.taxes &&
        e1?.taxesPercentage == e2?.taxesPercentage &&
        e1?.paymentDue == e2?.paymentDue &&
        e1?.greetings == e2?.greetings &&
        e1?.date == e2?.date &&
        e1?.customerName == e2?.customerName &&
        e1?.customerAddress == e2?.customerAddress;
  }

  @override
  int hash(InvoicesRecord? e) => const ListEquality().hash([
        e?.createdBy,
        e?.createdAt,
        e?.customerReference,
        e?.url,
        e?.number,
        e?.paymentMethod,
        e?.items,
        e?.status,
        e?.total,
        e?.subtotal,
        e?.taxes,
        e?.taxesPercentage,
        e?.paymentDue,
        e?.greetings,
        e?.date,
        e?.customerName,
        e?.customerAddress
      ]);

  @override
  bool isValidKey(Object? o) => o is InvoicesRecord;
}
