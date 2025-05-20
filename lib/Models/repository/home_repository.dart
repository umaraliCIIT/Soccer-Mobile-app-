import 'package:soccer_mobile_app/Models/data/auth/login_dm.dart';
import 'package:soccer_mobile_app/Services/api_services.dart';
import 'package:soccer_mobile_app/Services/end_points.dart';
import 'package:soccer_mobile_app/Utils/Constants/storage_keys.dart';
import 'package:soccer_mobile_app/main.dart';

class HomeRepository {
  late Map<String, dynamic> _postBody;
  late Map<String, String> _header;

  getSessions(String param) async {
    var result = box.read(Storage.userRole);
    var userLogin = box.read(Storage.userData);
    LoginResponse data = LoginResponse.fromJson(userLogin);
    _header = {"Content-Type": "application/json", "Accept": "application/json", 'Authorization': 'Bearer ${data.token}'};
    return await ApiService(endPoint: '/$result/${EndPoints.sessions}?type=$param').get(header: _header);
  }

  getAllCoaches() async {
    var userLogin = box.read(Storage.userData);
    LoginResponse data = LoginResponse.fromJson(userLogin);
    _header = {"Content-Type": "application/json", "Accept": "application/json", 'Authorization': 'Bearer ${data.token}'};
    return await ApiService(endPoint: '/${EndPoints.coach}').get(header: _header);
  }

  getSessionParticipant(String param) async {
    var result = box.read(Storage.userRole);
    return await ApiService(endPoint: '/$result/${EndPoints.adminSessions}').getStreamData(id: param);
  }

  getMySession() {
    var result = box.read(Storage.userRole);
    var userLogin = box.read(Storage.userData);
    LoginResponse data = LoginResponse.fromJson(userLogin);
    _header = {"Content-Type": "application/json", "Accept": "application/json", 'Authorization': 'Bearer ${data.token}'};
    return ApiService(endPoint: "/$result/${EndPoints.mySession}").get(header: _header);
  }

  createSession({required fields, required files}) async {
    var result = box.read(Storage.userRole);
    var userLogin = box.read(Storage.userData);
    LoginResponse data = LoginResponse.fromJson(userLogin);
    _header = {"Content-Type": "application/json", "Accept": "application/json", 'Authorization': 'Bearer ${data.token}'};
    var response = await ApiService(endPoint: '/$result/${EndPoints.adminCreateSessions}').postFormData(fields: fields, files: files, header: _header);
    return response;
  }

  enrollSession(Map<String, dynamic> map) async {
    var result = box.read(Storage.userRole);
    var userLogin = box.read(Storage.userData);
    LoginResponse data = LoginResponse.fromJson(userLogin);
    _header = {"Content-Type": "application/json", "Accept": "application/json", 'Authorization': 'Bearer ${data.token}'};
    return await ApiService(endPoint: '/$result/${EndPoints.enrollSession}').post(header: _header, postBody: map);
  }

  acceptParticipant(Map<String, dynamic> map) {
    var result = box.read(Storage.userRole);
    var userLogin = box.read(Storage.userData);
    LoginResponse data = LoginResponse.fromJson(userLogin);
    _header = {"Content-Type": "application/json", "Accept": "application/json", 'Authorization': 'Bearer ${data.token}'};
    return ApiService(endPoint: '/$result/${EndPoints.acceptParticipant}').post(header: _header, postBody: map);
  }

  rejectParticipant(Map<String, dynamic> map) {
    var result = box.read(Storage.userRole);
    var userLogin = box.read(Storage.userData);
    LoginResponse data = LoginResponse.fromJson(userLogin);
    _header = {"Content-Type": "application/json", "Accept": "application/json", 'Authorization': 'Bearer ${data.token}'};
    return ApiService(endPoint: '/$result/${EndPoints.rejectParticipant}').post(header: _header, postBody: map);
  }
}
