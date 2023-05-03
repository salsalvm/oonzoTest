abstract class BaseApiServices {
  //----------whole get methods------//
  Future<dynamic> getGetApiResponse({required String url});

  //----------whole post methods------//
  Future<dynamic> getPostApiResponse(
      {required String url, required dynamic data});
}
