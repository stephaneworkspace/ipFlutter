import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:get_ip/get_ip.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyIpPageState createState() => _MyIpPageState();
}

class _MyIpPageState extends State<MyApp> {
  String _ip = '?.?.?.?';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform message are aync, so we init in an async method
  Future<void> initPlatformState() async {
    String ipAdress;
    try {
      ipAdress = await GetIp.ipAddress;
    } on PlatformException {
      ipAdress = 'Error';
    }

    if (!mounted) return;

    setState(() {
      _ip = ipAdress;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('IP')
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'IP:',
              ),
              Text(
                '$_ip',
                style: Theme.of(context).textTheme.display1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
