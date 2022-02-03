import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vakinha_burger_mobile/vakinha_burger_main_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // transparent status bar
    ),
  );
  runApp(const VakinhaBurgerMainApp());
}
