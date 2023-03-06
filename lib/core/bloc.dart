import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../feature/auth/bloc/handle_api/login_bloc.dart';

class ListBlocProvider {
  static List<BlocProvider> getProviders(BuildContext context) {
    return [
      BlocProvider(create: (BuildContext context) => LoginBloc()),
    ];
  }
}
