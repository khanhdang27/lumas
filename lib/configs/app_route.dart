import 'package:get/get.dart';
import 'package:lumas/general/screens.dart';

class AppRoute {
  static const CLIENT_HOME = 'client/home';
  static const CLIENT_LOGIN = '/client/login';
  static const CLIENT_SIGNUP = '/client/signup';
  static const CLIENT_FORGOT = '/client/forgot';
  static const CLIENT_PROFILE = '/client/profile';
  static const USER_LOGIN = '/user/login';
  static const USER_HOME = '/user/home';

  static const INITIAL = CLIENT_HOME;

  static final getPages = [
    GetPage(
      name: CLIENT_HOME,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: CLIENT_SIGNUP,
      page: () => SignupScreen(),
    ),
    GetPage(
      name: CLIENT_LOGIN,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: CLIENT_PROFILE,
      page: () => ClientProfileScreen(),
    ),
    GetPage(
      name: CLIENT_FORGOT,
      page: () => ForgotPwScreen(),
    ),
    GetPage(
      name: USER_HOME,
      page: () => StaffHomeScreen(),
    ),
    GetPage(
      name: USER_LOGIN,
      page: () => LoginScreen(),
    ),
  ];

  static final AppRoute _instance = AppRoute._internal();

  factory AppRoute() {
    return _instance;
  }

  AppRoute._internal();
}
