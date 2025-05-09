abstract class ApiServices {
  Future<dynamic> get(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    dynamic options,
  });
  Future<dynamic> post(
    String path, {
    Map<String,dynamic> data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
    dynamic options,
  });
  Future<dynamic> update(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
    dynamic options,
  });

   Future<dynamic> patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
    dynamic options,
  });
  Future<dynamic> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
    dynamic options,
  });


}