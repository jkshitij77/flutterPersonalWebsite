import 'package:get/route_manager.dart';
import 'package:myflutterwebsite/screens/welcome_screen.dart';

class Routes{
  static String getInitialRoute(){
    return '/';
  }

  static List<GetPage> getRoutes(){
    return [
      GetPage(
        name: '/',
        page: () => WelcomeScreen(),
      ),
    ];
  }
}