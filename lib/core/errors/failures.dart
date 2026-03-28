import 'package:dio/dio.dart';

abstract class Failures {
  final String errMessage;

 const Failures(this.errMessage);
}
class ServerFailure extends Failures{
  ServerFailure(super.errMessage);
  factory ServerFailure.fromDioException(DioException dioException){
    switch(dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with AppServer');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with AppServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with AppServer');
      case DioExceptionType.badCertificate:
        // TODO: Handle this case.
        throw UnimplementedError();
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioException.response!.statusCode!,
          dioException.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure('Receive to AppServer was canceld ');
      case DioExceptionType.connectionError:
        // TODO: Handle this case.
        throw UnimplementedError();
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')){
          return ServerFailure('No Internet');
        }
        return ServerFailure('UnException Error please try later');
        default: return ServerFailure(
            'Opps There was an Erroe, please try later');
    }
  }
  factory ServerFailure.fromResponse(int statusCode ,dynamic response){
    if(statusCode == 400 || statusCode == 401||statusCode == 403){
      return ServerFailure(response['error']['message']);
    }else if(statusCode==404){
      return ServerFailure('not found,please try later');
    }else if(statusCode==500){
      return ServerFailure('Server error, please try later');
    } else {
      return ServerFailure(
          'Opps There was an Erroe, please try later');
    }
  }
}