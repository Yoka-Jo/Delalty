// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'widgets.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SellerProfileCubit, SellerProfileState>(
          listener: (context, state) {
            if (state is BlockSellerSuccess) {
              context.router
                  .popUntil((route) => route.settings.name == 'ProductRoute');
            }
            if (state is BlockSellerFailure) {
              SimpleToast.showSimpleToast(
                msg: state.message,
                state: ToastStates.error,
              );
            }
          },
        ),
        BlocListener<RelationshipCubit, RelationshipState>(
          listener: (context, state) {
            if (state is ChangeRelationshipSuccess) {
              SimpleToast.showSimpleToast(
                msg: AppStrings.sentAddFriendRequest.tr(context: context),
                state: ToastStates.success,
              );
            }

            if (state is ChangeRelationshipFailure) {
              SimpleToast.showSimpleToast(
                msg: state.message,
                state: ToastStates.error,
              );
            }
          },
        ),
        BlocListener<CreateChatCubit, CreateChatState>(
          listener: (context, state) {
            if (state is CreateChatSuccess) {
              context.router.push(ConversationRoute(chatId: state.chatId));
            }

            if (state is CreateChatFailure) {
              SimpleToast.showSimpleToast(
                msg: state.message,
                state: ToastStates.error,
                toastLength: Toast.LENGTH_LONG,
              );
            }
          },
        ),
      ],
      child: const ProfileTabs(),
    );
  }
}
