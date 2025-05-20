class SessionParticipantsModel {
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
  List<JoinedParticipantsDetails>? joinedParticipantsDetails;
  List<JoinedParticipantsDetails>? pendingParticipantsDetails;
  String? id;

  SessionParticipantsModel(
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
      this.iV,
      this.joinedParticipantsDetails,
      this.pendingParticipantsDetails,
      this.id});

  SessionParticipantsModel.fromJson(Map<String, dynamic> json) {
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
    if (json['joinedParticipantsDetails'] != null) {
      joinedParticipantsDetails = <JoinedParticipantsDetails>[];
      json['joinedParticipantsDetails'].forEach((v) {
        joinedParticipantsDetails!.add(JoinedParticipantsDetails.fromJson(v));
      });
    }
    if (json['pendingParticipantsDetails'] != null) {
      pendingParticipantsDetails = <JoinedParticipantsDetails>[];
      json['pendingParticipantsDetails'].forEach((v) {
        pendingParticipantsDetails!.add(JoinedParticipantsDetails.fromJson(v));
      });
    }
    id = json['id'];
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
    if (joinedParticipantsDetails != null) {
      data['joinedParticipantsDetails'] = joinedParticipantsDetails!.map((v) => v.toJson()).toList();
    }
    if (pendingParticipantsDetails != null) {
      data['joinedParticipantsDetails'] = pendingParticipantsDetails!.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
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

class JoinedParticipantsDetails {
  String? sId;
  String? email;
  String? firstName;
  String? lastName;
  int? phone;
  String? profilePicture;
  bool? isVerified;
  List<String>? sessionsEnrolled;
  List<String>? sessionsPending;
  String? createdAt;
  int? iV;

  JoinedParticipantsDetails(
      {this.sId, this.email, this.firstName, this.lastName, this.phone, this.profilePicture, this.isVerified, this.sessionsEnrolled, this.sessionsPending, this.createdAt, this.iV});

  JoinedParticipantsDetails.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phone = json['phone'];
    profilePicture = json['profilePicture'];
    isVerified = json['isVerified'];
    sessionsEnrolled = json['sessionsEnrolled'].cast<String>();
    sessionsPending = json['sessionsPending'].cast<String>();
    createdAt = json['createdAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['email'] = email;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['phone'] = phone;
    data['profilePicture'] = profilePicture;
    data['isVerified'] = isVerified;
    data['sessionsEnrolled'] = sessionsEnrolled;
    data['sessionsPending'] = sessionsPending;
    data['createdAt'] = createdAt;
    data['__v'] = iV;
    return data;
  }
}
