class FeedBody {
  int? id;
  User? user;
  String? photoUrl;
  String? image;
  String? timestamp;
  Location? location;
  String? description;

  FeedBody(
      {this.id,
      this.user,
      this.photoUrl,
      this.image,
      this.timestamp,
      this.location,
      this.description});

    FeedBody.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    photoUrl = json['photo_url'];
    image = json['image'];
    timestamp = json['timestamp'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    description = json['description'];
  }


}

class User {
  String? name;

  User({this.name});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

class Location {
  double? latitude;
  double? longitude;

  Location({this.latitude, this.longitude});

  Location.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'].toDouble();
    longitude = json['longitude'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}