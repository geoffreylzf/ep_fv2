import 'package:dio/dio.dart';

extension DioErrorExtension on DioError {
  String formatApiErrorMsg() {
    return this.type == DioErrorType.response ? this.response.toString() : this.toString();
  }
}
