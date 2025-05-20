import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:soccer_mobile_app/Models/data/auth/login_dm.dart';
import 'package:soccer_mobile_app/Utils/Constants/storage_keys.dart';
import 'package:soccer_mobile_app/Utils/Helpers/helper_functions.dart';
import 'package:soccer_mobile_app/config/routes/app_navigation.dart';
import 'package:soccer_mobile_app/config/routes/app_routes.dart';
import 'package:soccer_mobile_app/core/constants/app_constant.dart';
import 'package:soccer_mobile_app/main.dart';

class ApiService {
  /// ENDPOINT
  final String endPoint;

  ApiService({required this.endPoint});

  ///~~~~~~~~~~~~POST~~~~~~~~~~~~///
  dynamic post({Map<String, dynamic>? postBody, required Map<String, String> header}) async {
    print('HITTING POST API AT ==> ${AppConstant.appBaseURL + endPoint} WITH BODY \n  $postBody  ');
    // Making Request
    try {
      var response = await http.post(Uri.parse(AppConstant.appBaseURL + endPoint), headers: header, body: postBody != null ? jsonEncode(postBody) : null).timeout(Duration(seconds: 15));
      // CONVERTING RESPONSE TO MAP
      print('POST response:${response.statusCode}  ${response.body} ');

      Map<String, dynamic> result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return result;
      } else if (response.statusCode == 403) {
        HelperFunctions.showErrorToast('${result['message']}');
        box.erase();
        AppNavigation.pushAndKillAll(AppRoutes.routeTypeSelectionScreen);
        // blocSingleton.logout(context: context);
      } else {
        return result;
      }
    } on TimeoutException {
      // Handle timeout using the onTimeout callback
      HelperFunctions.showErrorToast('Server timeout, check your internet connection.');
      return null; // Default fallback if no onTimeout is provided
    } catch (e) {
      print('url 0000> ${e}');
      return e.toString();
    }
  }

  ///~~~~~~~~~~~~~~~~~~~~~POST FORM DATA~~~~~~~~~~~~~~~~~~~~///
  Future postFormData({
    required Map<String, String> fields, // Text fields
    required Map<String, File>? files,
    Map<String, String>? header,
  }) async {
    try {
      print('HITTING POST API AT ==> ${AppConstant.appBaseURL + endPoint} WITH BODY \n  $fields ... $files  ');

      // Create a multipart request
      var request = http.MultipartRequest('POST', Uri.parse(AppConstant.appBaseURL + endPoint));

      // Add text fields to the request
      request.fields.addAll(fields);
      if (header != null) {
        request.headers.addAll(header);
      }

      if (files != null) {
        // Add files to the request
        for (var entry in files.entries) {
          var fileStream = http.ByteStream(entry.value.openRead());
          var fileLength = await entry.value.length();
          var multipartFile = http.MultipartFile(
            entry.key, // Field name for the file
            fileStream,
            fileLength,
            filename: entry.value.path.split('/').last, // Extract file name from path
          );
          request.files.add(multipartFile);
        }
      }
      // Send the request
      var response = await request.send().timeout(const Duration(seconds: 15));
      print('POST FORM DATA response:${response.statusCode}  ');

      // Handle the response
      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseData = await response.stream.bytesToString();
        return json.decode(responseData);
      } else if (response.statusCode == 403) {
        var errorData = await response.stream.bytesToString();
        box.erase();
        AppNavigation.pushAndKillAll(AppRoutes.routeTypeSelectionScreen);
        HelperFunctions.showErrorToast('${json.decode(errorData)}');
        return null;
      } else {
        var errorData = await response.stream.bytesToString();
        return json.decode(errorData);
      }
    } on TimeoutException {
      // Handle timeout using the onTimeout callback
      HelperFunctions.showErrorToast('Server timeout, check your internet connection.');
      return null; // Default fallback if no onTimeout is provided
    } catch (e) {
      log('error state $e');
      return e.toString();
    }
  }

  ///~~~~~~~~~~~~~~~~~~~~~PUT FORM DATA~~~~~~~~~~~~~~~~~~~~///
  Future putFormData({required Map<String, String> header, required Map<String, String> fields, required Map<String, File>? files}) async {
    try {
      print('HITTING PUT API AT ==> ${AppConstant.appBaseURL + endPoint} WITH BODY \n  $fields ... $files  ');

      // Create a multipart request
      var request = http.MultipartRequest('PUT', Uri.parse(AppConstant.appBaseURL + endPoint));

      // Add text fields to the request
      request.fields.addAll(fields);
      request.headers.addAll(header);

      if (files != null) {
        // Add files to the request
        for (var entry in files.entries) {
          var fileStream = http.ByteStream(entry.value.openRead());
          var fileLength = await entry.value.length();
          var multipartFile = http.MultipartFile(
            entry.key, // Field name for the file
            fileStream,
            fileLength,
            filename: entry.value.path.split('/').last, // Extract file name from path
          );
          request.files.add(multipartFile);
        }
      }
      // Send the request
      var response = await request.send().timeout(const Duration(seconds: 15));
      print('PUT FORM DATA response:${response.statusCode}  ');

      // Handle the response
      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseData = await response.stream.bytesToString();
        return json.decode(responseData);
      } else if (response.statusCode == 403) {
        var errorData = await response.stream.bytesToString();
        box.erase();
        AppNavigation.pushAndKillAll(AppRoutes.routeTypeSelectionScreen);
        HelperFunctions.showErrorToast('${json.decode(errorData)}');
        // blocSingleton.logout(context: context);
        return null;
      } else {
        var errorData = await response.stream.bytesToString();
        return json.decode(errorData);
      }
    } on TimeoutException {
      // Handle timeout using the onTimeout callback
      HelperFunctions.showErrorToast('Server timeout, check your internet connection.');
      return null; // Default fallback if no onTimeout is provided
    } catch (e) {
      log('error state $e');
      return e.toString();
    }
  }

  ///~~~~~~~~~~~~GET~~~~~~~~~~~~///
  dynamic get({required Map<String, String> header}) async {
    print('HITTING GET API AT ==> ${AppConstant.appBaseURL + endPoint}');
    // Making Request
    try {
      var response = await http.get(Uri.parse(AppConstant.appBaseURL + endPoint), headers: header).timeout(const Duration(seconds: 15));

      print('GET response:${response.statusCode}  ${response.body} ');

      // CONVERTING RESPONSE TO MAP
      var result = jsonDecode(response.body);

      if (response.statusCode == 200) {
        var decodedResponse = utf8.decode(response.bodyBytes);
        return jsonDecode(decodedResponse);
      } else if (response.statusCode == 403) {
        HelperFunctions.showErrorToast('${result['message']}');
        box.erase();
        AppNavigation.pushAndKillAll(AppRoutes.routeTypeSelectionScreen);
        return null;
      } else {
        HelperFunctions.showErrorToast('${result['message']}');

        return result;
      }
    } on TimeoutException {
      // Handle timeout using the onTimeout callback
      HelperFunctions.showErrorToast('Server timeout, check your internet connection.');
      return null; // Default fallback if no onTimeout is provided
    } catch (e) {
      print('e--> $e');
      return e.toString();
    }
  }

  ///~~~~~~~~~~~~GET STREAM WITH ERROR HANDLING~~~~~~~~~~~~///
  Future<Map<String, dynamic>?> getStreamData({required String id}) async {
    print('HITTING GET STREAM API AT ==> ${AppConstant.appBaseURL + endPoint} WITH BODY \n$id');

    try {
      // Create the request
      final request = http.Request('GET', Uri.parse(AppConstant.appBaseURL + endPoint));

      // Add authentication headers
      final userLogin = box.read(Storage.userData);
      if (userLogin == null) {
        HelperFunctions.showErrorToast('Session expired. Please login again.');
        AppNavigation.pushAndKillAll(AppRoutes.routeTypeSelectionScreen);
        return null;
      }

      final LoginResponse data = LoginResponse.fromJson(userLogin);
      request.headers.addAll({
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${data.token}',
      });

      // Set request body
      request.body = json.encode({'sessionID': id});

      // Send the request
      final response = await request.send();
      final responseData = await response.stream.bytesToString();
      final result = json.decode(responseData) as Map<String, dynamic>;

      log('GET STREAM response:${response.statusCode}  ${result} ');
      // Handle response status
      switch (response.statusCode) {
        case 200:
          return result;
        case 401: // Unauthorized
        case 403: // Forbidden
          HelperFunctions.showErrorToast(result['message'] ?? 'Session expired. Please login again.');
          await box.erase();
          AppNavigation.pushAndKillAll(AppRoutes.routeTypeSelectionScreen);
          return null;
        case 400: // Bad Request
        case 404: // Not Found
          HelperFunctions.showErrorToast(result['message'] ?? 'Invalid request');
          return result['message'];

        case 500: // Server Error
          HelperFunctions.showErrorToast(result['message'] ?? 'Server error occurred');
          return result['message'];
        default:
          HelperFunctions.showErrorToast(result['message'] ?? 'Unknown error occurred');
          return result['message'];
      }
    } on SocketException catch (_) {
      HelperFunctions.showErrorToast('No internet connection');
      return null;
    } on TimeoutException catch (_) {
      HelperFunctions.showErrorToast('Request timeout');
      return null;
    } on FormatException catch (_) {
      HelperFunctions.showErrorToast('Invalid data format');
      return null;
    } on http.ClientException catch (e) {
      HelperFunctions.showErrorToast('Network error: ${e.message}');
      return null;
    } catch (e) {
      HelperFunctions.showErrorToast('An unexpected error occurred');
      return null;
    }
  }

  ///~~~~~~~~~~~~PUT~~~~~~~~~~~~///
  dynamic put({required Map<String, dynamic> postBody, required Map<String, String> header}) async {
    print('HITTING PUT API AT ==> ${AppConstant.appBaseURL + endPoint} WITH BODY \n${jsonEncode(postBody)} \n $header');
    try {
      var response = await http.put(Uri.parse(AppConstant.appBaseURL + endPoint), headers: header, body: jsonEncode(postBody)).timeout(
            const Duration(seconds: 15),
          );
      // CONVERTING RESPONSE TO MAP
      print('PUT response: ${response}//// ${response.body}//// ${response.statusCode}');

      Map<String, dynamic> result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return result;
      } else if (response.statusCode == 403) {
        HelperFunctions.showErrorToast('${result['message']}');
        box.erase();
        AppNavigation.pushAndKillAll(AppRoutes.routeTypeSelectionScreen);
        // blocSingleton.logout(context: context);
      } else {
        return result;
      }
    } on TimeoutException {
      // Handle timeout using the onTimeout callback
      HelperFunctions.showErrorToast('Server timeout, check your internet connection.');
      return null; // Default fallback if no onTimeout is provided
    } catch (e) {
      return e.toString();
    }
  }

  ///~~~~~~~~~~~~DELETE~~~~~~~~~~~~///
  dynamic delete({required Map<String, String> header}) async {
    // Making Request
    try {
      var response = await http
          .delete(
            Uri.parse(AppConstant.appBaseURL + endPoint),
            headers: header,
          )
          .timeout(const Duration(seconds: 15));
      print('DELETE response: ${response} ${response.body} ${response.statusCode}');

      Map<String, dynamic> result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return result;
      } else if (response.statusCode == 403) {
        HelperFunctions.showErrorToast('${result['message']}');
        // blocSingleton.logout(context: context);
        box.erase();
        AppNavigation.pushAndKillAll(AppRoutes.routeTypeSelectionScreen);
      } else {
        return result;
      }
    } on TimeoutException {
      // Handle timeout using the onTimeout callback
      HelperFunctions.showErrorToast('Server timeout, check your internet connection.');
      return null; // Default fallback if no onTimeout is provided
    } catch (e) {
      return e.toString();
    }
  }
}
