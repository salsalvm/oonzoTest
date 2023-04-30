abstract class BaseApiServices {
  //----------whole get methods------//
  Future<dynamic> getGetApiResponse(
      {required String url, Map<String, String>? headers});

  //----------whole post methods------//
  Future<dynamic> getPostApiResponse(
      {required String url, required dynamic data});
}
