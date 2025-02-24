class LoginResponse {
  bool? success;
  String? token;
  String? refresh;
  User? user;

  LoginResponse({this.success, this.token, this.refresh, this.user});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    token = json['token'];
    refresh = json['refresh'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['token'] = this.token;
    data['refresh'] = this.refresh;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? sId;
  String? email;
  String? firstName;
  String? lastName;
  int? phone;
  String? profilePicture;
  String? password;
  List<String>? sessionsEnrolled;
  List<String>? sessionsPending;
  String? createdAt;
  int? iV;

  User({this.sId, this.email, this.firstName, this.lastName, this.phone, this.profilePicture, this.password, this.sessionsEnrolled, this.sessionsPending, this.createdAt, this.iV});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phone = json['phone'];
    profilePicture = json['profilePicture'];
    password = json['password'];
    sessionsEnrolled = json['sessionsEnrolled'].cast<String>();
    sessionsPending = json['sessionsPending'].cast<String>();
    createdAt = json['createdAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['phone'] = this.phone;
    data['profilePicture'] = this.profilePicture;
    data['password'] = this.password;
    data['sessionsEnrolled'] = this.sessionsEnrolled;
    data['sessionsPending'] = this.sessionsPending;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    return data;
  }
}
