import 'package:flutter/material.dart';
import 'package:user_details/services/facebook_provider.dart';
import 'package:user_details/services/google_provider.dart';

import 'details.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> signInGoogle() async {
    googleProvider.signIn();
    googleProvider.googleSignIn.onCurrentUserChanged.listen((account) {
      if (account != null) {
        googleProvider.user = account;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Profile(),
          ),
        );
      }
    });
  }

  Future<void> signInFacebook() async {
    var result = await facebookProvider.signIn();
    print(result.accessToken.token);
    facebookProvider.token = result.accessToken;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Profile(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: RaisedButton(
                  child: Text("Google SignUp"),
                  onPressed: signInGoogle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: RaisedButton(
                  child: Text("Facebook SignUp"),
                  onPressed: signInFacebook,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
