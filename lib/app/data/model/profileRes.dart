

class ProfileRes {
  dynamic status;
  Data? data;

  ProfileRes({
    this.status,
    this.data,
  });

  factory ProfileRes.fromMap(Map<String, dynamic> json) => ProfileRes(
    status: json["status"],
    data: json["data"] == null ? null : Data.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "data": data!.toMap(),
  };
}

class Data {
  dynamic indexId;
  dynamic name;
  dynamic photos;
  dynamic mobile;
  dynamic email;
  dynamic password;

  Data({
    this.indexId,
    this.name,
    this.photos,
    this.mobile,
    this.email,
    this.password,
  });

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    indexId: json["index_id"],
    name: json["name"],
    photos: json["photos"],
    mobile: json["mobile"],
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toMap() => {
    "index_id": indexId,
    "name": name,
    "photos": photos,
    "mobile": mobile,
    "email": email,
    "password": password,
  };
}
