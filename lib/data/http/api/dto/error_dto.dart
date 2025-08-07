import 'package:equatable/equatable.dart';

import '../../api_error/model/api_error_response.dart';

class ApiErrorDto extends Equatable {
  final String userMessage;

  const ApiErrorDto({required this.userMessage});

  ApiErrorDto.fromApi({required ApiErrorResponse apiError})
    : this(userMessage: apiError.errorText);

  @override
  List<Object?> get props => [userMessage];
}
