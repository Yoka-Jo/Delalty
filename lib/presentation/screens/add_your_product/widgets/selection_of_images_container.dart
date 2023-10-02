part of 'widgets.dart';

class SelectionOfImagesContainer extends StatelessWidget {
  const SelectionOfImagesContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddYourProductCubit, AddYourProductState>(
      builder: (context, state) {
        final cubit = AddYourProductCubit.get(context);
        return Container(
          width: double.infinity,
          padding: EdgeInsets.only(
            top: cubit.images.isEmpty ? 42.h : 10.h,
            bottom: 32.h,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              width: 1,
              color: AppColors.black15,
            ),
          ),
          child: Column(
            children: [
              if (cubit.images.isEmpty)
                SvgPicture.asset(
                  ImageAssets.gallery,
                  width: 49.r,
                  height: 49.r,
                )
              else
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Stack(
                    children: [
                      BuildCarousel(
                        numberOfImagesMargin: EdgeInsets.all(10.r),
                        height: MediaQuery.sizeOf(context).width / 2,
                        showFavouriteButton: false,
                        showIfOnlyOneImage: cubit.images.length != 1,
                        images: cubit.images,
                        onSwipe: cubit.changeSwipedImageIndex,
                      ),
                      Positioned(
                        top: 10.r,
                        right: 10.r,
                        child: InkWell(
                          onTap: () {
                            cubit.removeImage();
                          },
                          child: CircleAvatar(
                            radius: 16.r,
                            backgroundColor: AppColors.red,
                            child: CircleAvatar(
                              radius: 14.r,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.close,
                                color: Colors.black,
                                size: 20.r,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              SizedBox(height: 22.h),
              MyElevatedButton(
                height: 45.h,
                width: 173.w,
                title: AppStrings.selectionOfImages.tr(context: context),
                titleSize: 12.sp,
                textStyle: TextStyleEnum.poppinsLight,
                icon: ImageAssets.camera,
                iconColor: Colors.white,
                onPressed: () {
                  cubit.pickImages(context);
                },
              ),
              SizedBox(height: 10.h),
              SimpleText(
                AppStrings.uploadPhotosUpTo.tr(context: context),
                textStyle: TextStyleEnum.poppinsRegular,
                fontSize: 12.sp,
                color: AppColors.grey3,
              ),
            ],
          ),
        );
      },
    );
  }
}
