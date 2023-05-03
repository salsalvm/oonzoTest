import 'package:firstcry/data/response/api_response.dart';
import 'package:firstcry/model/product_datas/product.dart';
import 'package:firstcry/model/product_datas/product_datas.dart';
import 'package:firstcry/repository/home_repository.dart';
import 'package:firstcry/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class HomeController extends GetxController {
  final HomeRepository homeRepo = HomeRepository();
  @override
  void onInit() {
    getHomeDatas();

    super.onInit();
  }

  RxBool test = true.obs;
  //---------//
  ApiResponse<ProductDatas> homeDatas = ApiResponse<ProductDatas>.loading();
  void setHomeDatas(ApiResponse<ProductDatas> response) {
    homeDatas = response;
    update();
  }

  Future<void> getHomeDatas() async {
    setHomeDatas(ApiResponse<ProductDatas>.loading());

    homeRepo.fetchHomeDatas().then((data) {
      setHomeDatas(ApiResponse<ProductDatas>.complete(data));
    }).onError((Object? error, StackTrace stackTrace) {
      setHomeDatas(ApiResponse<ProductDatas>.error(error.toString()));
    });
    update();
  }

  Rx<Product>? product;

  void viewProductPage(BuildContext context, Product product) {
    Navigator.pushNamed(context, KRoutesName.product);
    this.product = product.obs;
  }
}
