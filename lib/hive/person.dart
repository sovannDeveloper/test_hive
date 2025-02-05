import 'package:hive/hive.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'person.freezed.dart';
part 'person.g.dart';

@freezed
@HiveType(typeId: 1)
class Person with _$Person {
  const factory Person({
    @JsonKey(name: 'Name') @HiveField(0) String? name,
    @JsonKey(name: 'Age') @HiveField(1) int? age,
    @JsonKey(name: 'MessageKeys') @HiveField(2) List<String>? messageKeys,
    @JsonKey(name: 'Type') @HiveField(3) String? type,
  }) = _Person;

  factory Person.fromJson(Map<String, Object?> json) => _$PersonFromJson(json);
}
