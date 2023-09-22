part of 'widgets.dart';

class ProductAppBar extends StatelessWidget {
  const ProductAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = ProductCubit.get(context);
    return SafeArea(
      child: Container(
        color: AppColors.black15,
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Row(
          children: [
            const BackIconWidget(
              iconColor: Colors.black,
            ),
            Expanded(
              child: Center(
                child: SimpleText(
                  'MGHS2022',
                  textStyle: TextStyleEnum.poppinsSemiBold,
                  fontSize: 17.sp,
                  color: Colors.white,
                ),
              ),
            ),
            BlocBuilder<FavoriteCubit, FavoriteState>(
              builder: (context, state) {
                return InkWell(
                  onTap: () async {
                    await FavoriteCubit.get(context)
                        .toggleFavorite(cubit.product);
                  },
                  child: Container(
                    height: 32.w,
                    width: 32.w,
                    padding: EdgeInsets.all(5.h),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: FittedBox(
                      child: SvgPicture.asset(
                        FavoriteCubit.get(context).isFavorite(cubit.product)
                            ? ImageAssets.favoriteFull
                            : ImageAssets.favourite,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(width: 12.w),
            InkWell(
              onTap: () async {
                final dynamicLinkService = DynamicLinkService();
                final path = await dynamicLinkService.generateDynamicLinkUrl(
                  path: '/product/${ProductCubit.get(context).product.id}',
                );
                log(path);
                shareLink(path);
              },
              child: Container(
                height: 32.w,
                width: 32.w,
                padding: EdgeInsets.all(5.h),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: FittedBox(
                  child: SvgPicture.asset(
                    ImageAssets.share,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
