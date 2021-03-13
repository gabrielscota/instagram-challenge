import 'domain/entities/entities.dart';

final UserEntity loggedUser = UserEntity(
  id: '0',
  username: 'gabrielscota',
  userPhoto: 'lib/ui/assets/images/avatar-0.png',
  name: 'Gabriel Scotá',
);

final users = <UserEntity>[
  UserEntity(
    id: '0',
    username: 'gabrielscota',
    userPhoto: 'lib/ui/assets/images/avatar-0.png',
    name: 'Gabriel Scotá',
  ),
  UserEntity(
    id: '1',
    username: 'alexis',
    userPhoto: 'lib/ui/assets/images/avatar-1.png',
    name: 'Alexis Scott',
  ),
  UserEntity(
    id: '2',
    username: 'marcus',
    userPhoto: 'lib/ui/assets/images/avatar-2.png',
    name: 'Marcus Conner',
  ),
  UserEntity(
    id: '3',
    username: 'Brian',
    userPhoto: 'lib/ui/assets/images/avatar-3.png',
    name: 'Brian Spilber',
  ),
  UserEntity(
    id: '4',
    username: 'julia',
    userPhoto: 'lib/ui/assets/images/avatar-4.png',
    name: 'Julia Grewn',
  ),
  UserEntity(
    id: '5',
    username: 'jessica',
    userPhoto: 'lib/ui/assets/images/avatar-5.png',
    name: 'Jessica Owen',
  ),
  UserEntity(
    id: '6',
    username: 'anna',
    userPhoto: 'lib/ui/assets/images/avatar-6.png',
    name: 'Anna Timber',
  ),
];

final stories = <StorieEntity>[
  StorieEntity(
    id: '0',
    user: users[1],
  ),
  StorieEntity(
    id: '1',
    user: users[2],
  ),
  StorieEntity(
    id: '2',
    user: users[3],
  ),
  StorieEntity(
    id: '3',
    user: users[4],
  ),
  StorieEntity(
    id: '4',
    user: users[5],
  ),
  StorieEntity(
    id: '5',
    user: users[6],
  ),
];

final posts = <PostEntity>[
  PostEntity(
    id: '0',
    user: users[1],
    subtitle: 'Brasil',
    imageUrl: 'lib/ui/assets/images/post-0.jpg',
    likes: [
      users[4],
      users[5],
      users[6],
    ],
  ),
  PostEntity(
    id: '1',
    user: users[0],
    imageUrl: 'lib/ui/assets/images/post-2.jpg',
    likes: [
      users[1],
      users[2],
      users[3],
      users[4],
      users[5],
      users[6],
    ],
  ),
  PostEntity(
    id: '2',
    user: users[3],
    subtitle: 'Timóteo',
    imageUrl: 'lib/ui/assets/images/post-1.jpg',
    likes: [
      users[0],
      users[6],
      users[4],
      users[2],
    ],
  ),
  PostEntity(
    id: '3',
    user: users[6],
    subtitle: 'EUA',
    imageUrl: 'lib/ui/assets/images/post-3.jpg',
    likes: [
      users[2],
      users[5],
      users[3],
    ],
  ),
];
