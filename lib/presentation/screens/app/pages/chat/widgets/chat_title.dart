part of 'widgets.dart';

class ChatTitle extends StatelessWidget {
  const ChatTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleText(
      AppStrings.chat,
      textStyle: TextStyleEnum.poppinsMedium,
      fontSize: 17.sp,
      color: Colors.white,
    );
  }
}
