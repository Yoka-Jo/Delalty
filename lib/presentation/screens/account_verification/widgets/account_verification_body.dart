part of 'widgets.dart';

class AccountVerificationBody extends StatelessWidget {
  const AccountVerificationBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountVerificationCubit, AccountVerificationState>(
      builder: (context, state) {
        return AccountVerificationCubit.get(context).getStepWidget();
      },
    );
  }
}
