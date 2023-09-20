part of 'widgets.dart';

class ConversationBody extends StatelessWidget {
  const ConversationBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConversationCubit, ConversationState>(
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
    );
  }
}
