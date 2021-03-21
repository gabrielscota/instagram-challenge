import '../../../domain/entities/entities.dart';
import '../../../domain/helpers/helpers.dart';
import '../../../domain/usecases/usecases.dart';
import '../../firebase/firebase.dart';
import '../../models/models.dart';

class RemoteLoadPosts implements LoadPosts {
  final CloudFirestore cloudFirestore;

  RemoteLoadPosts({required this.cloudFirestore});

  @override
  Future<List<PostEntity>> load(String userUID) async {
    try {
      final userQuerySnapshot = await cloudFirestore
          .getCollection(collectionName: 'users')
          .doc(userUID)
          .get();
      final RemoteUserModel user =
          RemoteUserModel.fromJson(userQuerySnapshot.data()!);
      final postsQuerySnapshots = await cloudFirestore
          .getCollection(collectionName: 'users')
          .doc(userUID)
          .collection('posts')
          .get();
      return postsQuerySnapshots.docs
          .map((post) => RemotePostModel(
                uid: post.id,
                user: user,
                subtitle: post['subtitle'],
                imageUrl: post['imageUrl'],
                description: post['description'],
                likes: post['likes'],
                createdAt: post['createdAt'],
                updatedAt: post['updatedAt'],
                deletedAt: post['deletedAt'],
              ).toEntity())
          .toList();
    } catch (error) {
      throw DomainError.unexpected;
    }
  }
}
