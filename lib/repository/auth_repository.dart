import 'package:firstcry/data/network/base_api_services.dart';
import 'package:firstcry/data/network/network_api_services.dart';
import 'package:firstcry/res/app_urls.dart';

class AuthRepository {
  BaseApiServices apiServices = NetworkApiService();

  Future<dynamic> userLogin(dynamic data) async {
    try {
      dynamic response =await apiServices.getPostApiResponse(
          url:  AppUrls.loginEndPint, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
  Future<dynamic> userRegister(dynamic data) async {
    try {
      dynamic response =await apiServices.getPostApiResponse(
          url: AppUrls.registerApiEndPoint,data: data);
      
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
