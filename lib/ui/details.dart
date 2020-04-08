import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:user_details/globals.dart';
import 'package:user_details/models/googleAPI.dart';
import 'package:user_details/services/facebook_provider.dart';
import 'package:user_details/services/google_provider.dart';
import 'package:user_details/services/user_details.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name;
  String photoUrl;
  String birthDay;

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  @override
  void dispose() {
    googleProvider.signOut();
    super.dispose();
  }

  Future<void> getUserData() async {
    if (googleProvider.user != null) {
      var headers = await googleProvider.user.authHeaders;
      print(headers);
      var response = await getUserDetailsGoogle(headers);
      setState(() {
        name = response.names[0].displayName;
        photoUrl = response.photos[0].url;
        var birthDate = response.birthdays[1].date;
        birthDay = birthDate.month.toString() +
            "/" +
            birthDate.day.toString() +
            "/" +
            birthDate.year.toString();
      });
    } else if (facebookProvider.token != null) {
      var token = facebookProvider.token.token;
      print(token);
      var response = await getUserDetailsFacebook(token);
      setState(() {
        name = response.name;
        photoUrl = response.picture.data.url;
        birthDay = response.birthday;
      });
    }
    print(name);
    print(photoUrl);
    print(birthDay);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: (photoUrl == null)
              ? Text("Loading")
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        height: 100,
                        width: 100,
                        child: Image.network(
                          photoUrl,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(name),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(birthDay),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
