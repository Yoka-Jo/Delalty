part of 'widgets.dart';

class HomeAnimals extends StatelessWidget {
  const HomeAnimals({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SimpleText(
              AppStrings.animal,
              textStyle: TextStyleEnum.montserratMedium,
              fontSize: 16.sp,
            ),
            InkWell(
              onTap: () {
                context.router
                    .push(ViewProductSectionRoute(title: AppStrings.animal));
              },
              child: SimpleText(
                AppStrings.watchMore,
                textStyle: TextStyleEnum.poppinsLight,
                fontSize: 10.sp,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
        SizedBox(height: 18.h),
        SizedBox(
          height: Constants.homeProductsHeight,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            reverse: true,
            itemBuilder: (context, index) {
              return const ProductCardWidget(
                title:
                    'Jermaine ShepherdDescendants of Hero Zov and Boys of Hero Nina and Rocky',
                image:
                    'https://images.unsplash.com/photo-1470093851219-69951fcbb533?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 15.w),
            itemCount: 5,
          ),
        ),
      ],
    );
  }
}
