part of 'widgets.dart';

class ViewProductSectionFormField extends StatelessWidget {
  const ViewProductSectionFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTextFormField(
        inputType: TextInputType.text,
        textInputAction: TextInputAction.go,
        hintTxt: AppStrings.search,
        enableColor: AppColors.searchFormFieldBorderColor,
        focusColor: AppColors.searchFormFieldBorderColor,
        filledColor: AppColors.searchFormFieldColor,
        prefixIcon: const SearchIcon(),
        onChangedFunction:
            ViewProductSectionCubit.get(context).searchForProducts,
      ),
    );
  }
}
