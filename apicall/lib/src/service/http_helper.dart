import 'dart:io';
import 'package:http/http.dart' as http;
import 'custom_app_exception.dart';

class HttpApiHelper {
  //
  static String commonErrorMessage = 'Something went wrong!';

  Future<dynamic> get(String url) async {
    return await processData(HttpMode.get, url, null);
  }

  Future<dynamic> post(String url, dynamic data) async {
    return await processData(HttpMode.post, url, data);
  }

  Future<dynamic> put(String url, dynamic data) async {
    return await processData(HttpMode.put, url, data);
  }

  Future<dynamic> delete(String url) async {
    return await processData(HttpMode.delete, url, null);
  }

  Future<dynamic> processData(
      HttpMode httpMode, String url, dynamic data) async {
    dynamic responseData;
    late final http.Response response;
    try {
      Uri parsedUrl = Uri.parse(url);
      if (httpMode == HttpMode.get) {
        response = await http.get(parsedUrl);
      } else if (httpMode == HttpMode.post) {
        response = await http.post(parsedUrl, body: data);
      } else if (httpMode == HttpMode.put) {
        response = await http.put(parsedUrl, body: data);
      } else if (httpMode == HttpMode.delete) {
        response = await http.delete(parsedUrl);
      }
      responseData = _returnResponse(response);
    } on SocketException catch (e) {
      throw FetchDataException(e.toString(), 'No Internet connection');
    } on HttpException {
      throw FetchDataException('HttpException', 'Service is unavailable');
    } catch (e) {
      throw FetchDataException(e.toString(), commonErrorMessage);
    }
    return responseData;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return response;
      case 400:
        throw BadRequestException(response.body.toString(), commonErrorMessage);
      case 401:
      case 403:
        throw UnauthorisedException(
            response.body.toString(), commonErrorMessage);
      case 500:
      default:
        throw 'StatusCode : ${response.statusCode}';
    }
  }
}

enum HttpMode { get, post, put, delete }
