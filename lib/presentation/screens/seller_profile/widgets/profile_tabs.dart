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
    return BlocBuilder<SellerProfileCubit, SellerProfileState>(
      builder: (context, state) {
        final cubit = SellerProfileCubit.get(context);
        final isLoading = cubit.user == null;
        return DefaultTabController(
            length: 3,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 280.h,
                    child: Stack(
                      children: [
                        if (!isLoading)
                          CachedImage(
                            url:
                                'https://images.pexels.com/photos/707046/pexels-photo-707046.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                            height: 250.h,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        const ProfileAppBar(),
                        if (!isLoading)
                          Container(
                            margin: EdgeInsets.only(left: 35.w),
                            alignment: Alignment.bottomLeft,
                            child: UserImage(
                              image: cubit.user!.image,
                              isVerified: cubit.user?.seller?.verified == true,
                            ),
                          )
                      ],
                    ),
                  ),
                  if (!isLoading) ...[
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        children: [
                          const ProfileData(),
                          SizedBox(height: 25.h),
                          // TabBar(
                          //   controller: tabController,
                          //   indicatorColor: AppColors.primaryColor,
                          //   indicatorSize: TabBarIndicatorSize.label,
                          //   labelPadding: EdgeInsets.zero,
                          //   labelColor: Colors.black,
                          //   unselectedLabelColor: AppColors.grey3,
                          //   unselectedLabelStyle: getRegularStyle(
                          //     color: AppColors.grey3,
                          //     fontSize: 15.sp,
                          //     family: FontFamilies.poppins,
                          //   ),
                          //   labelStyle: getMediumStyle(
                          //     color: Colors.black,
                          //     fontSize: 15.sp,
                          //     family: FontFamilies.poppins,
                          //   ),
                          //   tabs: const [
                          //     Tab(
                          //       text: AppStrings.listOfProducts,
                          //     ),
                          //     Tab(
                          //       text: AppStrings.ratings,
                          //     ),
                          //     Tab(
                          //       text: AppStrings.details,
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                    // pages[tabController.index]
                    const ProfileListOfProducts(),
                  ],
                  if (isLoading)
                    SizedBox(
                        height: MediaQuery.sizeOf(context).shortestSide,
                        child: const CenteredCircularProgressIndicaotr())
                ],
              ),
            ));
      },
    );
  }
}
