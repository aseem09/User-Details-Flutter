// To parse this JSON data, do
//
//     final googleApiResponse = googleApiResponseFromJson(jsonString);

import 'dart:convert';

GoogleApiResponse googleApiResponseFromJson(String str) => GoogleApiResponse.fromJson(json.decode(str));

String googleApiResponseToJson(GoogleApiResponse data) => json.encode(data.toJson());

class GoogleApiResponse {
  String resourceName;
  String etag;
  List<Name> names;
  List<Photo> photos;
  List<Birthday> birthdays;
  List<AgeRange> ageRanges;

  GoogleApiResponse({
    this.resourceName,
    this.etag,
    this.names,
    this.photos,
    this.birthdays,
    this.ageRanges,
  });

  factory GoogleApiResponse.fromJson(Map<String, dynamic> json) => GoogleApiResponse(
    resourceName: json["resourceName"],
    etag: json["etag"],
    names: List<Name>.from(json["names"].map((x) => Name.fromJson(x))),
    photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
    birthdays: List<Birthday>.from(json["birthdays"].map((x) => Birthday.fromJson(x))),
    ageRanges: List<AgeRange>.from(json["ageRanges"].map((x) => AgeRange.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "resourceName": resourceName,
    "etag": etag,
    "names": List<dynamic>.from(names.map((x) => x.toJson())),
    "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
    "birthdays": List<dynamic>.from(birthdays.map((x) => x.toJson())),
    "ageRanges": List<dynamic>.from(ageRanges.map((x) => x.toJson())),
  };
}

class AgeRange {
  Metadata metadata;
  String ageRange;

  AgeRange({
    this.metadata,
    this.ageRange,
  });

  factory AgeRange.fromJson(Map<String, dynamic> json) => AgeRange(
    metadata: Metadata.fromJson(json["metadata"]),
    ageRange: json["ageRange"],
  );

  Map<String, dynamic> toJson() => {
    "metadata": metadata.toJson(),
    "ageRange": ageRange,
  };
}

class Metadata {
  bool primary;
  Source source;

  Metadata({
    this.primary,
    this.source,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
    primary: json["primary"] == null ? null : json["primary"],
    source: Source.fromJson(json["source"]),
  );

  Map<String, dynamic> toJson() => {
    "primary": primary == null ? null : primary,
    "source": source.toJson(),
  };
}

class Source {
  String type;
  String id;

  Source({
    this.type,
    this.id,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    type: json["type"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "id": id,
  };
}

class Birthday {
  Metadata metadata;
  Date date;

  Birthday({
    this.metadata,
    this.date,
  });

  factory Birthday.fromJson(Map<String, dynamic> json) => Birthday(
    metadata: Metadata.fromJson(json["metadata"]),
    date: Date.fromJson(json["date"]),
  );

  Map<String, dynamic> toJson() => {
    "metadata": metadata.toJson(),
    "date": date.toJson(),
  };
}

class Date {
  int month;
  int day;
  int year;

  Date({
    this.month,
    this.day,
    this.year,
  });

  factory Date.fromJson(Map<String, dynamic> json) => Date(
    month: json["month"],
    day: json["day"],
    year: json["year"] == null ? null : json["year"],
  );

  Map<String, dynamic> toJson() => {
    "month": month,
    "day": day,
    "year": year == null ? null : year,
  };
}

class Name {
  Metadata metadata;
  String displayName;
  String familyName;
  String givenName;
  String displayNameLastFirst;

  Name({
    this.metadata,
    this.displayName,
    this.familyName,
    this.givenName,
    this.displayNameLastFirst,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
    metadata: Metadata.fromJson(json["metadata"]),
    displayName: json["displayName"],
    familyName: json["familyName"] == null ? null : json["familyName"],
    givenName: json["givenName"],
    displayNameLastFirst: json["displayNameLastFirst"],
  );

  Map<String, dynamic> toJson() => {
    "metadata": metadata.toJson(),
    "displayName": displayName,
    "familyName": familyName == null ? null : familyName,
    "givenName": givenName,
    "displayNameLastFirst": displayNameLastFirst,
  };
}

class Photo {
  Metadata metadata;
  String url;
  bool photoDefault;

  Photo({
    this.metadata,
    this.url,
    this.photoDefault,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
    metadata: Metadata.fromJson(json["metadata"]),
    url: json["url"],
    photoDefault: json["default"],
  );

  Map<String, dynamic> toJson() => {
    "metadata": metadata.toJson(),
    "url": url,
    "default": photoDefault,
  };
}
