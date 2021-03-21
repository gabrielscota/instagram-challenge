import '../../../domain/entities/entities.dart';
import '../../../domain/helpers/helpers.dart';
import '../../../domain/usecases/usecases.dart';
import '../../firebase/firebase.dart';
import '../../models/models.dart';

class RemoteLoadUserSelf implements LoadUserSelf {
  final CloudFirestore cloudFirestore;

  RemoteLoadUserSelf({required this.cloudFirestore});

  @override
  Future<UserEntity> load(String userUID) async {
    try {
      final userQuerySnapshot = await cloudFirestore
          .getCollection(collectionName: 'users')
          .doc(userUID)
          .get();
      return RemoteUserModel.fromJson(userQuerySnapshot.data()!).toEntity();
    } catch (error) {
      throw DomainError.unexpected;
    }
  }
}
