import '../../../data/usecases/usecases.dart';
import '../../../domain/usecases/usecases.dart';
import '../factories.dart';

UserFacebookSignIn makeRemoteUserFacebookSignIn() => RemoteFacebookSignIn(
      firebaseAuthentication: makeFirebaseAuth(),
      cloudFirestore: makeCloudFirestore(),
    );
