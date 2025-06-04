import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test_app/core/storage/secure_storage_options_manager.dart';
import '../network/api_manager.dart';

class SecureStorageManager {

  final FlutterSecureStorage _storage;

  SecureStorageManager() : _storage = const FlutterSecureStorage();

  static const String cachedJwtToken = 'CACHED_JWT_REFRESH_TOKEN';

  static Future<bool> isUserLoginBefore() async {
    // Attempt to read the JWT token from the secure storage
    final result = await ApiManager.getAuthToken();
    // If the result is not null, it means the user is logged in before
    return result != null;
  }

   Future<void> write({required String? value,required String key,}) async {
    await _storage.write(
      key: key,
      value: value,
      iOptions: SecureStorageOptionsManager.getIOSOptions(),
      aOptions: SecureStorageOptionsManager.getAndroidOptions(),
    );
  }

  Future<String?> read({required String key,}) async {
    final result = await _storage.read(
      key: key,
      aOptions: SecureStorageOptionsManager.getAndroidOptions(),
      iOptions: SecureStorageOptionsManager.getIOSOptions(),
    );
    return result;
  }


}