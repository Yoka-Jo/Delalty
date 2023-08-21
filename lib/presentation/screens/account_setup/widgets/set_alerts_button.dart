part of 'widgets.dart';

class SetAlertsButton extends StatelessWidget {
  const SetAlertsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BuildButton(
      title: AppStrings.setAlerts,
      subTitle: AppStrings.setNotifications,
      icon: ImageAssets.bell,
      onTap: () {
        context.router.push(const SetAlertsRoute());
      },
    );
  }
}
