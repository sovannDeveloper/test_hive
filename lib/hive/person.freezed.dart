// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'person.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Person _$PersonFromJson(Map<String, dynamic> json) {
  return _Person.fromJson(json);
}

/// @nodoc
mixin _$Person {
  @JsonKey(name: 'Name')
  @HiveField(0)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'Age')
  @HiveField(1)
  int? get age => throw _privateConstructorUsedError;
  @JsonKey(name: 'MessageKeys')
  @HiveField(2)
  List<String>? get messageKeys => throw _privateConstructorUsedError;
  @JsonKey(name: 'Type')
  @HiveField(3)
  String? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PersonCopyWith<Person> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonCopyWith<$Res> {
  factory $PersonCopyWith(Person value, $Res Function(Person) then) =
      _$PersonCopyWithImpl<$Res, Person>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Name') @HiveField(0) String? name,
      @JsonKey(name: 'Age') @HiveField(1) int? age,
      @JsonKey(name: 'MessageKeys') @HiveField(2) List<String>? messageKeys,
      @JsonKey(name: 'Type') @HiveField(3) String? type});
}

/// @nodoc
class _$PersonCopyWithImpl<$Res, $Val extends Person>
    implements $PersonCopyWith<$Res> {
  _$PersonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? age = freezed,
    Object? messageKeys = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      messageKeys: freezed == messageKeys
          ? _value.messageKeys
          : messageKeys // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersonImplCopyWith<$Res> implements $PersonCopyWith<$Res> {
  factory _$$PersonImplCopyWith(
          _$PersonImpl value, $Res Function(_$PersonImpl) then) =
      __$$PersonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Name') @HiveField(0) String? name,
      @JsonKey(name: 'Age') @HiveField(1) int? age,
      @JsonKey(name: 'MessageKeys') @HiveField(2) List<String>? messageKeys,
      @JsonKey(name: 'Type') @HiveField(3) String? type});
}

/// @nodoc
class __$$PersonImplCopyWithImpl<$Res>
    extends _$PersonCopyWithImpl<$Res, _$PersonImpl>
    implements _$$PersonImplCopyWith<$Res> {
  __$$PersonImplCopyWithImpl(
      _$PersonImpl _value, $Res Function(_$PersonImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? age = freezed,
    Object? messageKeys = freezed,
    Object? type = freezed,
  }) {
    return _then(_$PersonImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      messageKeys: freezed == messageKeys
          ? _value._messageKeys
          : messageKeys // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonImpl implements _Person {
  const _$PersonImpl(
      {@JsonKey(name: 'Name') @HiveField(0) this.name,
      @JsonKey(name: 'Age') @HiveField(1) this.age,
      @JsonKey(name: 'MessageKeys')
      @HiveField(2)
      final List<String>? messageKeys,
      @JsonKey(name: 'Type') @HiveField(3) this.type})
      : _messageKeys = messageKeys;

  factory _$PersonImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonImplFromJson(json);

  @override
  @JsonKey(name: 'Name')
  @HiveField(0)
  final String? name;
  @override
  @JsonKey(name: 'Age')
  @HiveField(1)
  final int? age;
  final List<String>? _messageKeys;
  @override
  @JsonKey(name: 'MessageKeys')
  @HiveField(2)
  List<String>? get messageKeys {
    final value = _messageKeys;
    if (value == null) return null;
    if (_messageKeys is EqualUnmodifiableListView) return _messageKeys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'Type')
  @HiveField(3)
  final String? type;

  @override
  String toString() {
    return 'Person(name: $name, age: $age, messageKeys: $messageKeys, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.age, age) || other.age == age) &&
            const DeepCollectionEquality()
                .equals(other._messageKeys, _messageKeys) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, age,
      const DeepCollectionEquality().hash(_messageKeys), type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonImplCopyWith<_$PersonImpl> get copyWith =>
      __$$PersonImplCopyWithImpl<_$PersonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonImplToJson(
      this,
    );
  }
}

abstract class _Person implements Person {
  const factory _Person(
      {@JsonKey(name: 'Name') @HiveField(0) final String? name,
      @JsonKey(name: 'Age') @HiveField(1) final int? age,
      @JsonKey(name: 'MessageKeys')
      @HiveField(2)
      final List<String>? messageKeys,
      @JsonKey(name: 'Type') @HiveField(3) final String? type}) = _$PersonImpl;

  factory _Person.fromJson(Map<String, dynamic> json) = _$PersonImpl.fromJson;

  @override
  @JsonKey(name: 'Name')
  @HiveField(0)
  String? get name;
  @override
  @JsonKey(name: 'Age')
  @HiveField(1)
  int? get age;
  @override
  @JsonKey(name: 'MessageKeys')
  @HiveField(2)
  List<String>? get messageKeys;
  @override
  @JsonKey(name: 'Type')
  @HiveField(3)
  String? get type;
  @override
  @JsonKey(ignore: true)
  _$$PersonImplCopyWith<_$PersonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
