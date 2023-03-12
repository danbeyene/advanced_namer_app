import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:advanced_namer_app/provider/app_data_provider.dart';
import 'package:advanced_namer_app/screens/main_page.dart';
import 'package:advanced_namer_app/utils/style.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => AppDataProvider(),
      child: MaterialApp(
        title: 'Namer App',
        theme: AppStyle.appTheme,
        scrollBehavior: AppScrollBehavior(),
        home:  MainPage(),
      ),
    );
  }
}


class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
  };
}

