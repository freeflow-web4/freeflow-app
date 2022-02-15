class RouteResponse {
  /// use **bodyMap** when is suppose to send the data in keys
  final Map<String, dynamic> bodyMap;

  /// use **body** when is suppose to send just a string, double ou even a more complex object
  final dynamic body;

  RouteResponse({this.body, this.bodyMap = const {}});
}
