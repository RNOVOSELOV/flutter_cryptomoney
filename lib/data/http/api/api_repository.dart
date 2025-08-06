import 'package:either_dart/either.dart';
import 'api_data_provider.dart';
import 'dto/coin_dto.dart';
import 'dto/error_dto.dart';

class ApiRepository {
  final ApiDataProvider _apiDataProvider;

  ApiRepository({required ApiDataProvider dataProvider})
    : _apiDataProvider = dataProvider;

  Future<Either<ApiErrorDto, List<CoinDataDto>>> getInfo({
    final int offset = 0,
    final int limit = 100,
  }) async {
    final data = await _apiDataProvider.getAssets(limit: limit, offset: offset);
    if (data.isLeft) {
      return Left(ApiErrorDto.fromApi(apiError: data.left));
    }
    return Right(
      data.right.coins.map((coin) => CoinDataDto.fromApi(coin: coin)).toList(),
    );
  }
}
