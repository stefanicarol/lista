import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth_repository_interface.dart';

class AuthRepository implements IAuthRepository {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future getEmailPasswordLogin() {
    // TODO: implement getEmailPasswordLogin
    throw UnimplementedError();
  }

  @override
  Future getFacebookLogin() {
    // TODO: implement getFacebookLogin
    throw UnimplementedError();
  }

  @override
  Future<String> getToken() {
    // TODO: implement getToken
    throw UnimplementedError();
  }

  @override
  Future<User> getGoogleLogin() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final User user = (await _auth.signInWithCredential(credential)).user;
    return user;
  }

  @override
  Future<User> getUser() async {
    return FirebaseAuth.instance.currentUser;
  }

  @override
  Future getLogout() {
    return _auth.signOut();
  }

  @override
  Future getLogoff() {
    return _googleSignIn.disconnect();
  }
}
