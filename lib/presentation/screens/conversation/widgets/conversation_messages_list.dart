part of 'widgets.dart';

class ConversationMessagesList extends StatelessWidget {
  const ConversationMessagesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<SocketCubit, SocketState>(
      listener: (context, state) {
        log("SocketMessageCreated");
        if (state is SocketMessageCreated) {
          ConversationCubit.get(context).addMessage(state.message);
        }
      },
      child: BlocBuilder<ConversationCubit, ConversationState>(
          builder: (context, state) {
        if (state is ConversationGetMessagesLoading) {
          return const Expanded(child: CenteredCircularProgressIndicaotr());
        }
        final cubit = ConversationCubit.get(context);
        return Directionality(
          textDirection: TextDirection.ltr,
          child: Expanded(
            child: ListView.separated(
              reverse: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final message = cubit.messages[index];
                bool isMe = message.authorId == AppCubit.get(context).user.id;
                String formattedTime = getFormattedTime(message.createdAt);
                final user = cubit.chat.participants.firstWhere(
                    (element) => element.user!.id == message.authorId);
                return Column(
                  children: [
                    if (index == 0 ||
                        formattedTime !=
                            getFormattedTime(
                                cubit.messages[index - 1].createdAt)) ...[
                      Align(
                        alignment: Alignment.center,
                        child: SimpleText(
                          formattedTime,
                          textStyle: TextStyleEnum.poppinsRegular,
                          fontSize: 10.sp,
                          color: AppColors.grey3,
                        ),
                      ),
                      SizedBox(height: 20.h),
                    ],
                    Align(
                      alignment:
                          isMe ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          color: (isMe
                              ? AppColors.colorOfChatBubbleForMe
                              : AppColors.colorOfChatBubbleForOtherUser),
                          borderRadius: BorderRadius.only(
                            topRight: const Radius.circular(10.0),
                            bottomRight: isMe
                                ? const Radius.circular(0.0)
                                : Radius.circular(15.r),
                            topLeft: Radius.circular(15.r),
                            bottomLeft: isMe
                                ? Radius.circular(15.r)
                                : const Radius.circular(0.0),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SimpleText(
                              user.user?.name ?? '',
                              textStyle: TextStyleEnum.poppinsRegular,
                              fontSize: 12.sp,
                              color: isMe
                                  ? AppColors.colorOfNameForMeBubble
                                  : AppColors.colorOfNameForOtherUserBubble,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (message.attachments.isNotEmpty) ...[
                                  SizedBox(
                                    width: MediaQuery.sizeOf(context).width *
                                        2 /
                                        3,
                                    child: BuildCarousel(
                                      numberOfImagesMargin:
                                          EdgeInsets.all(10.r),
                                      height:
                                          MediaQuery.sizeOf(context).width / 2,
                                      showFavouriteButton: false,
                                      showIfOnlyOneImage:
                                          message.attachments.length != 1,
                                      images: message.attachments
                                          .map((e) => e.url)
                                          .toList(),
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                ],
                                SimpleText(
                                  message.content,
                                  textStyle: TextStyleEnum.poppinsRegular,
                                  fontSize: 14.sp,
                                  color: isMe
                                      ? AppColors.colorOfMessageForMeBubble
                                      : AppColors
                                          .colorOfMessageForOtherUserBubble,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                height: 20.h,
              ),
              itemCount: cubit.messages.length,
            ),
          ),
        );
      }),
    );
  }
}
