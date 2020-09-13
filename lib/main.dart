
import 'dart:io';
import 'package:flutter/material.dart';
import 'notifiers/core.dart';
import 'screens/folder_list_screen.dart';
import 'notifiers/preferences.dart';
import 'screens/storage_screen.dart';
import 'helpers/io_extensions.dart';
import 'package:provider/provider.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ValueListenableProvider(create: (context) => ValueNotifier(true)),
      ChangeNotifierProvider(create: (context) => CoreNotifier()),
      ChangeNotifierProvider(create: (context) => PreferencesNotifier()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
        defaultBrightness: Brightness.dark,
        data: (brightness) => ThemeData(
          primarySwatch: Colors.blue,
          brightness: brightness,
        ),
        themedWidgetBuilder: (context, theme) {
          FlutterStatusbarcolor.setStatusBarColor(theme.primaryColor);
          return MaterialApp(
              title: 'Basic File Manager', theme: theme, home: StorageScreen());
        });
  }
}
