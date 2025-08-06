// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coins_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinsDataResponse _$CoinsDataResponseFromJson(Map<String, dynamic> json) =>
    CoinsDataResponse(
      coins:
          (json['data'] as List<dynamic>?)
              ?.map((e) => CoinData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$CoinsDataResponseToJson(CoinsDataResponse instance) =>
    <String, dynamic>{'data': instance.coins};
