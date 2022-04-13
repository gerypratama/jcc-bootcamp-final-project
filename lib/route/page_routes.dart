import 'package:get/get.dart';
import 'package:jcc_final_project/pages/about/about.dart';
import 'package:jcc_final_project/pages/activity/activity.dart';
import 'route_name.dart';
import '../pages/home/home.dart';
import '../pages/signin/signin.dart';
import '../pages/signup/signup.dart';

class pageRoutes {
  static final pages = [
    GetPage(name: RouteName.home, page: () => HomeScreen()),
    GetPage(name: RouteName.signin, page: () => LoginScreen()),
    GetPage(name: RouteName.signup, page: () => SignupScreen()),
    GetPage(name: RouteName.activity, page: () => ActivityScreen()),
    GetPage(name: RouteName.about, page: () => AboutPage())
  ];
}
