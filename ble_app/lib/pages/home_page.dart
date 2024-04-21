import 'dart:async';

import 'package:ble_app/pages/scan_screen.dart';
import 'package:ble_app/pages/turn_on_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StreamSubscription<BluetoothAdapterState>? subscription;
  bool encendido = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    subscription =
        FlutterBluePlus.adapterState.listen((BluetoothAdapterState state) {
      print(state);
      if (state == BluetoothAdapterState.on) {
        setState(() {
          encendido = true;
        });
      } else {
        setState(() {
          encendido = false;
        });
      }
    });
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: const Text("Ble App"),
        ),
        body: encendido ? ScanScreen() : const TurnOnScreen());
  }
}
