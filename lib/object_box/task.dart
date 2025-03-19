import 'package:objectbox/objectbox.dart';

@Entity()
class Category {
  @Id()
  int id = 0;

  String name;

  @Backlink('category')
  final tasks = ToMany<Task>();

  Category({
    required this.name,
  });
}

@Entity()
class Task {
  @Id()
  int id = 0;

  String title;
  String description;
  bool isCompleted;

  final category = ToOne<Category>();

  Task({
    required this.title,
    required this.description,
    required this.isCompleted,
  });
}
