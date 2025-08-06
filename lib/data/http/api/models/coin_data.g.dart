// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinData _$CoinDataFromJson(Map<String, dynamic> json) => CoinData(
  id: json['id'] as String,
  symbol: json['symbol'] as String? ?? '-',
  priceUsd: json['priceUsd'] as String? ?? '-',
);

Map<String, dynamic> _$CoinDataToJson(CoinData instance) => <String, dynamic>{
  'id': instance.id,
  'symbol': instance.symbol,
  'priceUsd': instance.priceUsd,
};
