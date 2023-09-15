part of 'widgets.dart';

class SearchLatestResearch extends StatelessWidget {
  const SearchLatestResearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SimpleText(
          AppStrings.latestResearch.tr(),
          textStyle: TextStyleEnum.poppinsMedium,
          fontSize: 17.sp,
        ),
        SizedBox(height: 27.h),
        SizedBox(
          height: 300.h,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 50.w,
                    height: 48.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.r),
                      child: Image.network(
                        'https://images.pexels.com/photos/2036544/pexels-photo-2036544.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 18.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SimpleText(
                        'MGEHS2022',
                        textStyle: TextStyleEnum.poppinsLight,
                        fontSize: 13.sp,
                        color: AppColors.grey3,
                      ),
                      SimpleText(
                        'Vehicles',
                        textStyle: TextStyleEnum.poppinsMedium,
                        fontSize: 8.sp,
                        color: AppColors.grey3,
                      ),
                    ],
                  )
                ],
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 19.h),
            itemCount: 4,
          ),
        ),
      ],
    );
  }
}
