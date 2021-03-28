import 'package:get/get.dart';

import '../../domain/entities/entities.dart';
import '../../domain/usecases/usecases.dart';
import '../../ui/pages/pages.dart';
import '../mixins/mixins.dart';

class GetxHomePresenter extends GetxController with NavigationManager implements HomePresenter {
  final LoadUserFollowingPosts loadUserFollowPosts;
  final LoadUserSelf loadUserSelf;
  final DeleteCurrentUser deleteCurrentUser;
  final UserLogout userLogout;

  GetxHomePresenter({
    required this.loadUserFollowPosts,
    required this.loadUserSelf,
    required this.deleteCurrentUser,
    required this.userLogout,
  });

  final _user = Rx<UserViewModel?>();
  final _posts = Rx<List<PostViewModel>?>();

  Stream<UserViewModel?> get userStream => _user.stream;
  Stream<List<PostViewModel>?> get postsStream => _posts.stream;

  @override
  Future<void> loadUser(String userUID) async {
    try {
      final UserEntity user = await loadUserSelf.load(userUID);
      _user.subject.add(
        UserViewModel(
          uid: user.uid,
          username: user.username,
          avatar: user.avatar,
          name: user.name,
        ),
      );
    } catch (_) {}
  }

  @override
  Future<void> loadUserFollowingPosts(String userUID) async {
    try {
      final List<PostEntity> posts = await loadUserFollowPosts.loadUserFollowingPosts(userUID);
      _posts.subject.add(posts
          .map((post) => PostViewModel(
                user: UserViewModel(
                  uid: post.user.uid,
                  username: post.user.username,
                  avatar: post.user.avatar,
                  name: post.user.name,
                ),
                subtitle: post.subtitle,
                imageUrl: post.imageUrl,
                description: post.description,
                likes: post.likes
                    .map((userLiked) => UserLikeViewModel(
                          username: userLiked.username,
                          avatar: userLiked.avatar,
                          name: userLiked.name,
                        ))
                    .toList(),
              ))
          .toList());
    } catch (_) {}
  }

  @override
  Future<void> logout() async {
    await userLogout.logout();
    await deleteCurrentUser.delete(key: 'uid');
    navigateTo = '/login';
  }
}
