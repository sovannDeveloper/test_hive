// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Message _$MessageFromJson(Map<String, dynamic> json) {
  return _Message.fromJson(json);
}

/// @nodoc
mixin _$Message {
  @JsonKey(name: "Content")
  @HiveField(0)
  String? get content => throw _privateConstructorUsedError;
  @JsonKey(name: "DateSent")
  @HiveField(1)
  DateTime? get dateSent => throw _privateConstructorUsedError;
  @JsonKey(name: "IsYou")
  @HiveField(2)
  bool? get isYou => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res, Message>;
  @useResult
  $Res call(
      {@JsonKey(name: "Content") @HiveField(0) String? content,
      @JsonKey(name: "DateSent") @HiveField(1) DateTime? dateSent,
      @JsonKey(name: "IsYou") @HiveField(2) bool? isYou});
}

/// @nodoc
class _$MessageCopyWithImpl<$Res, $Val extends Message>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = freezed,
    Object? dateSent = freezed,
    Object? isYou = freezed,
  }) {
    return _then(_value.copyWith(
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      dateSent: freezed == dateSent
          ? _value.dateSent
          : dateSent // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isYou: freezed == isYou
          ? _value.isYou
          : isYou // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageImplCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$$MessageImplCopyWith(
          _$MessageImpl value, $Res Function(_$MessageImpl) then) =
      __$$MessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Content") @HiveField(0) String? content,
      @JsonKey(name: "DateSent") @HiveField(1) DateTime? dateSent,
      @JsonKey(name: "IsYou") @HiveField(2) bool? isYou});
}

/// @nodoc
class __$$MessageImplCopyWithImpl<$Res>
    extends _$MessageCopyWithImpl<$Res, _$MessageImpl>
    implements _$$MessageImplCopyWith<$Res> {
  __$$MessageImplCopyWithImpl(
      _$MessageImpl _value, $Res Function(_$MessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = freezed,
    Object? dateSent = freezed,
    Object? isYou = freezed,
  }) {
    return _then(_$MessageImpl(
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      dateSent: freezed == dateSent
          ? _value.dateSent
          : dateSent // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isYou: freezed == isYou
          ? _value.isYou
          : isYou // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageImpl implements _Message {
  const _$MessageImpl(
      {@JsonKey(name: "Content") @HiveField(0) this.content,
      @JsonKey(name: "DateSent") @HiveField(1) this.dateSent,
      @JsonKey(name: "IsYou") @HiveField(2) this.isYou});

  factory _$MessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageImplFromJson(json);

  @override
  @JsonKey(name: "Content")
  @HiveField(0)
  final String? content;
  @override
  @JsonKey(name: "DateSent")
  @HiveField(1)
  final DateTime? dateSent;
  @override
  @JsonKey(name: "IsYou")
  @HiveField(2)
  final bool? isYou;

  @override
  String toString() {
    return 'Message(content: $content, dateSent: $dateSent, isYou: $isYou)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.dateSent, dateSent) ||
                other.dateSent == dateSent) &&
            (identical(other.isYou, isYou) || other.isYou == isYou));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, content, dateSent, isYou);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      __$$MessageImplCopyWithImpl<_$MessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageImplToJson(
      this,
    );
  }
}

abstract class _Message implements Message {
  const factory _Message(
      {@JsonKey(name: "Content") @HiveField(0) final String? content,
      @JsonKey(name: "DateSent") @HiveField(1) final DateTime? dateSent,
      @JsonKey(name: "IsYou") @HiveField(2) final bool? isYou}) = _$MessageImpl;

  factory _Message.fromJson(Map<String, dynamic> json) = _$MessageImpl.fromJson;

  @override
  @JsonKey(name: "Content")
  @HiveField(0)
  String? get content;
  @override
  @JsonKey(name: "DateSent")
  @HiveField(1)
  DateTime? get dateSent;
  @override
  @JsonKey(name: "IsYou")
  @HiveField(2)
  bool? get isYou;
  @override
  @JsonKey(ignore: true)
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
