class MySessionModel {
  bool? success;
  List<Data>? data;

  MySessionModel({this.success, this.data});

  MySessionModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? title;
  String? description;
  String? image;
  String? location;
  String? sessionType;
  int? maxParticipants;
  List<String>? joinedParticipants;
  List<String>? pendingParticipants;
  String? durationStart;
  String? durationEnd;
  int? price;
  SessionHost? sessionHost;
  String? createdAt;
  int? iV;

  Data(
      {this.sId,
      this.title,
      this.description,
      this.image,
      this.location,
      this.sessionType,
      this.maxParticipants,
      this.joinedParticipants,
      this.pendingParticipants,
      this.durationStart,
      this.durationEnd,
      this.price,
      this.sessionHost,
      this.createdAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    location = json['location'];
    sessionType = json['sessionType'];
    maxParticipants = json['maxParticipants'];
    joinedParticipants = json['joinedParticipants'].cast<String>();
    pendingParticipants = json['pendingParticipants'].cast<String>();
    durationStart = json['durationStart'];
    durationEnd = json['durationEnd'];
    price = json['price'];
    sessionHost = json['sessionHost'] != null ? SessionHost.fromJson(json['sessionHost']) : null;
    createdAt = json['createdAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    data['location'] = location;
    data['sessionType'] = sessionType;
    data['maxParticipants'] = maxParticipants;
    data['joinedParticipants'] = joinedParticipants;
    data['pendingParticipants'] = pendingParticipants;
    data['durationStart'] = durationStart;
    data['durationEnd'] = durationEnd;
    data['price'] = price;
    if (sessionHost != null) {
      data['sessionHost'] = sessionHost!.toJson();
    }
    data['createdAt'] = createdAt;
    data['__v'] = iV;
    return data;
  }
}

class SessionHost {
  String? sId;
  String? email;
  String? firstName;
  String? lastName;
  int? iV;

  SessionHost({this.sId, this.email, this.firstName, this.lastName, this.iV});

  SessionHost.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['email'] = email;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['__v'] = iV;
    return data;
  }
}
