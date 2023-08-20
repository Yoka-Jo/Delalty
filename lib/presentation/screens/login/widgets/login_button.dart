part of 'widgets.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LoadingButton(
      title: AppStrings.signin,
      onTap: () {
        context.router.replaceAll([const AppRoute()]);
      },
      btnKey: LoginCubit.get(context).btnKey,
    );
  }
}
