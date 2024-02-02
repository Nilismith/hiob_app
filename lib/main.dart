import 'dart:io';

import 'package:flutter/material.dart';

import 'package:smart_home/manager/manager.dart';

import 'app.dart';
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
void main() async {
  //TODO Fix this bug and run in zoned
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  //Initialize Logging

  // ignore: unused_local_variable
  String version = "1.3";
  Manager manager = Manager();
  await manager.load();
  //TODO:
  runApp(App(
    manager: manager,
    screenManager: manager.screenManager,
  ));
}
