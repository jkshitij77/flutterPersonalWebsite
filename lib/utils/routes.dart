import 'package:get/route_manager.dart';
import 'package:myflutterwebsite/screens/bucket_list_page.dart';
import 'package:myflutterwebsite/screens/professional.dart';
import 'package:myflutterwebsite/screens/welcome_screen.dart';

class Routes {
  static String getInitialRoute() {
    return WelcomeScreen.welcomeScreenRoute;
  }

  static List<GetPage> getRoutes() {
    return [
      GetPage(
        name: WelcomeScreen.welcomeScreenRoute,
        page: () => WelcomeScreen(),
      ),
      GetPage(
        name: BucketListPage.bucketListRoute,
        page: () => BucketListPage(),
      ),
      GetPage(
        name: ProfessionalPage.professionalPageRoute,
        page: () => ProfessionalPage(),
      )
    ];
  }
}
