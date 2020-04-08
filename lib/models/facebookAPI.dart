// To parse this JSON data, do
//
//     final facebookApiResponse = facebookApiResponseFromJson(jsonString);

import 'dart:convert';

FacebookApiResponse facebookApiResponseFromJson(String str) => FacebookApiResponse.fromJson(json.decode(str));

String facebookApiResponseToJson(FacebookApiResponse data) => json.encode(data.toJson());

class FacebookApiResponse {
  String id;
  String name;
  String birthday;
  Picture picture;

  FacebookApiResponse({
    this.id,
    this.name,
    this.birthday,
    this.picture,
  });

  factory FacebookApiResponse.fromJson(Map<String, dynamic> json) => FacebookApiResponse(
    id: json["id"],
    name: json["name"],
    birthday: json["birthday"],
    picture: Picture.fromJson(json["picture"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "birthday": birthday,
    "picture": picture.toJson(),
  };
}

class Picture {
  Data data;

  Picture({
    this.data,
  });

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  int height;
  bool isSilhouette;
  String url;
  int width;

  Data({
    this.height,
    this.isSilhouette,
    this.url,
    this.width,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    height: json["height"],
    isSilhouette: json["is_silhouette"],
    url: json["url"],
    width: json["width"],
  );

  Map<String, dynamic> toJson() => {
    "height": height,
    "is_silhouette": isSilhouette,
    "url": url,
    "width": width,
  };
}
