import 'package:soccer_mobile_app/Models/data/auth/login_dm.dart';
import 'package:soccer_mobile_app/Services/api_services.dart';
import 'package:soccer_mobile_app/Services/end_points.dart';
import 'package:soccer_mobile_app/Utils/Constants/storage_keys.dart';
import 'package:soccer_mobile_app/main.dart';

class AuthRepository {
  late Map<String, dynamic> _postBody;
  Map<String, String>? _header;

  login({required Map<String, dynamic> body}) async {
    var result = box.read(Storage.userRole);
    _postBody = body;
    _header = {"Content-Type": "application/json", "Accept": "application/json"};
    var response = await ApiService(endPoint: '/$result/${EndPoints.login}').post(header: _header!, postBody: _postBody);
    return response;
  }

  resetPassword({required Map<String, dynamic> body}) async {
    var result = await box.read(Storage.userRole);
    _postBody = body;
    _header = {"Content-Type": "application/json", "Accept": "application/json"};
    var response = await ApiService(endPoint: '/$result/${EndPoints.resetPassword}').post(header: _header!, postBody: _postBody);
    return response;
  }

  signup({required fields, required files}) async {
    var result = box.read(Storage.userRole);
    var response = await ApiService(endPoint: '/$result/${EndPoints.signup}').postFormData(fields: fields, files: files);
    return response;
  }

  verifyOtp({required body}) async {
    var result = box.read(Storage.userRole);
    _postBody = body;
    _header = {"Content-Type": "application/json", "Accept": "application/json"};
    var response = await ApiService(endPoint: '/$result/${EndPoints.verifyOtp}').post(header: _header!, postBody: _postBody);
    return response;
  }

  verifyOtpNewUser({required body}) async {
    var result = box.read(Storage.userRole);
    _postBody = body;
    _header = {"Content-Type": "application/json", "Accept": "application/json"};
    var response = await ApiService(endPoint: '/$result/${EndPoints.verifyOtpNewUser}').post(header: _header!, postBody: _postBody);
    return response;
  }

  changePassword({required Map<String, String> body}) {
    var result = box.read(Storage.userRole);
    _postBody = body;
    _header = {"Content-Type": "application/json", "Accept": "application/json"};
    return ApiService(endPoint: '/$result/${EndPoints.changePassword}').post(header: _header!, postBody: _postBody);
  }

  createPassword({required Map<String, String> body, bool isProfile = false}) {
    var result = box.read(Storage.userRole);

    if (isProfile) {
      var userLogin = box.read(Storage.userData);
      LoginResponse data = LoginResponse.fromJson(userLogin);
      _header = {"Content-Type": "application/json", "Accept": "application/json", 'Authorization': 'Bearer ${data.token}'};
    } else {
      _header = {"Content-Type": "application/json", "Accept": "application/json"};
    }
    _postBody = body;
    return ApiService(endPoint: '/$result/${EndPoints.createPassword}').post(header: _header!, postBody: _postBody);
  }

  resendOtp({required Map<String, String> body}) {
    var result = box.read(Storage.userRole);
    _postBody = body;
    _header = {"Content-Type": "application/json", "Accept": "application/json"};
    return ApiService(endPoint: '/$result/${EndPoints.resendOtp}').post(header: _header!, postBody: _postBody);
  }

  updateProfile({required fields, required files}) async {
    var result = box.read(Storage.userRole);
    var userLogin = box.read(Storage.userData);
    LoginResponse data = LoginResponse.fromJson(userLogin);
    print('data token --> ${data.token}');
    _header = {"Content-Type": "application/json", "Accept": "application/json", 'Authorization': 'Bearer ${data.token}'};

    var response = await ApiService(endPoint: '/$result/${EndPoints.updateProfile}').putFormData(header: _header!, fields: fields, files: files);
    return response;
  }
}
