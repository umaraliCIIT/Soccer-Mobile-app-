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

  getMySession() {
    var result = box.read(Storage.userRole);
    var userLogin = box.read(Storage.userData);
    LoginResponse data = LoginResponse.fromJson(userLogin);
    _header = {"Content-Type": "application/json", "Accept": "application/json", 'Authorization': 'Bearer ${data.token}'};
    return ApiService(endPoint: "/$result/${EndPoints.mySession}").get(header: _header);
  }
}
