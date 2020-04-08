import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:user_details/models/facebookAPI.dart';
import 'package:user_details/models/googleAPI.dart';

import '../globals.dart';

Future<GoogleApiResponse> getUserDetailsGoogle(Map<String, String> headers) async {
  http.Response response = await http.get(
    urlGoogle,
    headers: headers,
  );

  print(json.decode(response.body));
  if (response.statusCode == 200) {
    var googleApiResponse = GoogleApiResponse.fromJson(json.decode(response.body));
    return googleApiResponse;
  }
  else{
    throw Exception("No response");
  }
}

Future<FacebookApiResponse> getUserDetailsFacebook(String token) async {
  http.Response response = await http.get(
    urlFacebook + token,
  );

  print(json.decode(response.body));
  if (response.statusCode == 200) {
    var facebookApiResponse = FacebookApiResponse.fromJson(json.decode(response.body));
    return facebookApiResponse;
  }
  else{
    throw Exception("No response");
  }
}
