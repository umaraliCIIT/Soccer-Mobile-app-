class GetAllCoaches {
  bool? success;
  List<CoachData>? data;

  GetAllCoaches({this.success, this.data});

  GetAllCoaches.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <CoachData>[];
      json['data'].forEach((v) {
        data!.add(new CoachData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CoachData {
  String? sId;
  String? email;
  String? profilePicture;
  String? firstName;
  String? lastName;
  List<String>? sessionsCoaching;
  int? iV;

  CoachData({this.sId, this.email, this.profilePicture, this.firstName, this.lastName, this.sessionsCoaching, this.iV});

  CoachData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    profilePicture = json['profilePicture'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    sessionsCoaching = json['sessionsCoaching'].cast<String>();
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['profilePicture'] = this.profilePicture;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['sessionsCoaching'] = this.sessionsCoaching;
    data['__v'] = this.iV;
    return data;
  }

  String get fullName => '$firstName $lastName';

  @override
  String toString() => fullName;
}
