import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class FacebookProvider {
  final FacebookLogin facebookSignIn = new FacebookLogin();
  FacebookAccessToken token;

  Future<FacebookLoginResult> signIn() async {
    final FacebookLoginResult result = await facebookSignIn.logIn(['email','user_birthday']);
    return result;
  }

  Future<Null> signOut() async {
    await facebookSignIn.logOut();
    token =  null;
  }
}

var facebookProvider = FacebookProvider();
