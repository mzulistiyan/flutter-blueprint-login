import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';
import 'package:tap_mobile/core/models/response_error.dart';
import 'package:tap_mobile/feature/auth/models/response_login.dart';
import 'package:tap_mobile/feature/auth/service/auth_services.dart';

part '../event/login_event.dart';
part '../state/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthService _authService = AuthService();
  LoginBloc() : super(LoginInitial()) {
    on<PostLogin>((event, emit) async {
      emit(LoginLoading());
      try {
        final result = await _authService.login(
          event.userName ?? '-',
          event.password ?? '-',
        );
        debugPrint('username: ${event.userName}');
        debugPrint('password: ${event.password}');
        if (result?.statusCode == 200) {
          debugPrint('Success from Login');
          emit(
            LoginSuccess(
              responseLogin: ResponseLogin.fromJson(result?.data),
            ),
          );
        } else {
          debugPrint('error parsing from PostLogin: ${result!.statusMessage}');
          emit(
            LoginError(
              responseError: ResponseError(
                status: false,
                statusCode: result.statusCode ?? 0,
                message: result.data?.toString() ?? '',
              ),
            ),
          );
        }
      } catch (e) {
        emit(
          LoginError(
            responseError: ResponseError(
              status: false,
              statusCode: 0,
              message: 'Error From Login',
            ),
          ),
        );
      }
    });
  }
}
