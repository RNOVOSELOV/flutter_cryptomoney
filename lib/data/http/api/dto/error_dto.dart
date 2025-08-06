import 'package:equatable/equatable.dart';

import '../../api_error/model/api_error_response.dart';

class ApiErrorDto extends Equatable {
  final int responseCode;

  final String userMessage;

  const ApiErrorDto({required this.responseCode, required this.userMessage});

  ApiErrorDto.fromApi({required ApiErrorResponse apiError})
    : this(
        responseCode: apiError.responseCode,
        userMessage: apiError.errorText,
      );

  @override
  List<Object?> get props => [responseCode, userMessage];
}
