import 'package:dio/dio.dart';
import 'package:tap_mobile/core/api.dart';

class AuthService {
  Future<Response<dynamic>?> login(String user, String password) async {
    try {
      final response = await Api().post(
        path: 'login',
        formObj: {
          'user': user,
          'pass': password,
        },
      );
      return response;
    } on DioError catch (e) {
      return e.response ?? Response(requestOptions: RequestOptions(path: ''));
    }
  }
}
