import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageOptionsManager {
  // iOS-specific options
  static IOSOptions getIOSOptions() {
    return const IOSOptions(
      accessibility: KeychainAccessibility.passcode,
      synchronizable: false,
    );
  }
  // Android-specific options
  static AndroidOptions getAndroidOptions() => const AndroidOptions(
    encryptedSharedPreferences: true,
  );


}


