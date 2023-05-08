import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../app_exception.dart';
import 'base_api_services.dart';

class NetworkApiService extends BaseApiServices {
  // -----------get Get method--------//

  @override
  Future<void> getGetApiResponse({required String url}) async {
    dynamic responseJson;
    try {
      final http.Response response = await http
          .get(
            Uri.parse(url),
          )
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet Connection ');
    } catch (e) {
      throw FetchDataException(' $e');
    }

    return responseJson;
  }

  // -----------get Post method--------//
  @override
  Future<dynamic> getPostApiResponse(
      {required String url, required dynamic data}) async {
    dynamic responseJson;

    try {
      final http.Response response = await http
          .post(
            Uri.parse(url),
            body: data,headers: {}
          )
          .timeout(const Duration(seconds: 10));
    

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet Connection');
    } catch (e) {
      throw FetchDataException('$e');
    }
    return responseJson;
  }

//------------enter status code and  return response here------------//
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        final dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 201:
        final dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException('400${response.body}');
      case 500:
        throw UnautharisedException('500${response.body}');
      case 404:
        throw UnautharisedException('404${response.body}');
      case 504:
        throw InvalidInputException('504${response.body}');
      case 415:
        throw InvalidInputException('415${response.body}');
      case 422:
        throw InvalidInputException('415${response.body}');
      default:
        throw FetchDataException(
            'Error occured while communication with server + status code : ${response.statusCode}');
    }
  }
}
