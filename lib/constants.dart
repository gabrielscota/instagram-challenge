import 'domain/entities/entities.dart';

final UserEntity loggedUser = UserEntity(
  username: 'gabrielscota',
  userPhoto: 'lib/ui/assets/images/avatar-0.png',
  name: 'Gabriel Scotá',
);

final stories = <StorieEntity>[
  StorieEntity(
    user: UserEntity(
      username: 'alexis',
      userPhoto: 'lib/ui/assets/images/avatar-1.png',
      name: 'Alexis Scott',
    ),
  ),
  StorieEntity(
    user: UserEntity(
      username: 'marcus',
      userPhoto: 'lib/ui/assets/images/avatar-2.png',
      name: 'Marcus Conner',
    ),
  ),
  StorieEntity(
    user: UserEntity(
      username: 'brian',
      userPhoto: 'lib/ui/assets/images/avatar-3.png',
      name: 'Brian Spilber',
    ),
  ),
  StorieEntity(
    user: UserEntity(
      username: 'julia',
      userPhoto: 'lib/ui/assets/images/avatar-4.png',
      name: 'Julia Grewn',
    ),
  ),
  StorieEntity(
    user: UserEntity(
      username: 'jessica',
      userPhoto: 'lib/ui/assets/images/avatar-5.png',
      name: 'Jessica Owen',
    ),
  ),
  StorieEntity(
    user: UserEntity(
      username: 'anna',
      userPhoto: 'lib/ui/assets/images/avatar-6.png',
      name: 'Anna Timber',
    ),
  ),
];

final posts = <PostEntity>[
  PostEntity(
    user: UserEntity(
      username: 'alexis',
      userPhoto: 'lib/ui/assets/images/avatar-1.png',
      name: 'Alexis Scott',
    ),
    subtitle: 'Brasil',
    imageUrl: 'lib/ui/assets/images/post-0.jpg',
    likes: [
      UserEntity(
        username: 'julia',
        userPhoto: 'lib/ui/assets/images/avatar-4.png',
        name: 'Julia Grewn',
      ),
      UserEntity(
        username: 'jessica',
        userPhoto: 'lib/ui/assets/images/avatar-5.png',
        name: 'Jessica Owen',
      ),
      UserEntity(
        username: 'anna',
        userPhoto: 'lib/ui/assets/images/avatar-6.png',
        name: 'Anna Timber',
      ),
    ],
  ),
  PostEntity(
    user: UserEntity(
      username: 'gabrielscota',
      userPhoto: 'lib/ui/assets/images/avatar-0.png',
      name: 'Gabriel Scotá',
    ),
    imageUrl: 'lib/ui/assets/images/post-2.jpg',
    likes: [
      UserEntity(
        username: 'alexis',
        userPhoto: 'lib/ui/assets/images/avatar-1.png',
        name: 'Alexis Scott',
      ),
      UserEntity(
        username: 'marcus',
        userPhoto: 'lib/ui/assets/images/avatar-2.png',
        name: 'Marcus Conner',
      ),
      UserEntity(
        username: 'brian',
        userPhoto: 'lib/ui/assets/images/avatar-3.png',
        name: 'Brian Spilber',
      ),
      UserEntity(
        username: 'julia',
        userPhoto: 'lib/ui/assets/images/avatar-4.png',
        name: 'Julia Grewn',
      ),
      UserEntity(
        username: 'jessica',
        userPhoto: 'lib/ui/assets/images/avatar-5.png',
        name: 'Jessica Owen',
      ),
      UserEntity(
        username: 'anna',
        userPhoto: 'lib/ui/assets/images/avatar-6.png',
        name: 'Anna Timber',
      ),
    ],
  ),
  PostEntity(
    user: UserEntity(
      username: 'brian',
      userPhoto: 'lib/ui/assets/images/avatar-3.png',
      name: 'Brian Spilber',
    ),
    subtitle: 'Timóteo',
    imageUrl: 'lib/ui/assets/images/post-1.jpg',
    likes: [
      UserEntity(
        username: 'gabrielscota',
        userPhoto: 'lib/ui/assets/images/avatar-0.png',
        name: 'Gabriel Scotá',
      ),
      UserEntity(
        username: 'anna',
        userPhoto: 'lib/ui/assets/images/avatar-6.png',
        name: 'Anna Timber',
      ),
      UserEntity(
        username: 'julia',
        userPhoto: 'lib/ui/assets/images/avatar-4.png',
        name: 'Julia Grewn',
      ),
      UserEntity(
        username: 'marcus',
        userPhoto: 'lib/ui/assets/images/avatar-2.png',
        name: 'Marcus Conner',
      ),
    ],
  ),
  PostEntity(
    user: UserEntity(
      username: 'anna',
      userPhoto: 'lib/ui/assets/images/avatar-6.png',
      name: 'Anna Timber',
    ),
    subtitle: 'EUA',
    imageUrl: 'lib/ui/assets/images/post-3.jpg',
    likes: [
      UserEntity(
        username: 'marcus',
        userPhoto: 'lib/ui/assets/images/avatar-2.png',
        name: 'Marcus Conner',
      ),
      UserEntity(
        username: 'jessica',
        userPhoto: 'lib/ui/assets/images/avatar-5.png',
        name: 'Jessica Owen',
      ),
      UserEntity(
        username: 'brian',
        userPhoto: 'lib/ui/assets/images/avatar-3.png',
        name: 'Brian Spilber',
      ),
    ],
  ),
];
