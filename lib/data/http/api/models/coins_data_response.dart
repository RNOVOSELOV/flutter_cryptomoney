import 'package:cryptomoney/data/http/api/models/coin_data.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coins_data_response.g.dart';

@JsonSerializable()
class CoinsDataResponse extends Equatable {
  @JsonKey(name: 'data')
  final List<CoinData> coins;

  factory CoinsDataResponse.fromJson(final Map<String, dynamic> json) =>
      _$CoinsDataResponseFromJson(json);

  const CoinsDataResponse({this.coins = const []});

  Map<String, dynamic> toJson() => _$CoinsDataResponseToJson(this);

  @override
  List<Object?> get props => [coins];
}
