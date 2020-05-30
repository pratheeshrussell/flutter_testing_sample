import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
// import our widget
import 'package:test_app1/main.dart';

void main() {
  // Enable the Extension
  enableFlutterDriverExtension();
  //start the app as usual
  runApp(new MyApp());
}