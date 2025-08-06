import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../api_error_type.dart';

part 'api_error_response.g.dart';

@JsonSerializable()
class ApiErrorResponse extends Equatable {
  @JsonKey(name: 'error')
  final int responseCode;
  @JsonKey(name: 'errorText')
  final String errorText;

  factory ApiErrorResponse.fromJson(final Map<String, dynamic> json) =>
      _$ApiErrorResponseFromJson(json);

  const ApiErrorResponse({required this.responseCode, this.errorText = ''});

  ApiErrorResponse.fromApiErrorType({required final ApiErrorType type})
    : this(responseCode: type.responseCode, errorText: type.description);

  Map<String, dynamic> toJson() => _$ApiErrorResponseToJson(this);

  @override
  List<Object?> get props => [responseCode, errorText];
}
