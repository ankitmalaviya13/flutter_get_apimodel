import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_model/Helper/preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
// import 'package:reserved4u/Helper/preferences.dart';

import 'custom_exception.dart';

class ApiProvider {
  Future<http.Response> post(String apiurl, Object body) async {
    var urlParse = Uri.parse(apiurl);

    var islogin = await Preferences.preferences.getBool(key: PrefernceKey.isUserLogin, defValue: false);
    print(islogin);

    var token = await Preferences.preferences.getString(key: PrefernceKey.loginToken);
    print(token);
    var headers = {"Authorization": token};
    if (islogin == true) {
      headers = {"Authorization": token};
    }

    if (islogin == false) {
      Get.to(LoginView());
    }

    var response = await http
        .post(
          urlParse,
          body: body,
          headers: (islogin == true) ? headers : null,
        )
        .timeout(Duration(minutes: 2));
    print('tetetetetet');
    print(response.body);

    if (response.statusCode == 498) {
      logOutUSer();
    }

    return response;
  }

  Future<http.Response> getApiCall(String apiurl) async {
    var response;

    var urlParse = Uri.parse(apiurl);
    var islogin = await Preferences.preferences.getBool(key: PrefernceKey.isUserLogin, defValue: false);
    var token = await Preferences.preferences.getString(key: PrefernceKey.loginToken);
    // var token = "eyJpdiI6IlIydHdZWjAxTUsrVkQvQU9lVEpsUXc9PSIsInZhbHVlIjoiSFNrR04vaDBpL0dlWWNrVEl0V3A1UT09IiwibWFjIjoiN2RmZTc0MzU4NjQ5YTQ1OTZjY2U3ZTRkMWNhN2NjZjkxOGU0NmU4NjUxNTM3NzA4YzVkYjA2MDRmMDM3ZGVkZiIsInRhZyI6IiJ9";
    print("urlParse -----> $urlParse");
    print("token -----> $token");

    // if (islogin == true) {
    //   // response = await http.get(urlParse, headers: {"Authorization": "$token"});
    //   response = await http.get(urlParse, headers: {"Authorization": null});
    // } else {
    //   response = await http.get(urlParse);
    // }
    response = await http.get(urlParse, headers: {"Authorization": token});
    if (response.statusCode == 498) {
      logOutUSer();
    }
    print('the response: ${response.body}');
    return response;
  }

  Future<http.Response> postApiWithImage(String apiurl, {Map<String, String> body, String profile, bool isImage}) async {
    var urlParse = Uri.parse(apiurl);
    var islogin = await Preferences.preferences.getBool(key: PrefernceKey.isUserLogin, defValue: false);
    var isGuestUser = await Preferences.preferences.getBool(key: PrefernceKey.isGuestUser, defValue: false);
    var token =
        "eyJpdiI6IlIydHdZWjAxTUsrVkQvQU9lVEpsUXc9PSIsInZhbHVlIjoiSFNrR04vaDBpL0dlWWNrVEl0V3A1UT09IiwibWFjIjoiN2RmZTc0MzU4NjQ5YTQ1OTZjY2U3ZTRkMWNhN2NjZjkxOGU0NmU4NjUxNTM3NzA4YzVkYjA2MDRmMDM3ZGVkZiIsInRhZyI6IiJ9";
    //var token = await Preferences.preferences.getString(key: PrefernceKey.loginToken);
    var headers = {"": ""};
    if (islogin == true || isGuestUser == true) {
      headers = {"Authorization": token};
    }

    print("Headers -----> $headers");
    print("urlParse -----> $urlParse");
    print("Parameters -----> $body");
    var request = http.MultipartRequest('POST', urlParse);
    if (body.isNotEmpty) {
      request.fields.addAll(body);
    }
    if (isImage == true) {
      request.files.add(await http.MultipartFile.fromPath(
        "profile_pic",
        profile,
      ));
    }

    if (islogin == true || isGuestUser == true) {
      request.headers.addAll(headers);
    }

    http.StreamedResponse streamedResponse = await request.send();

    return await http.Response.fromStream(streamedResponse);
  }
}

class ResponseCodeForAPI {
  static const int sucessC = 1;
}

// ignore: unused_element
dynamic _response(response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body);
      if (kDebugMode) print("Response status 200 ====> $responseJson");
      return responseJson;
    case 400:
      var responseJson = json.decode(response.body);
      if (kDebugMode) print("Response status 400 ====> $responseJson");
      String message = responseJson["ResponseText"];
      showTostMessage(message: message);
      throw BadRequestException(response.body);
    case 401:
      var responseJson = json.decode(response.body);
      if (kDebugMode) print("Response status 401 ====> $responseJson");
      String message = responseJson["ResponseText"];
      showTostMessage(message: message);

      throw UnauthorisedException(response.body);
    case 403:
      var responseJson = json.decode(response.body);
      if (kDebugMode) print("Response status 403 ====> $responseJson");
      String message = responseJson["ResponseText"];
      showTostMessage(message: message);
      throw UnauthorisedException(response.body);
    case 404:
      var responseJson = json.decode(response.body);
      if (kDebugMode) print("Response status 404 ====> $responseJson");
      String message = responseJson["ResponseText"];
      showTostMessage(message: message);

      return responseJson;
    case 498:
      var responseJson = json.decode(response.body);
      if (kDebugMode) print("Response status 498 ====> $responseJson");
      String message = responseJson["ResponseText"];
      showTostMessage(message: message);
      return null;
    case 500:

    default:
      throw FetchDataException('Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}

// show tost message
void showTostMessage({String message}) {
  Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 2, backgroundColor: Colors.black, textColor: Colors.white, fontSize: 18.0);
}

Future<bool> checkInterConnection() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.none) {
    showTostMessage(message: "Please connect your device to the internet");
    return false;
  } else {
    return true;
  }
}
