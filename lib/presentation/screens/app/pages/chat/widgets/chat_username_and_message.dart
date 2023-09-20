// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'widgets.dart';

class ChatUserNameAndMessage extends StatelessWidget {
  const ChatUserNameAndMessage({
    Key? key,
    required this.chat,
  }) : super(key: key);

  final Chat chat;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SimpleText(
          chat.participants[1].user?.name ?? '',
          textStyle: TextStyleEnum.poppinsMedium,
          fontSize: 12.sp,
        ),
        SizedBox(height: 5.h),
        SimpleText(
          chat.lastMessage?.content ?? '',
          textStyle: TextStyleEnum.poppinsMedium,
          fontSize: 12.sp,
          color: AppColors.grey3,
        ),
      ],
    );
  }
}
