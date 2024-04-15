class NetworkResponse {
  String errorText;
  dynamic data;

  NetworkResponse({
    this.data,
    this.errorText = '',
  });
}