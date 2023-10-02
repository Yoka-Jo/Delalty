part of 'widgets.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            context.router.push(const NotificationsRoute());
          },
          child: SvgPicture.asset(
            ImageAssets.bell,
            fit: BoxFit.cover,
          ),
        ),
        Column(
          children: [
            SimpleText(
              AppStrings.location.tr(context: context),
              textStyle: TextStyleEnum.poppinsRegular,
              fontSize: 10.sp,
              color: Colors.white,
            ),
            Row(
              children: [
                SvgPicture.asset(
                  ImageAssets.locationPin,
                  fit: BoxFit.cover,
                  color: Colors.white,
                  width: 12.w,
                  height: 15.h,
                ),
                SizedBox(width: 5.w),
                SimpleText(
                  'Egypt',
                  textStyle: TextStyleEnum.montserratMedium,
                  fontSize: 16.sp,
                  color: Colors.white,
                ),
                const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Colors.white,
                )
              ],
            )
          ],
        ),
        Container(
            padding: EdgeInsets.all(2.r),
            height: 45.h,
            width: 45.h,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: BlocBuilder<AppCubit, AppState>(
              builder: (context, state) {
                if (state is AppGetUserDataLoading) {
                  return BuildShimmerWidget(
                    height: 45.r,
                    boxShape: BoxShape.circle,
                    hasMargin: false,
                  );
                }
                return ClipRRect(
                  borderRadius: BorderRadius.circular(45.r),
                  child: CachedImage(
                    url: AppCubit.get(context).user.image,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ))
      ],
    );
  }
}
