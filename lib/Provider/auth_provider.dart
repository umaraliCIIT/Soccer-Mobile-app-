import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:soccer_mobile_app/Models/data/auth/login_dm.dart';
import 'package:soccer_mobile_app/Models/data/auth/register_dm.dart';
import 'package:soccer_mobile_app/Models/repository/auth_repository.dart';
import 'package:soccer_mobile_app/Utils/Constants/custom_loading.dart';
import 'package:soccer_mobile_app/Utils/Constants/storage_keys.dart';
import 'package:soccer_mobile_app/Utils/Helpers/helper_functions.dart';
import 'package:soccer_mobile_app/config/routes/app_navigation.dart';
import 'package:soccer_mobile_app/config/routes/app_routes.dart';
import 'package:soccer_mobile_app/config/theme/app_colors.dart';
import 'package:soccer_mobile_app/main.dart';

class AuthProvider extends ChangeNotifier {
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  String phoneNum = '';
  String phoneIso = '';
  bool _isObscureText = true;
  bool _isConfirmObscureText = true;
  bool _isCamera = false;
  bool _isResend = false;
  String _imagePath = '';
  File? _imageFile;

  get isCamera => _isCamera;
  get isResend => _isResend;

  get isObscure => _isObscureText;
  get isConfirmObscure => _isConfirmObscureText;

  get imagePath => _imagePath;

  setObscure() {
    _isObscureText = !_isObscureText;
    notifyListeners();
  }

  setConfirmObscure() {
    _isConfirmObscureText = !_isConfirmObscureText;
    notifyListeners();
  }

  setCamera(value) {
    _isCamera = value;
    notifyListeners();
  }

  setResend(value) {
    _isResend = value;
    notifyListeners();
  }

  setImagePath(value) {
    _imagePath = value;
    notifyListeners();
  }

  Future login() async {
    if (emailController.text.isEmpty || passController.text.isEmpty) {
      HelperFunctions.showErrorToast('Please fill the required fields!');
      return;
    }
    CustomLoading.showLoadingIndicator();
    Map<String, dynamic> map = {
      'email': emailController.text,
      'password': passController.text,
    };
    box.write(Storage.email, emailController.text);

    var res = await AuthRepository().login(body: map);
    CustomLoading.hideLoadingIndicator();

    if (res['success']) {
      emailController.clear();
      passController.clear();
      if (res['message'] == "Account verification pending. Please enter the OTP to continue") {
        HelperFunctions.showSuccessToast(res['message']);
        AppNavigation.pushReplacementTo(AppRoutes.routeOtpVerifyScreen, arguments: {'new_user': true});
      } else {
        LoginResponse response = LoginResponse.fromJson(res);
        box.write(Storage.userData, response.toJson());
        HelperFunctions.showSuccessToast("Login successfully!");
        AppNavigation.pushAndKillAll(AppRoutes.routeDashboardScreen);
      }
    } else {
      HelperFunctions.showErrorToast(res['message']);
    }
    notifyListeners();
  }

  Future resetPassword() async {
    if (emailController.text.isEmpty) {
      HelperFunctions.showErrorToast('Please fill the required fields!');
      return;
    }
    CustomLoading.showLoadingIndicator();
    try {
      Map<String, dynamic> map = {
        'email': emailController.text,
      };
      box.write(Storage.email, emailController.text);

      var res = await AuthRepository().resetPassword(body: map);
      CustomLoading.hideLoadingIndicator();
      if (res['success']) {
        emailController.clear();
        HelperFunctions.showSuccessToast('${res['message']}');
        AppNavigation.pushReplacementTo(AppRoutes.routeOtpVerifyScreen, arguments: {'new_user': false});
      } else {
        HelperFunctions.showErrorToast(res['message']);
      }
      notifyListeners();
    } catch (e) {
      HelperFunctions.showSuccessToast(e.toString());
    }
  }

  Future signup() async {
    if (fNameController.text.isEmpty || lNameController.text.isEmpty || emailController.text.isEmpty || passController.text.isEmpty || phoneController.text.isEmpty) {
      HelperFunctions.showErrorToast('Please fill the required fields!');
      return;
    }
    CustomLoading.showLoadingIndicator();
    Map<String, String> map = {
      'firstName': fNameController.text,
      'lastName': lNameController.text,
      'email': emailController.text,
      'password': passController.text,
      'phone': phoneController.text,
    };
    box.write(Storage.email, emailController.text);

    Map<String, File>? files;
    if (_imageFile != null) {
      files = {
        'file': _imageFile!, // Add the profile image file
      };
    }
    var res = await AuthRepository().signup(fields: map, files: files);
    CustomLoading.hideLoadingIndicator();
    if (res['success'] != null && res['success'] == true) {
      fNameController.clear();
      lNameController.clear();
      emailController.clear();
      passController.clear();
      phoneController.clear();

      HelperFunctions.showSuccessToast('${res['message']}');
      AppNavigation.pushReplacementTo(AppRoutes.routeOtpVerifyScreen, arguments: {'new_user': true});
    } else {
      HelperFunctions.showErrorToast('${res['message']}');
    }
    notifyListeners();
  }

  Future verifyOtp() async {
    if (otpController.text.isEmpty) {
      HelperFunctions.showErrorToast('Please fill the required fields!');
      return;
    }
    CustomLoading.showLoadingIndicator();
    try {
      Map<String, String> map = {
        'email': box.read(Storage.email),
        'otp': otpController.text,
      };
      var res = await AuthRepository().verifyOtp(body: map);
      CustomLoading.hideLoadingIndicator();

      if (res['success'] != null && res['success'] == true) {
        otpController.clear();
        HelperFunctions.showSuccessToast('${res['message']}');
        AppNavigation.pushAndKillAll(AppRoutes.routeCreateNewPasswordScreen);
      } else {
        HelperFunctions.showErrorToast('${res['message']}');
      }
      notifyListeners();
    } catch (e) {
      HelperFunctions.showErrorToast(e.toString());
    }
  }

  Future resendOtp() async {
    CustomLoading.showLoadingIndicator();
    try {
      Map<String, String> map = {
        'email': box.read(Storage.email),
      };
      var res = await AuthRepository().resendOtp(body: map);
      CustomLoading.hideLoadingIndicator();
      if (res['success'] != null && res['success'] == true) {
        setResend(true);

        HelperFunctions.showSuccessToast('${res['message']}');
      } else {
        setResend(false);

        HelperFunctions.showErrorToast('${res['message']}');
      }
      notifyListeners();
    } catch (e) {
      HelperFunctions.showErrorToast(e.toString());
    }
  }

  Future verifyNewUser() async {
    if (otpController.text.isEmpty) {
      HelperFunctions.showErrorToast('Please fill the required fields!');
      return;
    }
    CustomLoading.showLoadingIndicator();
    try {
      Map<String, String> map = {
        'email': box.read(Storage.email),
        'otp': otpController.text,
      };
      var res = await AuthRepository().verifyOtpNewUser(body: map);

      CustomLoading.hideLoadingIndicator();

      if (res['success'] != null && res['success'] == true) {
        otpController.clear();
        HelperFunctions.showSuccessToast('${res['message']}');
        SignUpResponse response = SignUpResponse.fromJson(res);
        box.write(Storage.userData, response.toJson());
        AppNavigation.pushAndKillAll(AppRoutes.routeDashboardScreen);
      } else {
        HelperFunctions.showErrorToast('${res['message']}');
      }
      notifyListeners();
    } catch (e) {
      HelperFunctions.showErrorToast(e.toString());
    }
  }

  Future changePassword() async {
    if (passController.text.isEmpty) {
      HelperFunctions.showErrorToast('Please fill the required fields!');
      return;
    }
    CustomLoading.showLoadingIndicator();
    try {
      Map<String, String> map = {
        'email': box.read(Storage.email),
        'password': passController.text,
      };
      var res = await AuthRepository().changePassword(body: map);
      CustomLoading.hideLoadingIndicator();
      if (res['success'] != null && res['success'] == true) {
        passController.clear();
        HelperFunctions.showSuccessToast('${res['message']}');
        AppNavigation.pushAndKillAll(AppRoutes.routeDashboardScreen);
      } else {
        HelperFunctions.showErrorToast('${res['message']}');
      }

      notifyListeners();
    } catch (e) {
      HelperFunctions.showErrorToast(e.toString());
      notifyListeners();
    }
  }

  Future createPassword(bool isProfile) async {
    if (passController.text.isEmpty || newPassController.text.isEmpty) {
      HelperFunctions.showErrorToast('Please fill the required fields!');
      return;
    }
    CustomLoading.showLoadingIndicator();
    Map<String, String> map = {
      "email": box.read(Storage.email),
      "password": passController.text,
      "confirmPassword": newPassController.text,
    };
    var res = await AuthRepository().createPassword(body: map, isProfile: isProfile);
    CustomLoading.hideLoadingIndicator();
    if (res['success'] != null && res['success'] == true) {
      passController.clear();
      newPassController.clear();
      HelperFunctions.showSuccessToast('${res['message']}');
      if (isProfile) {
        AppNavigation.goBack();
      } else {
        AppNavigation.pushAndKillAll(AppRoutes.routeDashboardScreen);
      }
    } else {
      HelperFunctions.showErrorToast('${res['message']}');
    }
    notifyListeners();
  }

  Future getProfile() async {
    CustomLoading.showLoadingIndicator();

    Future.delayed(const Duration(seconds: 3), () async {
      var data = box.read(Storage.userData);
      if (data != null) {
        CustomLoading.hideLoadingIndicator();

        LoginResponse response = LoginResponse.fromJson(data);

        fNameController.text = response.data?.firstName ?? '';
        lNameController.text = response.data?.lastName ?? '';
        emailController.text = response.data?.email ?? '';
        phoneNum = response.data?.phone.toString() ?? '';
        phoneController.text = response.data?.phone.toString() ?? '';
        setImagePath(response.data?.profilePicture ?? '');
        var value = await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNum);
        phoneIso = value.isoCode ?? 'US';
      }
      notifyListeners();
    });
  }

  Future updateProfile() async {
    if (fNameController.text.isEmpty || lNameController.text.isEmpty || phoneController.text.isEmpty) {
      HelperFunctions.showErrorToast('Please fill the required fields!');
      return;
    }
    CustomLoading.showLoadingIndicator();
    Map<String, String> map = {
      'firstName': fNameController.text,
      'lastName': lNameController.text,
      'phone': phoneController.text,
    };

    Map<String, File>? files;
    if (_imageFile != null) {
      files = {
        'file': _imageFile!, // Add the profile image file
      };
    }
    var res = await AuthRepository().updateProfile(fields: map, files: files);
    CustomLoading.hideLoadingIndicator();
    if (res['success'] != null && res['success'] == true) {
      fNameController.clear();
      lNameController.clear();
      phoneController.clear();
      var data = box.read(Storage.userData);
      LoginResponse response = LoginResponse.fromJson(data);

      response.data?.firstName = res['data']['firstName'];
      response.data?.lastName = res['data']['lastName'];
      response.data?.profilePicture = res['data']['profilePicture'];
      response.data?.phone = res['data']['phone'];

      box.write(Storage.userData, response.toJson());

      HelperFunctions.showSuccessToast('${res['message']}');
    } else {
      HelperFunctions.showErrorToast('${res['message']}');
    }
    notifyListeners();
  }

  void logout() {
    CustomLoading.showLoadingIndicator();
    try {
      Future.delayed(const Duration(seconds: 3), () {
        CustomLoading.hideLoadingIndicator();
        HelperFunctions.showSuccessToast('Logout Successfully!');
        box.erase();
        AppNavigation.pushAndKillAll(AppRoutes.routeTypeSelectionScreen);
      });
      notifyListeners();
    } catch (e) {
      HelperFunctions.showErrorToast(e.toString());
      notifyListeners();
    }
  }

  ///~~~~~~~~~~~~IMAGE PICKER~~~~~~~~~~~~///

  pickImage() async {
    XFile? imageFile;
    final ImagePicker picker = ImagePicker();
    if (!_isCamera) {
      imageFile = await picker.pickImage(source: ImageSource.gallery);
    } else {
      imageFile = await picker.pickImage(source: ImageSource.camera);
    }

    /// If user selected an image, proceed to cropping
    if (imageFile != null) {
      File? croppedFile = await _cropImage(File(imageFile.path));
      _imageFile = croppedFile;
      setImagePath(croppedFile?.path ?? '');
    }
  }

  /// **Function to Crop Image**
  Future<File?> _cropImage(File imageFile) async {
    CroppedFile? cropped = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: '',
          toolbarColor: AppColors.primaryColor300,
          cropFrameColor: AppColors.primaryColor600,
          cropGridColor: AppColors.primaryColor600,
          statusBarColor: AppColors.secondaryColor300,
          activeControlsWidgetColor: AppColors.primaryColor600,
          toolbarWidgetColor: Colors.white,
          aspectRatioPresets: [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
            CropAspectRatioPresetCustom(),
          ],
        ),
        IOSUiSettings(
          title: '',
          aspectRatioPresets: [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
            CropAspectRatioPresetCustom(), // IMPORTANT: iOS supports only one custom aspect ratio in preset list
          ],
        ),
      ],
    );
    return cropped != null ? File(cropped.path) : null;
  }
}

class CropAspectRatioPresetCustom implements CropAspectRatioPresetData {
  @override
  (int, int)? get data => (2, 3);

  @override
  String get name => '2x3 (customized)';
}
