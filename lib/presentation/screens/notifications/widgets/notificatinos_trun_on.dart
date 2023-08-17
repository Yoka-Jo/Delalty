part of 'widgets.dart';

class NotificationsTrunOn extends StatelessWidget {
  const NotificationsTrunOn({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(ImageAssets.notifications),
          SimpleText(
            AppStrings.turnOnNotifications,
            textStyle: TextStyleEnum.poppinsRegular,
            fontSize: 20.sp,
            color: AppColors.grey3,
          ),
        ],
      ),
    );
  }
}
