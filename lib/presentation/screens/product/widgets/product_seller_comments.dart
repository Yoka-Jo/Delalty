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
        children: List.generate(
          5,
          (index) => const CommentWidget(
            name: "Alawi Zakiya",
            comment: 'This text can be replaced in the same space.',
          ),
        ),
      ),
    );
  }
}
