import 'package:firstcry/data/network/base_api_services.dart';
import 'package:firstcry/data/network/network_api_services.dart';

import 'package:firstcry/model/login_user/login_user.dart';
import 'package:firstcry/res/app_urls.dart';
import 'package:flutter/foundation.dart';

class AuthRepository {
  BaseApiServices apiServices = NetworkApiService();

  Future<LoginUser> userLogin(dynamic data) async {
    try {
      dynamic response = await apiServices.getPostApiResponse(
          url: AppUrls.loginEndPint, data: data);

      if (kDebugMode) {
        print('login  $response');
      }
      return LoginUser.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> userRegister(dynamic data) async {
    try {
      dynamic response = await apiServices.getPostApiResponse(
          url: AppUrls.registerApiEndPoint, data: data);
      if (kDebugMode) {
        print(response);
      }
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
