part of 'widgets.dart';

class ViewProductSectionButtons extends StatelessWidget {
  const ViewProductSectionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: BuildOutlinedButton(
            title: AppStrings.arrangement,
            icon: ImageAssets.arrangement,
            onPressed: () {},
          ),
        ),
        SizedBox(width: 45.w),
        Expanded(
          child: BuildOutlinedButton(
            title: AppStrings.filter,
            icon: ImageAssets.filter,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
