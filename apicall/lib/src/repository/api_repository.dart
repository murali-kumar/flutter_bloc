import 'dart:convert';

import 'package:apicall/src/model/photo_info.dart';
import 'package:apicall/src/service/http_helper.dart';
import 'package:apicall/src/utils/constants.dart';

class ApiRepository {
  late final HttpApiHelper _httpClient;

  ApiRepository() {
    _httpClient = HttpApiHelper();
  }

  Future<List<PhotoInfo>> fetchPhotosData() async {
    String urlStr = '${kApiBaseUrl}photos';
    final response = await _httpClient.get(urlStr);
    final parsedJson = json.decode(response.body);
    return parsedJson
        .map<PhotoInfo>((dynamic e) => PhotoInfo.fromJson(e))
        .toList();
  }

  dispose() {}
}
