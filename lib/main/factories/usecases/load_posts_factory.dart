import '../../../data/usecases/usecases.dart';
import '../../../domain/usecases/usecases.dart';
import '../factories.dart';

LoadUserFollowingPosts makeRemoteLoadUserFollowingPosts() => RemoteLoadUserFollowingPosts(
      cloudFirestore: makeCloudFirestore(),
    );
