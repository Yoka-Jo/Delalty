part of 'widgets.dart';

class HomeFormField extends StatelessWidget {
  const HomeFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTextFormField(
      radius: 10.r,
      filledColor: Colors.white,
      inputType: TextInputType.text,
      textInputAction: TextInputAction.done,
      hintTxt: AppStrings.search,
      prefixIcon: SvgPicture.asset(
        ImageAssets.search,
        fit: BoxFit.scaleDown,
      ),
      suffixIcon: SvgPicture.asset(ImageAssets.filter, fit: BoxFit.scaleDown),
    );
  }
}
