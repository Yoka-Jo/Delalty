import 'package:auto_route/auto_route.dart';
import 'package:delalty/presentation/screens/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/resources/colors_manager.dart';
import '../../../di.dart';
import 'widgets/widgets.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, this.email, this.password});
  final String? email;
  final String? password;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<LoginCubit>()..initializeEmailAndPassword(email, password),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: LoginBody(
          email: email,
          password: password,
        ),
      ),
    );
  }
}
