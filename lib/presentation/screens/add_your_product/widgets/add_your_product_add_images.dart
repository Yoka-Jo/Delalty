part of 'widgets.dart';

class AddYourProductAddImages extends StatelessWidget {
  const AddYourProductAddImages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40.h),
          SimpleText(
            AppStrings.addArabicPhotos.tr(context: context),
            textStyle: TextStyleEnum.poppinsMedium,
            fontSize: 18.sp,
          ),
          SizedBox(height: 12.h),
          SimpleText(
            AppStrings.addClearImages.tr(context: context),
            textStyle: TextStyleEnum.poppinsLight,
            fontSize: 12.sp,
            color: AppColors.grey3,
          ),
          SizedBox(height: 23.h),
          const SelectionOfImagesContainer(),
          SizedBox(height: 60.h),
          BlocBuilder<AddYourProductCubit, AddYourProductState>(
            builder: (context, state) {
              final cubit = AddYourProductCubit.get(context);
              return MyElevatedButton(
                height: 50.h,
                isLoading: state is CreateProductLoading,
                title: AppStrings.next.tr(context: context),
                onPressed: () async {
                  await cubit.createProduct();
                },
              );
            },
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
