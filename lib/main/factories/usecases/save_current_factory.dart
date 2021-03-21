import '../../../data/usecases/usecases.dart';
import '../../../domain/usecases/usecases.dart';
import '../factories.dart';

SaveCurrentUser makeLocalSaveCurrentUser() => LocalSaveCurrentAccount(
      saveSecureCacheStorage: makeSecureStorageAdapter(),
    );
