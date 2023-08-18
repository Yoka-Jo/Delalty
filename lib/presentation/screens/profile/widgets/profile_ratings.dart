part of 'widgets.dart';

class ProfileRatings extends StatelessWidget {
  const ProfileRatings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30.h),
          SimpleText(
            AppStrings.comments,
            textStyle: TextStyleEnum.poppinsMedium,
            fontSize: 15.sp,
          ),
          Expanded(
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return const CommentWidget(
                  name: "Alawi Zakiya",
                  comment: 'This text can be replaced in the same space.',
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 30.h),
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
