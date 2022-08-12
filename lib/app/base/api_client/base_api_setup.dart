enum HTTPMethod { get, post, delete, put, patch }

abstract class BaseApiSetup {
  String getPath(dynamic appendPath);

  HTTPMethod get method;
}
