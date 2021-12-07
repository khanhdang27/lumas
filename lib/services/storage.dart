import 'package:get_storage/get_storage.dart';

class Storage {
  static GetStorage? storage = GetStorage();

  static const _keyToken = 'token';
  static const _keyId = 'id';
  static const _keyRole = 'role';
  static const _keyEmail = 'email';

  static setToken(String token) => storage!.write(_keyToken, token);

  static getToken() => storage!.read(_keyToken);

  static removeToken() => storage!.remove(_keyToken);

  static setId(int id) => storage!.write(_keyId, id);

  static getId() => storage!.read(_keyId);

  static removeId() => storage!.remove(_keyId);

  static setRole(int role) => storage!.write(_keyRole, role);

  static getRole() => storage!.read(_keyRole);

  static removeRole() => storage!.remove(_keyRole);

  static setEmail(String email) => storage!.write(_keyEmail, email);

  static getEmail() => storage!.read(_keyEmail);

  static removeEmail() => storage!.remove(_keyEmail);
}
