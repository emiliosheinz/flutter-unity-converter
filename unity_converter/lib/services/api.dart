import 'package:dio/dio.dart';

class Api {
  Future<Response> _getHttp(String uri) {
    try {
      return Dio().get(uri);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<Response> getCurrencyTypes() {
    return _getHttp('https://flutter.udacity.com/currency');
  }

  Future<Response> getConversion(from, to, amount) {
    return _getHttp(
        'https://flutter.udacity.com/currency/convert?from=$from&to=$to&amount=$amount');
  }
}
