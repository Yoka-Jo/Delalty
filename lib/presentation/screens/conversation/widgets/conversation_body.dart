part of 'widgets.dart';

class ConversationBody extends StatelessWidget {
  const ConversationBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<RelationshipCubit, RelationshipState>(
      listener: (context, state) {
        if (state is ChangeRelationshipSuccess) {
          context.router.popUntil((route) => route.settings.name == 'AppRoute');
        }
        if (state is ChangeRelationshipFailure) {
          SimpleToast.showSimpleToast(
            msg: state.message,
            state: ToastStates.error,
          );
        }
      },
      child: BlocConsumer<ConversationCubit, ConversationState>(
        listener: (context, state) {
          if (state is ConversationPickeImagesMoreThanAllowedError) {
            SimpleToast.showSimpleToast(
              msg: AppStrings.pickAtMaxFiveImages.tr(context: context),
              state: ToastStates.error,
            );
          }
          if (state is ConversationGetChatFailure) {
            context.router.pop();
            SimpleToast.showSimpleToast(
              msg: state.message,
              state: ToastStates.error,
            );
          }
          if (state is ConversationGetMessagesFailure) {
            SimpleToast.showSimpleToast(
              msg: state.message,
              state: ToastStates.error,
            );
          }
        },
        builder: (context, state) {
          if (state is ConversationGetChatLoading) {
            return const CenteredCircularProgressIndicaotr();
          }
          return SafeArea(
            child: SizedBox(
              child: Column(
                children: [
                  const ConversationAppBar(),
                  SizedBox(height: 15.h),
                  const ConversationContainer()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
