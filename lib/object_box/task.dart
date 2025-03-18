import 'package:objectbox/objectbox.dart';

@Entity()
class Task {
  @Id()
  int id = 0;

  String title;
  String description;
  bool isCompleted;

  Task({
    required this.title,
    required this.description,
    required this.isCompleted,
  });
}
