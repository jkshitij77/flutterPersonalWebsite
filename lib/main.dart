import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'utils/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.white,
        accentColor: Colors.black45,
        primaryTextTheme: TextTheme(
          // TODO: Make sure my themes are set
        )
      ),
      initialRoute: Routes.getInitialRoute(),
      getPages: Routes.getRoutes(),
    );
  }
}
