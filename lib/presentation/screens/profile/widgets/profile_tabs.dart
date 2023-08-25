// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'widgets.dart';

class ProfileTabs extends StatefulWidget {
  const ProfileTabs({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileTabs> createState() => _ProfileTabsState();
}

class _ProfileTabsState extends State<ProfileTabs>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: pages.length, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
  }

  final List<Widget> pages = const [
    ProfileListOfProducts(),
    ProfileRatings(),
    ProfileDetails(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: SingleChildScrollView(
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
                            IconButton(
                                padding: EdgeInsets.zero,
                                alignment: Alignment.centerRight,
                                onPressed: () async =>
                                    await buildBottomSheet(context),
                                icon: SvgPicture.asset(ImageAssets.more))
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
                      controller: tabController,
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
              pages[tabController.index]
            ],
          ),
        ));
  }

  Future buildBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.grey2,
      builder: (context) => Padding(
          padding: EdgeInsets.all(30.r),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BottomSheetElementWidget(
                title: AppStrings.sharingProfile,
                icon: ImageAssets.share,
                onTap: () {},
              ),
              SizedBox(height: 30.h),
              BottomSheetElementWidget(
                title: AppStrings.reportThisUser,
                icon: ImageAssets.userReport,
                onTap: () {},
              ),
              SizedBox(height: 30.h),
              BottomSheetElementWidget(
                title: AppStrings.blockUser,
                icon: ImageAssets.userBlock,
                onTap: () {},
              ),
            ],
          )),
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
