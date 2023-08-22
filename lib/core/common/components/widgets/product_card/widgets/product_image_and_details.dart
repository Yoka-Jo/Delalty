part of 'widgets.dart';

class ProductImageAndDetails extends StatelessWidget {
  const ProductImageAndDetails({
    super.key,
    required this.width,
    required this.height,
    required this.image,
    required this.padding,
    required this.title,
    required this.titleSize,
    required this.titleColor,
    required this.priceSize,
    required this.details,
    required this.showLocationPin,
    required this.locationColor,
    required this.days,
  });

  final double? width;
  final double? height;
  final String? image;
  final EdgeInsets? padding;
  final String title;
  final double? titleSize;
  final Color? titleColor;
  final double? priceSize;
  final Widget details;
  final bool showLocationPin;
  final Color? locationColor;
  final int? days;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.push(const ProductRoute());
      },
      child: SizedBox(
        width: width ?? 230.w,
        height: height ?? 203.h,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SizedBox(
              height: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.r),
                child: CachedNetworkImage(
                  imageUrl: image ??
                      'https://images.pexels.com/photos/2036544/pexels-photo-2036544.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  alignment: Alignment.topCenter,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const SizedBox.shrink(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: padding ?? EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: Colors.white,
                  border: Border.all(
                    width: 1,
                    color: AppColors.grey4,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SimpleText(
                      title,
                      textStyle: TextStyleEnum.poppinsMedium,
                      fontSize: titleSize ?? 10.sp,
                      color: titleColor ?? AppColors.grey3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 1.h),
                    Row(
                      children: [
                        SimpleText(
                          'EGP 1,000,000',
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
                          Image.asset(
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
                        if (days != null) ...[
                          const Spacer(),
                          SimpleText(
                            "$days ${AppStrings.days}",
                            textStyle: TextStyleEnum.poppinsMedium,
                            fontSize: 8.sp,
                            color: AppColors.grey3,
                          ),
                        ]
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
