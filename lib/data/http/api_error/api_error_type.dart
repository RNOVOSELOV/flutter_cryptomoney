enum ApiErrorType {
  unknown(
    responseCode: -1,
    description: 'Unknown error',
  ),
  connectionTimeoutError(
    responseCode: -2,
    description: 'Connection timeout error',
  ),
  sendTimeoutError(
    responseCode: -3,
    description: 'Send timeout error',
  ),
  receiveTimeoutError(
    responseCode: -4,
    description: 'Receive timeout error',
  ),
  badCertificateError(
    responseCode: -5,
    description: 'Bad certificate error',
  ),
  connectionError(
    responseCode: -6,
    description: 'Connection error',
  ),
  dioClientError(
    responseCode: -7,
    description: 'Dio client error',
  ),
  jsonParsingTypeError(
    responseCode: -8,
    description: 'JSON parsing error',
  ),
  badRequest(
    responseCode: 400,
    description: 'badRequest',
  ),
  unauthorized(
    responseCode: 401,
    description: 'badRequest',
  ),
  badRequestPath(
    responseCode: 404,
    description: 'badRequestPath',
  ),
  badRequestPathGone(
    responseCode: 410,
    description: 'badRequestPathGone',

  ),
  gatewayTimeout(
    responseCode: 504,
    description: 'gatewayTimeout',
  );

  const ApiErrorType({
    required this.responseCode,
    required this.description,
  });

  final int responseCode;
  final String description;

  static ApiErrorType getByResponseCode(final int code) {
    return ApiErrorType.values.firstWhere(
      (element) => element.responseCode == code,
      orElse: () => ApiErrorType.unknown,
    );
  }

  static bool containsCode(final dynamic code) {
    return ApiErrorType.values
            .indexWhere((element) => element.responseCode == code) !=
        -1;
  }
}
