import 'package:app_receitas/src/core/services/api/api_error/api_error.dart';

class ApiInternalServerError extends ApiError {
  @override
  String message;
  ApiInternalServerError({
    required this.message,
  });
}
