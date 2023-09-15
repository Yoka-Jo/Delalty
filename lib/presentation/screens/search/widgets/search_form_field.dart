part of 'widgets.dart';

class SearchFormField extends StatelessWidget {
  const SearchFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        final cubit = SearchCubit.get(context);
        return FocusScope(
          child: Focus(
            onFocusChange: (value) => cubit.manipulateUserIsSearching(value),
            child: DefaultTextFormField(
              inputType: TextInputType.text,
              enableColor: AppColors.searchFormFieldBorderColor,
              focusColor: AppColors.searchFormFieldBorderColor,
              textInputAction: TextInputAction.done,
              filledColor: AppColors.searchFormFieldColor,
              hintTxt: AppStrings.search.tr(),
              onChangedFunction: cubit.onSearchChange,
              prefixIcon: const SearchIcon(),
              suffixIcon: cubit.isUserSearching
                  ? const FilterIcon()
                  : const MicrophoneIcon(),
              onTap: () => cubit.manipulateUserIsSearching(true),
            ),
          ),
        );
      },
    );
  }
}
