import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'message.g.dart';
part 'message.freezed.dart';

@HiveType(typeId: 2)
@freezed
class Message with _$Message {
  const factory Message({
    @JsonKey(name: "Content") @HiveField(0) String? content,
    @JsonKey(name: "DateSent") @HiveField(1) DateTime? dateSent,
    @JsonKey(name: "IsYou") @HiveField(2) bool? isYou,
  }) = _Message;

  factory Message.fromJson(Map<String, Object?> json) => _$MessageFromJson(json);
}
