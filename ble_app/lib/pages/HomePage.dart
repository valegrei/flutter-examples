import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: const Text("Ble App"),
        ),
        body: Center(
          child: FilledButton(
            onPressed: () {},
            child: const Text("Encender"),
          ),
        ));
  }
}
