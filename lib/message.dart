import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_hive/util.dart';
import 'package:uuid/uuid.dart';

import 'hive/message.dart';
import 'hive/person.dart';

class MessageScreen extends StatefulWidget {
  final Box<Person> personBox;
  final Box<Message>? messageBox;
  final String personKey;
  final Function()? onClose;

  const MessageScreen(this.personBox, this.personKey, this.messageBox, {this.onClose, super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  late final _personBox = widget.personBox;
  late final Box<Message>? _messageBox = widget.messageBox;
  bool _isYou = false;

  @override
  void initState() {
    super.initState();

    setState(() {});
  }

  @override
  void dispose() {
    if (widget.onClose != null) widget.onClose!();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${_person.name}'),
      ),
      body: _messageBox == null
          ? const Center(child: CircularProgressIndicator())
          : Column(children: [
              Expanded(
                  child: ValueListenableBuilder(
                      valueListenable: _messageBox!.listenable(),
                      builder: (_, box, __) {
                        return ListView.builder(
                          reverse: true,
                          itemCount: _messages(box).length,
                          itemBuilder: (context, index) {
                            final message = _messages(box).elementAt(index);

                            return ListTile(
                              title: Text(
                                '${message?.content}',
                                textAlign:
                                    (message?.isYou ?? false) ? TextAlign.end : TextAlign.start,
                                style: TextStyle(),
                              ),
                              subtitle: Text(
                                '${message?.dateSent ?? 'Not seen'}',
                                textAlign:
                                    (message?.isYou ?? false) ? TextAlign.end : TextAlign.start,
                                style: TextStyle(),
                              ),
                            );
                          },
                        );
                      })),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: _addMessage,
                  child: Text('Send'),
                ),
              ),
            ]),
    );
  }

  void _addMessage() async {
    final date = DateTime.now();
    final uid = Uuid().v4();
    _isYou = !_isYou;
    await _messageBox!
        .put(uid, Message(content: MessageGenerator.random(), isYou: true, dateSent: date));
    final m = ((_person.messageKeys ?? []) + [])..insert(0, uid);
    final p = _person.copyWith(messageKeys: m);

    await _personBox.put(widget.personKey, p);
    setState(() {});
  }

  Person get _person {
    return _personBox.get(widget.personKey)!;
  }

  List<Message?> _messages(Box<Message> box) {
    final keys = _personBox.get(widget.personKey)?.messageKeys ?? [];

    return keys.map((e) => box.get(e)).toList();
  }
}
