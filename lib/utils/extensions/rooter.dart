import 'package:flutter/material.dart';

extension Rooter on BuildContext {
  void go(Widget screen) => Navigator.pushReplacement(
        this,
        MaterialPageRoute(builder: (_) => screen),
      );
}
