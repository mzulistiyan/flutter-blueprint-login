import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tap_mobile/core/utils/token_helper.dart';
import 'package:tap_mobile/feature/auth/bloc/handle_api/login_bloc.dart';
import 'package:tap_mobile/feature/dashboard/screen/dashboard_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController userController =
      TextEditingController(text: '197706052007011002');
  TextEditingController passwordController =
      TextEditingController(text: '123456');
  final LoginBloc _loginBloc = LoginBloc();
  final TokenHelper _tokenHelper = TokenHelper();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      bloc: _loginBloc,
      listener: (context, state) {
        if (state is LoginSuccess) {
          _tokenHelper.saveToken(state.responseLogin?.token ?? '');
          debugPrint("Token: ${state.responseLogin?.token ?? ''} ");
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const DashboardScreen(),
            ),
          );
        }
        if (state is LoginError) {
          if (state.responseError!.message == "notFound-login") {
            Fluttertoast.showToast(
              msg: "Pastikan email/password benar",
              textColor: Colors.green,
              backgroundColor: Colors.white,
            );
          }
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    controller: userController,
                  ),
                  TextFormField(
                    controller: passwordController,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _loginBloc.add(
                        PostLogin(
                          userName: userController.text,
                          password: passwordController.text,
                        ),
                      );
                    },
                    child: const Text('Login'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
