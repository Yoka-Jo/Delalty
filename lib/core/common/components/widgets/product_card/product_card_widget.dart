// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:delalty/core/common/components/widgets/simple_text.dart';
import 'package:delalty/presentation/screens/favorite/cubit/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../domain/entities/product.dart';
import '../../../../resources/assets_manager.dart';
import '../../../../resources/colors_manager.dart';
import '../../../../resources/routes/app_router.dart';
import '../cached_image.dart';
import 'product_card_shimmer.dart';

class ProductCardWidget extends StatelessWidget {
  final Product? product;
  final double? titleSize;
  final Color? titleColor;
  final Color? locationColor;
  final bool showLocationPin;
  final bool showfavouriteButton;
  final bool isFavorite;
  final bool isLoading;
  final double? priceSize;
  final EdgeInsets? padding;
  final double? width;
  final double? height;
  final Widget details;
  final VoidCallback? onFavoriteIconTap;
  final Future Function()? onTap;

  const ProductCardWidget({
    Key? key,
    required this.product,
    this.onTap,
    this.titleSize,
    this.titleColor,
    this.locationColor,
    this.showLocationPin = true,
    this.showfavouriteButton = true,
    this.isFavorite = false,
    this.isLoading = false,
    this.priceSize,
    this.padding,
    this.width,
    this.height,
    this.details = const SizedBox.shrink(),
    this.onFavoriteIconTap,
  }) : super(key: key);

  Future<void> onProductTap(BuildContext context) async {
    context.router.push(ProductRoute(productId: product!.id));
    if (onTap != null) {
      await onTap!();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return ProductCardShimmer(
        width: width,
        height: height,
        padding: padding,
      );
    }
    final product = this.product!;
    return SizedBox(
      width: width ?? 230.w,
      height: height ?? 203.h,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          InkWell(
            onTap: () async => await onProductTap(context),
            child: SizedBox(
              height: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.r),
                child: CachedImage(
                  url: product.mainImage,
                  alignment: Alignment.topCenter,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          if (showfavouriteButton)
            BlocBuilder<FavoriteCubit, FavoriteState>(
              builder: (context, state) {
                return Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      FavoriteCubit.get(context).toggleFavorite(product);
                    },
                    child: Container(
                      padding: EdgeInsets.all(7.r),
                      margin: EdgeInsets.all(5.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 1,
                          color: Colors.black.withOpacity(0.2),
                        ),
                      ),
                      child: SvgPicture.asset(
                        FavoriteCubit.get(context).isFavorite(product)
                            ? ImageAssets.favoriteFull
                            : ImageAssets.favourite,
                      ),
                    ),
                  ),
                );
              },
            ),
          Directionality(
            textDirection: TextDirection.ltr,
            child: Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: InkWell(
                onTap: () async => await onProductTap(context),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.r),
                  child: Container(
                    padding: padding ?? EdgeInsets.all(10.r),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: Colors.white,
                        border: Border.all(width: 1, color: AppColors.grey4)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SimpleText(
                          product.title,
                          textStyle: TextStyleEnum.poppinsMedium,
                          fontSize: titleSize ?? 10.sp,
                          color: titleColor ?? AppColors.grey3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 1.h),
                        Row(
                          children: [
                            SimpleText(
                              'EGP ${product.price}',
                              textStyle: TextStyleEnum.poppinsSemiBold,
                              fontSize: priceSize ?? 10.sp,
                            ),
                            const Spacer(),
                            details,
                          ],
                        ),
                        Row(
                          children: [
                            if (showLocationPin) ...[
                              SvgPicture.asset(
                                ImageAssets.locationPin,
                                color: AppColors.primaryColor,
                                width: 12.w,
                                height: 12.h,
                              ),
                              SizedBox(width: 5.w),
                            ],
                            SimpleText(
                              'Egypt . Cairo',
                              textStyle: TextStyleEnum.poppinsMedium,
                              fontSize: 8.sp,
                              color: locationColor ?? AppColors.primaryColor,
                            ),
                            // if (false) ...[
                            //   const Spacer(),
                            //   SimpleText(
                            //     "'days' ${AppStrings.days}",
                            //     textStyle: TextStyleEnum.poppinsMedium,
                            //     fontSize: 8.sp,
                            //     color: AppColors.grey3,
                            //   ),
                            // ]
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
