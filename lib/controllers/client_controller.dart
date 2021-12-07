import 'package:get/get.dart';
import 'package:lumas/general/configs.dart';
import 'package:lumas/general/models.dart';
import 'package:lumas/general/repositories.dart';
import 'package:lumas/general/services.dart';

class ClientController extends GetxController with StateMixin<Client> {
  ClientRepository clientRepository = ClientRepository();
  RxBool isLoading = false.obs;
  dynamic client  = {}.obs;

  login({required String username, required String password}) async {
    showLoading();
    final response = await clientRepository.login(username: username, password: password);
    hideLoading();

    if (response != null) {
      if (response['status'] == 200) {
        Client client = response['client'];
        Storage.setToken(response['token']);
        Storage.setId(client.id ?? 0);
        Storage.setRole(1);
        Get.offAllNamed(AppRoute.CLIENT_HOME);
      }
    } else {
      print("No data recieved");
    }
  }


  getProfile() async {
    showLoading();
    final response = await clientRepository.profile();
    hideLoading();

    if (response != null) {
      if (response['status'] == 200) {
        Client clientModel = response['client'];
        client = clientModel;

        return Get.toNamed(AppRoute.CLIENT_PROFILE);
      }
    } else {
      print("No data recieved");
    }
  }

  logout() async {
    showLoading();
    await clientRepository.logout();
    hideLoading();

    Storage.removeToken();
    Get.offAllNamed(AppRoute.CLIENT_LOGIN);
  }

  showLoading() {
    isLoading.value = true;
  }

  hideLoading() {
    isLoading.value = false;
  }
}
