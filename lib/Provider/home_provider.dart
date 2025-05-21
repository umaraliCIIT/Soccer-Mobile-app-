import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:soccer_mobile_app/Models/data/dashboard/coaches_dm.dart';
import 'package:soccer_mobile_app/Models/data/dashboard/my_session_dm.dart';
import 'package:soccer_mobile_app/Models/data/dashboard/session_dm.dart';
import 'package:soccer_mobile_app/Models/data/dashboard/session_participants_dm.dart';
import 'package:soccer_mobile_app/Models/repository/home_repository.dart';
import 'package:soccer_mobile_app/Utils/Constants/custom_loading.dart';
import 'package:soccer_mobile_app/Utils/Constants/storage_keys.dart';
import 'package:soccer_mobile_app/Utils/Helpers/helper_functions.dart';
import 'package:soccer_mobile_app/main.dart';

class HomeProvider extends ChangeNotifier {
  SessionModel? sessionData = SessionModel();
  MySessionModel? mySessionData = MySessionModel();
  SessionParticipantsModel participantsModel = SessionParticipantsModel();
  GetAllCoaches coaches = GetAllCoaches();

  Future getSessions({String? params}) async {
    CustomLoading.showLoadingIndicator();
    var res = await HomeRepository().getSessions(params ?? "");
    CustomLoading.hideLoadingIndicator();
    var result = box.read(Storage.userRole);
    if (result == 'admin') {
      if (res is List) {
        sessionData?.data = res.map((e) => SessionData.fromJson(e as Map<String, dynamic>)).toList();
      } else {
        sessionData?.data = [];
      }
    } else if (res['success'] != null && res['success'] == true) {
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
      // HelperFunctions.showErrorToast('${res['message']}');
    }
    notifyListeners();
  }

  Future getAllCoaches() async {
    CustomLoading.showLoadingIndicator();
    var res = await HomeRepository().getAllCoaches();
    CustomLoading.hideLoadingIndicator();
    if (res['success'] != null && res['success'] == true) {
      coaches = GetAllCoaches.fromJson(res);
    } else {
      HelperFunctions.showErrorToast('${res['message']}');
    }
    notifyListeners();
  }

  Future fetchSessionsParticipants({required String id}) async {
    CustomLoading.showLoadingIndicator();
    var res = await HomeRepository().getSessionParticipant(id);
    CustomLoading.hideLoadingIndicator();
    if (res['success'] != null && res['success'] == true) {
      participantsModel = SessionParticipantsModel.fromJson(res);
    } else {
      HelperFunctions.showErrorToast('${res['message']}');
    }
    notifyListeners();
  }

  Future createCoach({required Map<String, String> fields, Map<String, File>? files}) async {
    CustomLoading.showLoadingIndicator();
    var res = await HomeRepository().createSession(fields: fields, files: files);
    CustomLoading.hideLoadingIndicator();

    if (res != null && res['success'] != null && res['success'] == true) {
      HelperFunctions.showSuccessToast('${res['message']}');
    } else {
      HelperFunctions.showErrorToast('${res['message']}');
    }
  }

  Future enrollSession(Map<String, dynamic> map) async {
    CustomLoading.showLoadingIndicator();
    var res = await HomeRepository().enrollSession(map);
    CustomLoading.hideLoadingIndicator();
    if (res['success'] != null && res['success'] == true) {
      HelperFunctions.showSuccessToast('${res['message']}');
    } else {
      HelperFunctions.showErrorToast('${res['message']}');
    }
  }

  Future acceptParticipant(Map<String, dynamic> map) async {
    CustomLoading.showLoadingIndicator();
    var res = await HomeRepository().acceptParticipant(map);
    CustomLoading.hideLoadingIndicator();
    if (res['success'] != null && res['success'] == true) {
      HelperFunctions.showSuccessToast('${res['message']}');
    } else {
      HelperFunctions.showErrorToast('${res['message']}');
    }
  }

  Future rejectParticipant(Map<String, dynamic> map) async {
    CustomLoading.showLoadingIndicator();
    var res = await HomeRepository().rejectParticipant(map);
    CustomLoading.hideLoadingIndicator();
    if (res['success'] != null && res['success'] == true) {
      HelperFunctions.showSuccessToast('${res['message']}');
    } else {
      HelperFunctions.showErrorToast('${res['message']}');
    }
  }
}
