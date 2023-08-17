part of 'widgets.dart';

class ProductSellerComments extends StatelessWidget {
  const ProductSellerComments({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        childrenPadding: EdgeInsets.zero,
        tilePadding: EdgeInsets.zero,
        title: SimpleText(
          AppStrings.comments,
          textStyle: TextStyleEnum.poppinsMedium,
          fontSize: 15.sp,
        ),
        children: [
          Wrap(
            spacing: 30.w,
            runSpacing: 30.w,
            children: List.generate(
              5,
              (index) => Row(
                children: [
                  CircleAvatar(
                    radius: 40.r,
                    backgroundColor: Colors.transparent,
                    backgroundImage: const AssetImage(
                      ImageAssets.notifications,
                    ),
                  ),
                  SizedBox(width: 25.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SimpleText(
                        'Alawi Zakiya',
                        textStyle: TextStyleEnum.poppinsMedium,
                        fontSize: 14.sp,
                      ),
                      SizedBox(height: 5.h),
                      SizedBox(
                        width: 245.w,
                        child: SimpleText(
                          'This text can be replaced in the same space.' * 2,
                          textStyle: TextStyleEnum.poppinsLight,
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
