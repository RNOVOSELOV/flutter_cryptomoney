// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assets_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssetsRequest _$AssetsRequestFromJson(Map<String, dynamic> json) =>
    AssetsRequest(
      limit: (json['limit'] as num).toInt(),
      offset: (json['offset'] as num).toInt(),
    );

Map<String, dynamic> _$AssetsRequestToJson(AssetsRequest instance) =>
    <String, dynamic>{'limit': instance.limit, 'offset': instance.offset};
