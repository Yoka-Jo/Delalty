part of 'widgets.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({
    super.key,
  });

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  late final ScrollController controller;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    controller.onScrollEndsListener(() {
      SearchCubit.get(context).onSearchChange();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        final cubit = SearchCubit.get(context);
        if (state is SearchForProductsLoading) {
          return Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.sizeOf(context).height / 4),
            child: const CenteredCircularProgressIndicaotr(),
          );
        }

        return SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SimpleText(
                AppStrings.searchResult.tr(context: context),
                textStyle: TextStyleEnum.poppinsMedium,
                fontSize: 17.sp,
              ),
              if (cubit.products.isEmpty)
                SizedBox(height: 200.h)
              else
                SizedBox(height: 27.h),
              if (cubit.products.isEmpty)
                Center(
                  child: SimpleText(
                    context.tr(AppStrings.noResults),
                    textStyle: TextStyleEnum.montserratMedium,
                    fontSize: 16.sp,
                  ),
                )
              else
                GridView.builder(
                  padding: EdgeInsets.symmetric(vertical: 30.h),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  primary: false,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.w,
                    mainAxisSpacing: 11.h,
                    childAspectRatio: 173.w / 160.h,
                  ),
                  itemBuilder: (context, index) {
                    final product = cubit.products[index];
                    return ProductCardWidget(
                      product: product,
                      onTap: () async {
                        await cubit.addProductToRecentlySearched(product);
                        cubit.clearForNavigation();
                      },
                      height: 160.h,
                      width: 173.w,
                      titleSize: 7.sp,
                      titleColor: AppColors.black,
                      priceSize: 8.sp,
                      locationColor: AppColors.grey3,
                      showLocationPin: false,
                      showfavouriteButton: false,
                      padding: EdgeInsets.all(7.r),
                    );
                  },
                  itemCount: cubit.products.length,
                ),
            ],
          ),
        );
      },
    );
  }
}
