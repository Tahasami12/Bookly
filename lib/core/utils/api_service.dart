import 'package:dio/dio.dart';

class ApiService {
  final _baseUr1 = "https://www.googleapis.com/books/v1/";
  final Dio _dio;
  ApiService(this._dio);
  Future<Map<String,dynamic>> get({required String endPorint })async{
    var response = await
    _dio.get('$_baseUr1$endPorint');
    return response.data;
  }
}