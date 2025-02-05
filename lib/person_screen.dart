import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_hive/context.dart';
import 'package:test_hive/hive/person.dart';
import 'package:uuid/uuid.dart';

import 'hive/message.dart';
import 'util.dart';
import 'message.dart';

class PersonScreen extends StatefulWidget {
  const PersonScreen({super.key});

  @override
  State<PersonScreen> createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
  Box<Person>? _box;
  Box<Message>? _messageBox;
  Timer? _timer;
  String? _currKey;

  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      _box = await Hive.openBox<Person>('personBox');
      _messageBox = await Hive.openBox<Message>('messages');
      setState(() {});
    });

    _timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
      if (_currKey != null && _box != null && _messageBox != null) {
        final date = DateTime.now();
        final uid = Uuid().v4();
        Person person = _box!.get(_currKey!)!;

        await _messageBox!.put(uid, Message(content: MessageGenerator.random(), dateSent: date));
        final m = ((person.messageKeys ?? []) + [])..insert(0, uid);
        final p = person.copyWith(messageKeys: m);

        print(p.toJson());
        print(Person.fromJson({}));

        await _box!.put(_currKey, p);
      }
    });
  }

  @override
  void dispose() {
    _box?.close();
    _timer?.cancel();
    _messageBox?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _count(),
        actions: [
          IconButton(
              onPressed: () async {
                final newData = _box!.values.toList() + [];

                for (int i = 0; i < newData.length; i++) {
                  final key = _box!.keyAt(i);

                  await _box?.delete(key);
                  setState(() {});
                }
              },
              icon: const Icon(Icons.delete))
        ],
      ),
      body: _box == null
          ? const Center(child: CircularProgressIndicator())
          : ValueListenableBuilder(
              valueListenable: _box!.listenable(),
              builder: (_, box, __) {
                if (box.isEmpty) {
                  return const Center(child: Text('No data found'));
                }
                // Display list of persons
                return ListView.builder(
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    final person = box.getAt(index);
                    return ListTile(
                      title: Text(person?.name ?? 'No name'),
                      subtitle: Text('Key: ${box.keyAt(index)}'),
                      trailing: IconButton(
                        onPressed: () {
                          _box?.deleteAt(index);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                      onTap: () {
                        _currKey = box.keyAt(index);
                        context.to(MessageScreen(
                          box,
                          box.keyAt(index),
                          _messageBox,
                          onClose: () {
                            _currKey = null;
                          },
                        ));
                      },
                    );
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final uid = Uuid().v4();

          _box?.put(uid, Person(name: RandomNameGenerator.random(), age: 32));
        },
      ),
    );
  }

  Widget _count() {
    return _box == null
        ? const SizedBox()
        : ValueListenableBuilder(
            valueListenable: _box!.listenable(),
            builder: (_, box, __) {
              return Text('Hive Count ${box.length}');
            },
          );
  }
}
