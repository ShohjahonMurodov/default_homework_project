String getErrorMessage(int statusCode) {
  if (statusCode == 401) {
    return "User is not authenticated!";
  }
  return "";
}
