import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class TurnOnScreen extends StatelessWidget {
  const TurnOnScreen({super.key});

  void encender() async {
    if (Platform.isAndroid) {
      await FlutterBluePlus.turnOn();
    }
  }

  @override
  Widget build(BuildContext context) => Center(
        child: FilledButton(
            onPressed: () {
              encender();
            },
            child: const Text("Encender BLE")),
      );
}
