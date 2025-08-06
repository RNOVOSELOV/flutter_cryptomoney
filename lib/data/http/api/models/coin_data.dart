import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coin_data.g.dart';

@JsonSerializable()
class CoinData extends Equatable {
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'symbol')
  final String symbol;
  @JsonKey(name: 'priceUsd')
  final String priceUsd;

  factory CoinData.fromJson(final Map<String, dynamic> json) =>
      _$CoinDataFromJson(json);

  const CoinData({required this.id, this.symbol = '-', this.priceUsd = '-'});

  Map<String, dynamic> toJson() => _$CoinDataToJson(this);

  @override
  List<Object?> get props => [id, symbol, priceUsd];
}
