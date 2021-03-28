import '../../../domain/entities/entities.dart';
import '../../../domain/helpers/helpers.dart';
import '../../../domain/usecases/usecases.dart';
import '../../firebase/firebase.dart';
import '../../models/models.dart';

class RemoteLoadUserFollowingPosts implements LoadUserFollowingPosts {
  final CloudFirestore cloudFirestore;

  RemoteLoadUserFollowingPosts({required this.cloudFirestore});

  @override
  Future<List<PostEntity>> loadUserFollowingPosts(String userUID) async {
    try {
      final userQuerySnapshot = await cloudFirestore.getCollection(collectionName: 'users').doc(userUID).get();
      final RemoteUserModel user = RemoteUserModel.fromJson(userQuerySnapshot.data()!);

      return await loadUserPosts(user.following.first);
    } catch (error) {
      throw DomainError.unexpected;
    }
  }

  Future<List<PostEntity>> loadUserPosts(String userUID) async {
    final userFollowingQuerySnapshot = await cloudFirestore.getCollection(collectionName: 'users').doc(userUID).get();

    final userFollowPosts =
        await cloudFirestore.getCollection(collectionName: 'users').doc(userUID).collection('posts').get();
    return userFollowPosts.docs
        .map((userPost) => RemotePostModel.fromJsonWithUser(
              userPost.data()!,
              RemoteUserModel.fromJson(userFollowingQuerySnapshot.data()!),
            ).toEntity())
        .toList();
  }
}
