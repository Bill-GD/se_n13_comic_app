import 'package:flutter/cupertino.dart';
import 'main_screen/home.dart';
import 'package:flutter/services.dart';
void main() { 
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.bottom]);
}