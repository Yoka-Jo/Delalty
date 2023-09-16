part of 'widgets.dart';

class HomeFormField extends StatelessWidget {
  const HomeFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.push(const SearchRoute());
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: DefaultTextFormField(
          enabled: false,
          radius: 10.r,
          filledColor: Colors.white,
          inputType: TextInputType.text,
          textInputAction: TextInputAction.done,
          hintTxt: AppStrings.search.tr(context: context),
          prefixIcon: const SearchIcon(),
          suffixIcon:
              SvgPicture.asset(ImageAssets.filter, fit: BoxFit.scaleDown),
        ),
      ),
    );
  }
}
