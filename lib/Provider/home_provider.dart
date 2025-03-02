import 'package:flutter/cupertino.dart';
import 'package:soccer_mobile_app/Models/data/dashboard/my_session_dm.dart';
import 'package:soccer_mobile_app/Models/data/dashboard/session_dm.dart';
import 'package:soccer_mobile_app/Models/repository/home_repository.dart';
import 'package:soccer_mobile_app/Utils/Constants/custom_loading.dart';
import 'package:soccer_mobile_app/Utils/Helpers/helper_functions.dart';

class HomeProvider extends ChangeNotifier {
  SessionModel? sessionData = SessionModel();
  MySessionModel? mySessionData = MySessionModel();

  Future getSessions({String? params}) async {
    CustomLoading.showLoadingIndicator();
    var res = await HomeRepository().getSessions(params ?? "");
    CustomLoading.hideLoadingIndicator();
    if (res['success'] != null && res['success'] == true) {
      sessionData = SessionModel.fromJson(res);
    } else {
      HelperFunctions.showErrorToast('${res['message']}');
    }
    notifyListeners();
  }

  Future getMySession() async {
    CustomLoading.showLoadingIndicator();
    var res = await HomeRepository().getMySession();
    CustomLoading.hideLoadingIndicator();
    if (res['success'] != null && res['success'] == true) {
      mySessionData = MySessionModel.fromJson(res);
    } else {
      HelperFunctions.showErrorToast('${res['message']}');
    }
    notifyListeners();
  }
}
