part of 'widgets.dart';

class ConversationMessagesList extends StatelessWidget {
  const ConversationMessagesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          const bool isMe = 10 < 2;
          return Align(
            alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
            child: Column(
              crossAxisAlignment:
                  isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                if (index == 0) ...[
                  Align(
                    alignment: Alignment.center,
                    child: SimpleText(
                      " 10:00 PM",
                      textStyle: TextStyleEnum.poppinsRegular,
                      fontSize: 10.sp,
                      color: AppColors.grey3,
                    ),
                  ),
                  SizedBox(height: 30.h),
                ],
                Container(
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
                          : Radius.circular(20.r),
                      topLeft: Radius.circular(20.r),
                      bottomLeft: isMe
                          ? Radius.circular(20.r)
                          : const Radius.circular(0.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SimpleText(
                        "Sabri Al-Mouldi",
                        textStyle: TextStyleEnum.poppinsRegular,
                        fontSize: 12.sp,
                        color: isMe
                            ? AppColors.colorOfNameForMeBubble
                            : AppColors.colorOfNameForOtherUserBubble,
                      ),
                      SimpleText(
                        "The car is in excellent condition.",
                        textStyle: TextStyleEnum.poppinsRegular,
                        fontSize: 14.sp,
                        color: isMe
                            ? AppColors.colorOfMessageForMeBubble
                            : AppColors.colorOfMessageForOtherUserBubble,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          height: 20.h,
        ),
        itemCount: 10,
      ),
    );
  }
}
