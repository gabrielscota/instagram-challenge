import 'package:meta/meta.dart';

import './entities.dart';

class StorieEntity {
  final String id;
  final UserEntity user;

  const StorieEntity({@required this.id, @required this.user});
}
