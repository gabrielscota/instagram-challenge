import '../../../domain/helpers/helpers.dart';
import '../../../domain/usecases/usecases.dart';
import '../../cache/cache.dart';

class LocalSaveCurrentUser implements SaveCurrentUser {
  final SaveSecureCacheStorage saveSecureCacheStorage;

  LocalSaveCurrentUser({required this.saveSecureCacheStorage});

  Future<void> save({String? userUID}) async {
    try {
      await saveSecureCacheStorage.save(key: 'uid', value: userUID!);
    } catch (error) {
      throw DomainError.unexpected;
    }
  }
}
