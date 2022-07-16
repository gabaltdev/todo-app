import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'usuario_record.g.dart';

abstract class UsuarioRecord
    implements Built<UsuarioRecord, UsuarioRecordBuilder> {
  static Serializer<UsuarioRecord> get serializer => _$usuarioRecordSerializer;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UsuarioRecordBuilder builder) => builder
    ..uid = ''
    ..displayName = ''
    ..photoUrl = ''
    ..phoneNumber = ''
    ..email = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Usuario');

  static Stream<UsuarioRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<UsuarioRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  UsuarioRecord._();
  factory UsuarioRecord([void Function(UsuarioRecordBuilder) updates]) =
      _$UsuarioRecord;

  static UsuarioRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createUsuarioRecordData({
  String uid,
  String displayName,
  String photoUrl,
  DateTime createdTime,
  String phoneNumber,
  String email,
}) =>
    serializers.toFirestore(
        UsuarioRecord.serializer,
        UsuarioRecord((u) => u
          ..uid = uid
          ..displayName = displayName
          ..photoUrl = photoUrl
          ..createdTime = createdTime
          ..phoneNumber = phoneNumber
          ..email = email));
