part of 'widgets.dart';

class ChatContainer extends StatelessWidget {
  const ChatContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(
            top: 20.h,
            right: 16.w,
            left: 16.w,
          ),
          decoration: BoxDecoration(
            color: AppColors.containerLightColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.r),
              topLeft: Radius.circular(30.r),
            ),
          ),
          // child: Center(
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Image.asset(
          //         ImageAssets.noMessages,
          //       ),
          //       SimpleText(
          //         AppStrings.noMessages.tr(context: context),
          //         textStyle: TextStyleEnum.poppinsRegular,
          //         fontSize: 15.sp,
          //         color: AppColors.grey3,
          //       )
          //     ],
          //   ),
          // ),
          child: BlocBuilder<ChatCubit, ChatState>(
            builder: (context, state) {
              final chats = ChatCubit.get(context).chats;
              if (chats.isEmpty) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImageAssets.noMessages,
                    ),
                    SimpleText(
                      AppStrings.noMessages.tr(context: context),
                      textStyle: TextStyleEnum.poppinsRegular,
                      fontSize: 15.sp,
                      color: AppColors.grey3,
                    )
                  ],
                );
              }
              return ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final chat = chats[index];
                  return InkWell(
                    onTap: () {
                      context.router.push(ConversationRoute(chatId: chat.id));
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ChatImage(chat: chat),
                        SizedBox(width: 18.w),
                        ChatUserNameAndMessage(chat: chat),
                        const Spacer(),
                        ChatTimeAndStatus(chat: chat)
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  height: 20.h,
                ),
                itemCount: chats.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
