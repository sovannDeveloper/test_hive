import 'package:flutter/material.dart';

extension MyContext on BuildContext {
  void to(Widget screen) {
    Navigator.of(this).push(MaterialPageRoute(builder: (_) => screen));
  }

  void pop() {
    Navigator.of(this).pop();
  }
}
