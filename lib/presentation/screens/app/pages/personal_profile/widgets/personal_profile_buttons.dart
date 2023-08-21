part of 'widgets.dart';

class PersonalProfileButtons extends StatelessWidget {
  const PersonalProfileButtons({
    super.key,
  });

  final List<Widget> buttons = const [
    StatisticsButton(),
    AdvertisingButton(),
    FavoriteButton(),
    AccountSetupButton(),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w),
      child: Column(
        children: buttons
            .map(
              (button) => Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: button,
              ),
            )
            .toList(),
      ),
    );
  }
}
