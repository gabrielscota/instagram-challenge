import 'package:equatable/equatable.dart';

import './home.dart';

class PostViewModel extends Equatable {
  final UserViewModel user;
  final String subtitle;
  final String imageUrl;
  final String description;
  final List<UserLikeViewModel> likes;

  const PostViewModel({
    required this.user,
    required this.subtitle,
    required this.imageUrl,
    required this.description,
    required this.likes,
  });

  @override
  List<Object?> get props => [user, subtitle, imageUrl, description, likes];
}
