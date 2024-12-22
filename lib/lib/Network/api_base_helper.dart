import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:soccer_mobile_app/lib/core/constants/app_constant.dart';

class ApiBaseHelper {
  static Future<Either<String, dynamic>> httpGetRequest(
    String endPoint, {
    Map<String, String>? queryParams,
  }) async {
    http.Response response;
    try {
      response = await http.get(
        Uri.parse('${AppConstant.appBaseURL}$endPoint').replace(queryParameters: queryParams),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      return _returnResponse(response);
    } on SocketException {
      return const Left(AppConstant.exceptionMessage);
    } on FormatException {
      return const Left(AppConstant.exceptionMessage);
    } on TimeoutException {
      return const Left(AppConstant.exceptionMessage);
    } catch (_) {
      return const Left(AppConstant.exceptionMessage);
    }
  }

  static Either<String, dynamic> _returnResponse(http.Response response) {
    dynamic jsonResponse;
    try {
      jsonResponse = jsonDecode(response.body);
    } on FormatException {
      jsonResponse = response.body;
    }

    switch (response.statusCode) {
      case 200:
      case 201:
        return Right(jsonResponse);
      case 400:
        return Left(jsonResponse['message'] ?? AppConstant.exceptionMessage);
      case 401:
        return const Left("You've been logged out due to session timeout.");
      case 403:
        return Left(jsonResponse['message'] ?? AppConstant.exceptionMessage);
      case 404:
        return Left(jsonResponse['message'] ?? AppConstant.exceptionMessage);
      case 500:
      default:
        return Left(jsonResponse['message'] ?? AppConstant.exceptionMessage);
    }
  }
}
