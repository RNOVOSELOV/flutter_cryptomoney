import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';

import 'api_error/api_error_type.dart';
import 'api_error/model/api_error_response.dart';

class BaseApiService {

  BaseApiService();

  /// Catch Json parsing error
  T parseApiResponse<T>(
      {required T Function({required Response<dynamic> response})
          responseTransformer,
      required Response<dynamic> apiResponse}) {
    try {
      return responseTransformer(response: apiResponse);
    } on TypeError catch (error, stacktrace) {
      throw DioException(
        requestOptions: apiResponse.requestOptions,
        response: apiResponse,
        type: DioExceptionType.badResponse,
        message: apiResponse.statusMessage,
        stackTrace: stacktrace,
      );
    }
  }

  /// Catch Dio and another network errors. Returns errors in according [ApiErrorType]
  Future<Either<ApiErrorResponse, T>> responseOrError<T>(
    AsyncValueGetter<T> request,
  ) async {
    try {
      return Right(await request());
    } on DioException catch (dioException) {
      late final ApiErrorResponse apiError;
      switch (dioException.type) {
        case DioExceptionType.connectionTimeout:
          apiError = ApiErrorResponse.fromApiErrorType(
              type: ApiErrorType.connectionTimeoutError);
          break;
        case DioExceptionType.sendTimeout:
          apiError = ApiErrorResponse.fromApiErrorType(
              type: ApiErrorType.sendTimeoutError);
          break;
        case DioExceptionType.receiveTimeout:
          apiError = ApiErrorResponse.fromApiErrorType(
              type: ApiErrorType.receiveTimeoutError);
          break;
        case DioExceptionType.badCertificate:
          apiError = ApiErrorResponse.fromApiErrorType(
              type: ApiErrorType.badCertificateError);
          break;
        case DioExceptionType.connectionError:
          apiError = ApiErrorResponse.fromApiErrorType(
              type: ApiErrorType.connectionError);
          break;
        case DioExceptionType.badResponse:
          try {
            apiError = ApiErrorResponse.fromJson(dioException.response!.data);
          } catch (e) {
            apiError = ApiErrorResponse.fromApiErrorType(
                type: ApiErrorType.dioClientError);
          }
          break;
        default:
          apiError = ApiErrorResponse.fromApiErrorType(
              type: ApiErrorType.dioClientError);
      }
      return Left(apiError);
    } on TypeError catch (_) {
      return Left(ApiErrorResponse.fromApiErrorType(
          type: ApiErrorType.jsonParsingTypeError));
    } catch (e, stacktrace) {
      return Left(ApiErrorResponse.fromApiErrorType(
        type: ApiErrorType.unknown,
      ));
    }
  }
}
