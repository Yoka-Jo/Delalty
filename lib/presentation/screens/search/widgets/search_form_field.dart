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
            onFocusChange: (value) {
              if (!value) {
                cubit.manipulateUserIsSearching(false);
              }
            },
            child: DefaultTextFormField(
              controller: SearchCubit.get(context).searchController,
              inputType: TextInputType.text,
              enableColor: AppColors.searchFormFieldBorderColor,
              focusColor: AppColors.searchFormFieldBorderColor,
              textInputAction: TextInputAction.done,
              filledColor: AppColors.searchFormFieldColor,
              hintTxt: AppStrings.search.tr(context: context),
              onChangedFunction: cubit.onSearchChange,
              prefixIcon: const SearchIcon(),
              suffixIcon: cubit.isUserSearching &&
                      state is SearchForProductsSuccess
                  ? const FilterIcon()
                  : AvatarGlow(
                      endRadius: 20.r,
                      animate: cubit.isListening,
                      duration: const Duration(milliseconds: 2000),
                      glowColor: AppColors.primaryColor,
                      repeat: true,
                      repeatPauseDuration: const Duration(milliseconds: 100),
                      showTwoGlows: true,
                      child: SizedBox(
                        width: 50.w,
                        child: InkWell(
                          onTap: () async {
                            if (cubit.isListening) {
                              await cubit.finishListeningForSpeech();
                            } else {
                              await cubit.listeningForSpeech();
                            }
                          },
                          onTapUp: (details) {},
                          child: const MicrophoneIcon(),
                        ),
                      ),
                    ),
              // onTap: () => cubit.manipulateUserIsSearching(true),
            ),
          ),
        );
      },
    );
  }
}
