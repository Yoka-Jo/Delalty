// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'widgets.dart';

class ChatTimeAndStatus extends StatelessWidget {
  const ChatTimeAndStatus({
    Key? key,
    required this.chat,
  }) : super(key: key);

  final Chat chat;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SimpleText(
          chat.lastMessage?.content ?? '10:00 PM',
          textStyle: TextStyleEnum.poppinsRegular,
          fontSize: 12.sp,
          color: AppColors.grey3,
        ),
        SizedBox(height: 5.h),
        // Container(
        //   width: 17.w,
        //   height: 17.w,
        //   decoration: BoxDecoration(
        //     color: AppColors.primaryColor,
        //     borderRadius: BorderRadius.circular(5.r),
        //   ),
        //   child: Center(
        //     child: SimpleText(
        //       '1',
        //       textStyle: TextStyleEnum.poppinsMedium,
        //       fontSize: 8.sp,
        //       color: Colors.white,
        //     ),
        //   ),
        // ),
        Container(
          width: 17.w,
          height: 17.w,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.grey3,
                width: 1,
              )),
          child: Center(
            child: Icon(
              Icons.check,
              size: 12.r,
              color: AppColors.grey3,
            ),
          ),
        ),
      ],
    );
  }
}
