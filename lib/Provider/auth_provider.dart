import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:soccer_mobile_app/Models/data/auth/login_dm.dart';
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
  LoginResponse _response = LoginResponse();
  bool _isObscureText = true;
  bool _isCamera = false;
  String _imagePath = '';
  File? _imageFile;
  int timerDuration = 300;
  Timer? timer;
  get loginResponse => _response;

  get isCamera => _isCamera;

  get isObscure => _isObscureText;

  get imagePath => _imagePath;

  setResponse(value) {
    _response = value;
    notifyListeners();
  }

  setObscure() {
    _isObscureText = !_isObscureText;
    notifyListeners();
  }

  setCamera(value) {
    _isCamera = value;
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
    try {
      Map<String, dynamic> map = {
        'email': emailController.text,
        'password': passController.text,
      };
      _response = await AuthRepository().login(body: map);

      setResponse(_response);
      CustomLoading.hideLoadingIndicator();
      HelperFunctions.showSuccessToast('Login successful!');

      notifyListeners();
    } catch (e) {
      CustomLoading.hideLoadingIndicator();
      HelperFunctions.showErrorToast(e.toString());
    }
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
      var res = await AuthRepository().resetPassword(body: map);
      CustomLoading.hideLoadingIndicator();
      if (res['message'] == 'OTP sent successfully') {
        HelperFunctions.showSuccessToast('OTP send successfully!');
        AppNavigation.pushReplacementTo(AppRoutes.routeOtpVerifyScreen);
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
    try {
      Map<String, String> map = {
        'firstName': fNameController.text,
        'lastName': lNameController.text,
        'email': emailController.text,
        'password': passController.text,
        'phone': phoneController.text,
      };

      Map<String, File> files = {
        'file': _imageFile ?? File(''), // Add the profile image file
      };
      var res = await AuthRepository().signup(fields: map, files: files);
      box.write(Storage.email, emailController.text);
      CustomLoading.hideLoadingIndicator();
      HelperFunctions.showSuccessToast('${res['message']}');
      AppNavigation.pushReplacementTo(AppRoutes.routeOtpVerifyScreen);
      notifyListeners();
    } catch (e) {
      CustomLoading.hideLoadingIndicator();
      HelperFunctions.showErrorToast(e.toString());
      notifyListeners();
    }
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
      HelperFunctions.showSuccessToast('${res['message']}');
      AppNavigation.navigateTo(AppRoutes.routeOverviewScreen);
      notifyListeners();
    } catch (e) {
      CustomLoading.hideLoadingIndicator();
      HelperFunctions.showErrorToast(e.toString());
      notifyListeners();
    }
  }

  ///~~~~~~~~~~~~IMAGE PICKER~~~~~~~~~~~~///

  pickImage() async {
    XFile? imageFile;
    final ImagePicker picker = ImagePicker();

    print('Profile selection: $_isCamera');

    if (!_isCamera) {
      imageFile = await picker.pickImage(source: ImageSource.gallery);
    } else {
      imageFile = await picker.pickImage(source: ImageSource.camera);
    }

    /// If user selected an image, proceed to cropping
    if (imageFile != null) {
      File? croppedFile = await _cropImage(File(imageFile.path));
      print('imageFile: %%%%------> ${croppedFile}');
      _imageFile = croppedFile;
      setImagePath(croppedFile?.path ?? '');
      /* if (croppedFile != null) {
        /// Show loading indicator
        viewModel!.isImageUploading = true;
        _update();

        /// Upload cropped image
        var response = await Repository().postImage(file: croppedFile);

        print('Response from image upload: $response');

        try {
          String message = response['message'];
          if (message.contains('Success')) {
            /// Set the new image URL
            viewModel!.profileImageUrl = response['data']['cdn_link'];
            viewModel!.isDataUpdated = true;
          }
        } catch (e) {
          blocSingleton.showMessage(context, 'Image upload error: $e');
        }
      }*/
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
