part of 'widgets.dart';

class SearchFormField extends StatelessWidget {
  const SearchFormField({
    super.key,
  });

  void _showFilterMenu(BuildContext context, Offset offset) async {
    late RelativeRect position = RelativeRect.fromDirectional(
      textDirection: Directionality.of(context),
      start: offset.dx,
      top: offset.dy,
      end: 0,
      bottom: 0,
    );
    await showMenu(
      context: context,
      position: position,
      items: [
        PopupMenuItem(
          value: 1,
          onTap: () => SearchCubit.get(context).arrangeProducts(true),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SimpleText(
                AppStrings.price.tr(context: context),
                textStyle: TextStyleEnum.montserratSemiBold,
                fontSize: 18.sp,
              ),
              const Icon(
                Icons.arrow_upward,
                color: AppColors.red,
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: 2,
          height: 5.h,
          child: const Divider(
            color: AppColors.grey3,
          ),
        ),
        PopupMenuItem(
          value: 3,
          onTap: () => SearchCubit.get(context).arrangeProducts(false),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SimpleText(
                AppStrings.price.tr(context: context),
                textStyle: TextStyleEnum.montserratSemiBold,
                fontSize: 18.sp,
              ),
              const Icon(
                Icons.arrow_downward,
                color: AppColors.primaryColor,
              )
            ],
          ),
        ),
      ],
      elevation: 8.0,
    );
  }

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
              suffixIcon: !cubit.isSearStrEmpty
                  ? InkWell(
                      onTapUp: (details) =>
                          _showFilterMenu(context, details.globalPosition),
                      child: const FilterIcon())
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
