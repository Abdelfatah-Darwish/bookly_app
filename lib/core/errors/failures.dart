import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioException dioException) {
    String errorMessage;

    switch (dioException.type) {
      case DioExceptionType.cancel:
        errorMessage = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        errorMessage = "Connection timeout with API server";
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = "Send timeout in connection with API server";
        break;
      case DioExceptionType.badResponse:
        errorMessage =
            ServerFailure.fromResponse(dioException.response).errorMessage;
        break;
      case DioExceptionType.badCertificate:
        errorMessage = "Bad certificate";
        break;
      case DioExceptionType.connectionError:
        errorMessage =
            "Connection to API server failed due to internet connection";
        break;
      case DioExceptionType.unknown:
      default:
        errorMessage = "Unexpected error occurred";
        break;
    }

    return ServerFailure(errorMessage);
  }

  factory ServerFailure.fromResponse(Response? response) {
    String errorMessage;

    switch (response?.statusCode) {
      case 400:
        errorMessage = "Required parameter: q";
        break;
      case 401:
        errorMessage = "Unauthorized";
        break;
      case 403:
        errorMessage = "Forbidden";
        break;
      case 404:
        errorMessage = "Not found";
        break;
      case 500:
        errorMessage = "Internal server error";
        break;
      default:
        errorMessage = "Received invalid status code: ${response?.statusCode}";
        break;
    }

    return ServerFailure(errorMessage);
  }
}
