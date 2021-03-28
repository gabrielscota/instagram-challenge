import '../../../domain/entities/entities.dart';
import '../../../domain/helpers/helpers.dart';
import '../../../domain/usecases/usecases.dart';
import '../../firebase/firebase.dart';
import '../../models/models.dart';

class RemoteLoadUserPosts implements LoadUserPosts {
  final CloudFirestore cloudFirestore;

  RemoteLoadUserPosts({required this.cloudFirestore});

  @override
  Future<List<PostEntity>> loadUserPosts(String userUID) async {
    try {
      final userQuerySnapshot = await cloudFirestore.getCollection(collectionName: 'users').doc(userUID).get();
      final RemoteUserModel user = RemoteUserModel.fromJson(userQuerySnapshot.data()!);
      final postsQuerySnapshots =
          await cloudFirestore.getCollection(collectionName: 'users').doc(userUID).collection('posts').get();
      return postsQuerySnapshots.docs
          .map((post) => RemotePostModel.fromJsonWithUser(post.data()!, user).toEntity())
          .toList();
    } catch (error) {
      throw DomainError.unexpected;
    }
  }
}
