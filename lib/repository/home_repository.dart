import 'package:firstcry/data/network/base_api_services.dart';
import 'package:firstcry/data/network/network_api_services.dart';
import 'package:firstcry/model/product_datas/product_datas.dart';
import 'package:firstcry/res/app_urls.dart';
import 'package:flutter/foundation.dart';

class HomeRepository {
  BaseApiServices apiServices = NetworkApiService();

  Future<ProductDatas> fetchHomeDatas() async {
    try {
      dynamic response = await apiServices.getGetApiResponse(url: AppUrls.product);
     
      return response = ProductDatas.fromJson(response as Map<String, dynamic>);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      rethrow;
    }
  }
}
