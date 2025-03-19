import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'object_box/task.dart';
import 'objectbox.g.dart';

late Store store;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Get a directory for the database
  final appDir = await getApplicationDocumentsDirectory();
  final dbDir = path.join(appDir.path, "task_manager_db");

  // Create the store
  store = await openStore(directory: dbDir);

  runApp(TaskManagerApp());
}

class TaskManagerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TaskListScreen(),
    );
  }
}

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final fake = Faker();
  late Box<Task> taskBox;
  late Stream<Query<Task>> queryStream;
  bool val = false;
  bool sort = false;

  @override
  void initState() {
    super.initState();

    taskBox = store.box<Task>();
    queryStream = taskBox
        .query(Task_.isCompleted.equals(val))
        .order(Task_.id, flags: sort ? Order.descending : Order.caseSensitive)
        .watch(triggerImmediately: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Manager'),
        actions: [
          Switch(
            value: val,
            onChanged: (value) {
              val = value;
              queryStream = taskBox
                  .query(Task_.isCompleted.equals(val))
                  .order(Task_.id, flags: sort ? Order.descending : Order.caseSensitive)
                  .watch(triggerImmediately: true);
              setState(() {});
            },
          ),
          IconButton(
            icon: Icon(Icons.sort),
            onPressed: () {
              sort = !sort;
              queryStream = taskBox
                  .query(Task_.isCompleted.equals(val))
                  .order(Task_.id, flags: sort ? Order.descending : Order.caseSensitive)
                  .watch(triggerImmediately: true);
              setState(() {});
            },
          ),
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {
              taskBox.removeAll();
            },
          ),
        ],
      ),
      body: StreamBuilder<Query<Task>>(
        stream: queryStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final tasks = snapshot.data!.find();

          if (tasks.isEmpty) {
            return Center(child: Text('No tasks yet. Add some!'));
          }

          return ListView.builder(
            padding: const EdgeInsets.only(bottom: 100, top: 16),
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return ListTile(
                leading: Checkbox(
                  value: task.isCompleted,
                  onChanged: (bool? value) {
                    task.isCompleted = value ?? false;
                    taskBox.put(task);
                  },
                ),
                title: Text(
                  '${task.id} - ${task.title}',
                  style: TextStyle(
                    decoration: task.isCompleted ? TextDecoration.lineThrough : null,
                  ),
                ),
                subtitle: Text(task.description),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    taskBox.remove(task.id);
                  },
                ),
                onTap: () {
                  _showEditTaskDialog(context, task);
                },
              );
            },
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'addRandom',
            child: Icon(Icons.auto_awesome),
            backgroundColor: Colors.amber,
            onPressed: () {
              // Add a random task
              for (int i = 0; i < 100; i++) {
                final task = Task(
                  title: fake.person.name(),
                  description: fake.lorem.sentence(),
                  isCompleted: true,
                );
                taskBox.put(task);
              }
            },
          ),
        ],
      ),
    );
  }

  void _showEditTaskDialog(BuildContext context, Task task) {
    task.title = fake.person.name();
    task.description = fake.lorem.sentence();
    taskBox.put(task);
  }
}
