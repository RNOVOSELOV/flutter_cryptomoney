import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'assets_request.g.dart';

@JsonSerializable()
class AssetsRequest extends Equatable {
  @JsonKey(name: 'limit')
  final int limit;
  @JsonKey(name: 'offset')
  final int offset;

  factory AssetsRequest.fromJson(final Map<String, dynamic> json) =>
      _$AssetsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AssetsRequestToJson(this);

  const AssetsRequest({required this.limit, required this.offset});

  @override
  List<Object?> get props => [limit, offset];
}
