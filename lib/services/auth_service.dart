import 'package:lumas/general/configs.dart';
import 'package:lumas/general/services.dart';

class AuthService {
  var token = Storage.getToken();
  var role = Storage.getRole();

  String setInitialRoute() {
    if (token != null) {
      if (role == 1)
        return AppRoute.CLIENT_HOME;
      else
        return AppRoute.USER_HOME;
    } else {
      return AppRoute.CLIENT_LOGIN;
    }
  }
}
