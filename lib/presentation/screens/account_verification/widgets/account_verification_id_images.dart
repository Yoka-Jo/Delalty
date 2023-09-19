part of 'widgets.dart';

class AccountVerificationIdImages extends StatelessWidget {
  const AccountVerificationIdImages({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountVerificationCubit, AccountVerificationState>(
      builder: (context, state) {
        final cubit = AccountVerificationCubit.get(context);
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  SizedBox(height: 30.h),
                  const AccountVerificationStepsBars(firstStepFinished: true),
                  SizedBox(height: 20.h),
                  SimpleText(
                    'ID Card Images',
                    textStyle: TextStyleEnum.poppinsBold,
                    fontSize: 17.sp,
                  ),
                  SizedBox(height: 10.h),
                  SimpleText(
                    'Add front and back images for you ID Card',
                    textStyle: TextStyleEnum.poppinsLight,
                    fontSize: 15.sp,
                    color: AppColors.grey3,
                  ),
                  SizedBox(height: 30.h),
                  if (cubit.frontIdCardImage != null) ...[
                    IDCardImage(
                      key: const Key('front'),
                      image: cubit.frontIdCardImage!,
                      onRemove: cubit.clearFrontIdCardImage,
                    ),
                    SizedBox(height: 20.h),
                  ],
                  if (cubit.backIdCardImage != null)
                    IDCardImage(
                      key: const Key('back'),
                      image: cubit.backIdCardImage!,
                      onRemove: cubit.clearBackIdCardImage,
                    ),
                  SizedBox(height: 150.h),
                ],
              ),
            ),
          ),
          bottomSheet: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MyElevatedButton(
                  title: getButtonTitle(context),
                  onPressed: () async {
                    if (cubit.isIdCardImagesDone()) {
                      cubit.checkUserData();
                    } else {
                      await cubit.addIdCardImage(context);
                    }
                  },
                  borderRadius: 5.r,
                  width: MediaQuery.sizeOf(context).width,
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        );
      },
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return BlocBuilder<AccountVerificationCubit, AccountVerificationState>(
  //     builder: (context, state) {
  //       final cubit = AccountVerificationCubit.get(context);
  //       return Container(
  //         width: double.infinity,
  //         padding: EdgeInsets.symmetric(horizontal: 16.w),
  //         child: Stack(
  //           children: [
  //             Positioned(
  //               right: 0,
  //               left: 0,
  //               top: 0,
  //               child: SingleChildScrollView(
  //                 child: Padding(
  //                   padding: MediaQuery.of(context).viewInsets,
  //                   child: Column(
  //                     children: [
  //                       SizedBox(height: 30.h),
  //                       const AccountVerificationStepsBars(
  //                           firstStepFinished: true),
  //                       SizedBox(height: 20.h),
  //                       SimpleText(
  //                         'ID Card Images',
  //                         textStyle: TextStyleEnum.poppinsBold,
  //                         fontSize: 17.sp,
  //                       ),
  //                       SizedBox(height: 10.h),
  //                       SimpleText(
  //                         'Add front and back images for you ID Card',
  //                         textStyle: TextStyleEnum.poppinsLight,
  //                         fontSize: 15.sp,
  //                         color: AppColors.grey3,
  //                       ),
  //                       SizedBox(height: 30.h),
  //                       if (cubit.frontIdCardImage != null) ...[
  //                         IDCardImage(
  //                           key: const Key('front'),
  //                           image: cubit.frontIdCardImage!,
  //                           onRemove: cubit.clearFrontIdCardImage,
  //                         ),
  //                         SizedBox(height: 20.h),
  //                       ],
  //                       if (cubit.backIdCardImage != null)
  //                         IDCardImage(
  //                           key: const Key('back'),
  //                           image: cubit.backIdCardImage!,
  //                           onRemove: cubit.clearBackIdCardImage,
  //                         ),
  //                       SizedBox(height: 100.h),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             Positioned(
  //               bottom: 10,
  //               right: 0,
  //               left: 0,
  //               child: MyElevatedButton(
  //                 title: getButtonTitle(context),
  //                 onPressed: () async {
  //                   if (cubit.isIdCardImagesDone()) {
  //                     cubit.checkUserData();
  //                   } else {
  //                     await cubit.addIdCardImage(context);
  //                   }
  //                 },
  //                 borderRadius: 5.r,
  //                 width: MediaQuery.sizeOf(context).width,
  //               ),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  String getButtonTitle(BuildContext context) {
    if (AccountVerificationCubit.get(context).frontIdCardImage == null) {
      return AppStrings.addFrontImage.tr(context: context);
    } else if (AccountVerificationCubit.get(context).backIdCardImage == null) {
      return AppStrings.addBackImage.tr(context: context);
    } else {
      return AppStrings.checkNow.tr(context: context);
    }
  }
}
