import 'package:get/get.dart';
import 'package:lumas/general/controllers.dart';
import 'package:lumas/general/services.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    injectService();
    Get.lazyPut<ClientController>(() => ClientController(), fenix: true);
  }

  void injectService() {
    Get.put(AuthService());
  }
}
