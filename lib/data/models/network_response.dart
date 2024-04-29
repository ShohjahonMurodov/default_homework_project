class NetworkResponse {
  NetworkResponse({
    this.errorText = '',
    this.data,
    this.statusCode = 0,
  });

  String errorText;
  dynamic data;
  int statusCode;
}
