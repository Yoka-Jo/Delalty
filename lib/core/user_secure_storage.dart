import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@injectable
class UserSecureStorage {
  static const _idKey = 'user_id';
  static const _tokenKey = 'token';
  static const _nameKey = 'name';
  static const _emailKey = 'email';
  static const _phoneKey = 'phone';
  static const _modeKey = 'mode';

  const UserSecureStorage(this._secureStorage);
  final FlutterSecureStorage _secureStorage;

  Future<void> upsertUserInfo({
    required String id,
    required String name,
    String? email,
    required String phone,
  }) =>
      Future.wait([
        if (email != null)
          _secureStorage.write(
            key: _emailKey,
            value: email,
          ),
        _secureStorage.write(
          key: _idKey,
          value: id,
        ),
        _secureStorage.write(
          key: _nameKey,
          value: name,
        ),
        _secureStorage.write(
          key: _phoneKey,
          value: phone,
        )
      ]);

  Future<void> upsertUserToken(String token) async =>
      await _secureStorage.write(
        key: _tokenKey,
        value: token,
      );

  Future<void> deleteUserInfo() => Future.wait([
        _secureStorage.delete(
          key: _idKey,
        ),
        _secureStorage.delete(
          key: _tokenKey,
        ),
        _secureStorage.delete(
          key: _nameKey,
        ),
        _secureStorage.delete(
          key: _emailKey,
        ),
        _secureStorage.delete(
          key: _phoneKey,
        ),
        _secureStorage.delete(
          key: _modeKey,
        ),
      ]);

  Future<String?> getUserID() => _secureStorage.read(
        key: _idKey,
      );
  Future<String?> getUserToken() => _secureStorage.read(
        key: _tokenKey,
      );
  Future<String?> getUserPhone() => _secureStorage.read(
        key: _phoneKey,
      );

  Future<String?> getUserEmail() => _secureStorage.read(
        key: _emailKey,
      );

  Future<String?> getUsername() => _secureStorage.read(
        key: _nameKey,
      );
  Future<String?> getUserMode() => _secureStorage.read(
        key: _modeKey,
      );
}

@module
abstract class InjectableUserSecureStorageModule {
  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();
}
