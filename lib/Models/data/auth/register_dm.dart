class SignUpResponse {
  bool? success;
  String? message;
  Data? data;
  String? token;
  String? refresh;

  SignUpResponse({this.success, this.message, this.data, this.token, this.refresh});

  SignUpResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    token = json['token'];
    refresh = json['refresh'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['token'] = token;
    data['refresh'] = refresh;
    return data;
  }
}

class Data {
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

  Data({this.sId, this.email, this.firstName, this.lastName, this.phone, this.profilePicture, this.isVerified, this.sessionsEnrolled, this.sessionsPending, this.createdAt, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
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
