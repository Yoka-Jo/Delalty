part of 'widgets.dart';

class ViewProductSectionFilterButton extends StatelessWidget {
  const ViewProductSectionFilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.push(const PropertyFilterRoute());
      },
      child: Container(
        height: 50.h,
        width: 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            width: 1,
            color: Colors.black.withOpacity(0.15),
          ),
        ),
        child: Center(
            child: SvgPicture.asset(
          ImageAssets.filter,
          height: 20.r,
          width: 20.r,
          color: AppColors.primaryColor,
        )),
      ),
    );
  }
}
