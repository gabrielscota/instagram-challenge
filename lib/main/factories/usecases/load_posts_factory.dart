import '../../../data/usecases/usecases.dart';
import '../../../domain/usecases/usecases.dart';
import '../factories.dart';

LoadPosts makeRemoteLoadPosts() => RemoteLoadPosts(
      cloudFirestore: makeCloudFirestore(),
    );
