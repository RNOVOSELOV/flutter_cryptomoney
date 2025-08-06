import 'package:cryptomoney/data/http/api/models/coins_data_response.dart';
import 'package:either_dart/either.dart';

import '../api_error/model/api_error_response.dart';

abstract interface class ApiDataProvider {
  Future<Either<ApiErrorResponse, CoinsDataResponse>> getAssets({
    required final int limit,
    required final int offset,
  });
}
