import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final SecureStorageService secureStorageService = SecureStorageService.instance;

class SecureStorageService {
  static final SecureStorageService _instance = SecureStorageService();

  static SecureStorageService get instance => _instance;

  final FlutterSecureStorage secureStorage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
      resetOnError: true,
    ),
  );

  //#region TOKEN
  final String keyToken = 'UYsnxHaus';
  Future<String?> getToken() async {
    final savedToken = await secureStorage.read(key: keyToken);
    return savedToken;
  }
  Future<void> setToken(String? token) async {
    await secureStorage.write(
      key: keyToken,
      value: token,
    );
  }
  Future<void> deleteToken() async {
    await secureStorage.delete(key: keyToken);
  }
  //#endregion TOKEN
}
