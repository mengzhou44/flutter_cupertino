import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cupertino/src/app.dart';
 
void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  return runApp(App());
 
}

