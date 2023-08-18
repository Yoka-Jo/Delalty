part of 'widgets.dart';

class ChatUserNameAndMessage extends StatelessWidget {
  const ChatUserNameAndMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SimpleText(
          'Sabri Al-Mouldi',
          textStyle: TextStyleEnum.poppinsMedium,
          fontSize: 12.sp,
        ),
        SizedBox(height: 5.h),
        SimpleText(
          'Hello Cam Car Price',
          textStyle: TextStyleEnum.poppinsMedium,
          fontSize: 12.sp,
          color: AppColors.grey3,
        ),
      ],
    );
  }
}
