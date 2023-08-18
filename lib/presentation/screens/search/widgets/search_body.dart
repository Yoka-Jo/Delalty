part of 'widgets.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        final cubit = SearchCubit.get(context);

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SearchFormField(),
                SizedBox(height: 30.h),
                if (cubit.isUserSearching)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SimpleText(
                        AppStrings.searchResult,
                        textStyle: TextStyleEnum.poppinsMedium,
                        fontSize: 17.sp,
                      ),
                      SizedBox(height: 27.h),
                      GridView.count(
                        shrinkWrap: true,
                        crossAxisSpacing: 16.w,
                        mainAxisSpacing: 11.h,
                        childAspectRatio: 230.w / 170.h,
                        crossAxisCount: 2,
                        children: List.generate(
                            5,
                            (index) => SizedBox(
                                  width: 230.w,
                                  child: Stack(
                                    alignment: Alignment.topCenter,
                                    children: [
                                      Align(
                                        alignment: Alignment.topCenter,
                                        child: Container(
                                          width: 230.w,
                                          height: 120.h,
                                          alignment: Alignment.topCenter,
                                          child: Align(
                                            alignment: Alignment.topCenter,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(5.r),
                                                topRight: Radius.circular(5.r),
                                              ),
                                              child: Image.network(
                                                'https://images.pexels.com/photos/2036544/pexels-photo-2036544.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                                                fit: BoxFit.fitWidth,
                                                alignment: Alignment.topCenter,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5.r),
                                          child: Container(
                                            padding: EdgeInsets.all(10.r),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5.r),
                                                color: Colors.white,
                                                border: Border.all(
                                                    width: 1,
                                                    color: AppColors.grey4)),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SimpleText(
                                                  "BMD WDL 320i 2024",
                                                  textStyle: TextStyleEnum
                                                      .poppinsMedium,
                                                  fontSize: 7.sp,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                Row(
                                                  children: [
                                                    SimpleText(
                                                      'EGP 1,000,000',
                                                      textStyle: TextStyleEnum
                                                          .poppinsSemiBold,
                                                      fontSize: 8.sp,
                                                    ),
                                                  ],
                                                ),
                                                SimpleText(
                                                  'Egypt . Cairo',
                                                  textStyle: TextStyleEnum
                                                      .poppinsRegular,
                                                  fontSize: 5.sp,
                                                  color: AppColors.grey3,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                      )
                    ],
                  ),
                if (!cubit.isUserSearching) ...[
                  const SearchLatestResearch(),
                  SizedBox(height: 40.h),
                  const SearchProposed()
                ]
              ],
            ),
          ),
        );
      },
    );
  }
}
