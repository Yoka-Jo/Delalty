// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'widgets.dart';

class ProfileData extends StatelessWidget {
  const ProfileData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = SellerProfileCubit.get(context);

    return Column(
      children: [
        SizedBox(height: 25.h),
        Align(
          alignment: Alignment.centerLeft,
          child: SimpleText(
            cubit.user!.name,
            textStyle: TextStyleEnum.poppinsMedium,
            fontSize: 18.sp,
          ),
        ),
        // SizedBox(height: 8.h),
        // const UserRating(rating: 5),
        // SizedBox(height: 10.h),
        // SimpleText(
        //   'Member since 2020',
        //   textStyle: TextStyleEnum.poppinsRegular,
        //   fontSize: 13.sp,
        //   color: AppColors.grey3,
        // ),
        SizedBox(height: 40.h),
        MyElevatedButton(
          title: AppStrings.chat.tr(context: context),
          icon: ImageAssets.message,
          onPressed: () {
            context.router.push(const ConversationRoute());
          },
        )
      ],
    );
  }
}
