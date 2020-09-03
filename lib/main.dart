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
      initialRoute: Routes.getInitialRoute(),
      getPages: Routes.getRoutes(),
    );
  }
}