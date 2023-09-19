// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'widgets.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SellerProfileCubit, SellerProfileState>(
      listener: (context, state) {
        if (state is BlockSellerSuccess) {
          context.router.pop();
        }
        if (state is BlockSellerFailure) {
          SimpleToast.showSimpleToast(
            msg: state.message,
            state: ToastStates.error,
          );
        }
      },
      child: const ProfileTabs(),
    );
  }
}
