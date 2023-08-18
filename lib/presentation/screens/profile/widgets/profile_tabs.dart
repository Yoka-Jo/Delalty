part of 'widgets.dart';

class ProfileTabs extends StatelessWidget {
  const ProfileTabs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(
                      height: 280.h,
                      child: Stack(
                        children: [
                          Image.network(
                            'https://images.pexels.com/photos/707046/pexels-photo-707046.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                            height: 250.h,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                          SafeArea(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 18.w),
                              child: Row(
                                children: [
                                  const BackIconWidget(),
                                  const Spacer(),
                                  InkWell(
                                      onTap: () => buildBottomSheet(context),
                                      child: SvgPicture.asset(ImageAssets.more))
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 35.w),
                            alignment: Alignment.bottomLeft,
                            child: const UserImage(
                              image:
                                  'https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        children: [
                          const ProfileData(),
                          SizedBox(height: 35.h),
                          TabBar(
                            indicatorColor: AppColors.primaryColor,
                            indicatorSize: TabBarIndicatorSize.label,
                            labelPadding: EdgeInsets.zero,
                            labelColor: Colors.black,
                            unselectedLabelColor: AppColors.grey3,
                            unselectedLabelStyle: getRegularStyle(
                              color: AppColors.grey3,
                              fontSize: 15.sp,
                              family: FontFamilies.poppins,
                            ),
                            labelStyle: getMediumStyle(
                              color: Colors.black,
                              fontSize: 15.sp,
                              family: FontFamilies.poppins,
                            ),
                            tabs: const [
                              Tab(
                                text: AppStrings.listOfProducts,
                              ),
                              Tab(
                                text: AppStrings.ratings,
                              ),
                              Tab(
                                text: AppStrings.details,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ];
          },
          body: const TabBarView(
            children: [
              ProfileListOfProducts(),
              ProfileRatings(),
              ProfileDetails(),
            ],
          ),
        ),
      ),
    );
  }

  Future buildBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: EdgeInsets.all(30.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            3,
            (index) {
              final e = elements[index];
              return Padding(
                padding: EdgeInsets.only(top: index != 0 ? 30.h : 0.0),
                child: Row(
                  children: [
                    Container(
                      width: 35.w,
                      height: 35.w,
                      padding: EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: AppColors.primaryColor,
                      ),
                      child: SvgPicture.asset(
                        e.image,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    SimpleText(
                      e.title,
                      textStyle: TextStyleEnum.poppinsMedium,
                      fontSize: 15.sp,
                    ),
                  ],
                ),
              );
            },
          ).toList(),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(
            20.r,
          ),
          topLeft: Radius.circular(
            20.r,
          ),
        ),
      ),
    );
  }
}
