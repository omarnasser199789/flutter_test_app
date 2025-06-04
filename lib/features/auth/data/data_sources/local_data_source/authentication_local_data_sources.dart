import '../../../../../core/storage/secure_storage_manager.dart';
import '../../model/login_model.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheAuthentication(LoginModel loginModel);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  AuthLocalDataSourceImpl({
    SecureStorageManager? secureStorageManager,
  });

  @override
  Future<void> cacheAuthentication(LoginModel loginModel) async {
    /// Store the JWT token
    SecureStorageManager secureStorageManager = SecureStorageManager();
    secureStorageManager.write(value: loginModel.data.token, key: SecureStorageManager.cachedJwtToken);
  }
}
