import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../api_error_type.dart';

part 'api_error_response.g.dart';

@JsonSerializable()
class ApiErrorResponse extends Equatable {
  @JsonKey(name: 'error')
  final String errorText;

  factory ApiErrorResponse.fromJson(final Map<String, dynamic> json) =>
      _$ApiErrorResponseFromJson(json);

  const ApiErrorResponse({required this.errorText});

  ApiErrorResponse.fromApiErrorType({required final ApiErrorType type})
    : this(errorText: type.description);

  Map<String, dynamic> toJson() => _$ApiErrorResponseToJson(this);

  @override
  List<Object?> get props => [errorText];
}
