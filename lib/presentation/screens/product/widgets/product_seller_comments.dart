part of 'widgets.dart';

class ProductSellerComments extends StatelessWidget {
  const ProductSellerComments({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
      final cubit = ProductCubit.get(context);
      return Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          childrenPadding: EdgeInsets.zero,
          tilePadding: EdgeInsets.zero,
          onExpansionChanged: (value) {
            if (value) {
              cubit.getComments();
            }
          },
          title: SimpleText(
            AppStrings.comments.tr(context: context),
            textStyle: TextStyleEnum.poppinsMedium,
            fontSize: 15.sp,
          ),
          children: cubit.comments == null
              ? List.generate(
                  5,
                  (index) => Row(
                        children: [
                          BuildShimmerWidget(
                            height: 80.r,
                            width: 80.r,
                            borderRadius: 80.r,
                          ),
                          SizedBox(width: 25.h),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BuildShimmerWidget(
                                height: 10.h,
                                width: 50.w,
                              ),
                              SizedBox(height: 5.h),
                              BuildShimmerWidget(
                                height: 10.h,
                                width: 150.w,
                              ),
                            ],
                          )
                        ],
                      ))
              : List.generate(
                  cubit.comments!.length,
                  (index) => Padding(
                    padding: EdgeInsets.only(bottom: 20.h),
                    child: CommentWidget(
                      name: cubit.comments![index].user!.name,
                      comment: cubit.comments![index].content,
                      image: cubit.comments![index].user?.image ?? '',
                    ),
                  ),
                ),
        ),
      );
    });
  }
}
