import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class ScanScreen extends StatefulWidget {
  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {

  void scan() async{
    var subscription = FlutterBluePlus.onScanResults.listen((results) {
      if(results.isNotEmpty){
        ScanResult r = results.last;
        print("Encontrado");
        print("${r.device.remoteId}: ${r.advertisementData.advName} found!");
      }
    }, onError: (e) => print(e));

    FlutterBluePlus.cancelWhenScanComplete(subscription);

    //Espera por bluetooth habilitado y permiso concebido
    await FlutterBluePlus.adapterState.where((val) => val == BluetoothAdapterState.on).first;

    await FlutterBluePlus.startScan(
      //withNames: ["Proteus"],
      //withServices: [Guid("49e0b347-e722-4ac0-92fb-a316e887fdea")],
      timeout: Duration(seconds: 15)
    );

    await FlutterBluePlus.isScanning.where((val) => val == false).first;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Center(
            child:
                FilledButton(onPressed: () {
                  scan();
                }, child: const Text("Escanear"))),
      ],
    );
  }
}
