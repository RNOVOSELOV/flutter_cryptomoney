import 'package:cryptomoney/data/http/api/api_data_provider.dart';
import 'package:cryptomoney/data/http/api/models/coins_data_response.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import '../api_error/model/api_error_response.dart';
import '../base_api_service.dart';
import 'models/requests/assets_request.dart';

class ApiService extends BaseApiService implements ApiDataProvider {
  final Dio _dio;

  ApiService({required Dio dio}) : _dio = dio;

  @override
  Future<Either<ApiErrorResponse, CoinsDataResponse>> getAssets({
    required final int limit,
    required final int offset,
  }) async {
    return responseOrError(() async {
      final requestBody = AssetsRequest(limit: limit, offset: offset);
      final response = await _dio.get(
        '/assets',
        queryParameters: requestBody.toJson(),
      );

      return parseApiResponse(
        apiResponse: response,
        responseTransformer:
            ({required response}) => CoinsDataResponse.fromJson(response.data),
      );
    });
  }
}
