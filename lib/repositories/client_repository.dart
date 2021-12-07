import 'package:get/route_manager.dart';
import 'package:lumas/general/configs.dart';
import 'package:lumas/general/models.dart';
import 'package:lumas/general/repositories.dart';
import 'package:dio/dio.dart';
import 'package:lumas/general/services.dart';

class ClientRepository extends Repository {
  Future<Map> login({String? username, String? password}) async {
    FormData formData = FormData.fromMap({
      'username': username,
      'password': password,
    });
    Map response = await httpManager.post(
      url: '/client/login',
      data: formData,
    );
    if (response['status'] == 200) {
      Client client = Client.fromJson(response['client_info']);
      return {
        'token': response['access_token'],
        'client' : client,
        'status': response['status'],
      };
    } else {
      return {
        'status': response['status'],
        'error': response['error'],
      };
    }
  }

  Future<Map> signUpValidate({name, userName, email, phone, password, confirm}) async {
    FormData formData = FormData.fromMap({
      'name': name,
      'username': userName,
      'email': email,
      'phone': phone,
      'password': password,
      'password_re_enter': confirm,
    });
    Map response = await httpManager.post(
      url: '/client/register-validate',
      data: formData,
    );
    if (response['status'] != 200) {
      return {
        'status': response['status'],
        'errors': response['validate'],
      };
    }
    return {'status': 200, 'errors': null};
  }

  Future<Map> signUp({name, userName, email, phone, password, confirm}) async {
    FormData formData = FormData.fromMap({
      'name': name,
      'username': userName,
      'email': email,
      'phone': phone,
      'password': password,
      'password_re_enter': confirm,
    });
    Map response = await httpManager.post(
      url: '/site/signup',
      data: formData,
    );
    if (response['data']['status'] != 200) {
      return {
        'status': response['data']['status'],
        'errors': response['data']['errors'],
      };
    }
    return {'status': 200, 'errors': null};
  }

  Future<Map> profile() async {
    Map response = await httpManager.get(url: '/client/profile');
    if (response['status'] == 200) {
      Client client = Client.fromJson(response['client_info']);
      return {
        'client' : client,
        'status': response['status'],
      };
    } else {
      return {
        'status': response['status'],
        'error': response['error'],
      };
    }
  }

  Future<Map> logout() async {
    Map response = await httpManager.post(url: '/client/logout');
    if (response['status'] == 200) {
      return {
        'status': response['status'],
      };
    } else {
      return {
        'status': response['status'],
        'error': response['error'],
      };
    }
  }

  Future<Map> addressRequest(String address) async {
    FormData formData = FormData.fromMap({'address': address});
    Map response = await httpManager.post(
      url: '/profile/address',
      data: formData,
    );
    if (response['data'] != null) {
      if (response['data']['status'] != 200) {
        return {
          'status': response['data']['status'],
          'errors': response['data']['errors'],
        };
      }
    }
    return {'status': 200, 'errors': null};
  }
}
