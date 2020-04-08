import 'package:google_sign_in/google_sign_in.dart';

class GoogleProvider {
  GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: <String>[
      'profile',
      'email',
      "https://www.googleapis.com/auth/userinfo.profile",
      "https://www.googleapis.com/auth/user.birthday.read",
      "https://www.googleapis.com/auth/profile.agerange.read",
    ],
  );
  GoogleSignInAccount user;

  Future<void> signIn() async {
    try {
      await googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> signOut() async {
    try {
      await googleSignIn.signOut();
      user = null;
    } catch (error) {
      print(error);
    }
  }
}

var googleProvider = GoogleProvider();
