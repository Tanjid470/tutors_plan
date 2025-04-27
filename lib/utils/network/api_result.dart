sealed class ApiResult<T> {
  const ApiResult();
}

class ApiSuccess<T> extends ApiResult<T> {
  final T data;
  final dynamic headers;
  const ApiSuccess(this.data, {this.headers});
}

class ApiError<T> extends ApiResult<T> {
  final int? statusCode;
  final String message;
  const ApiError({this.statusCode, required this.message});
}
