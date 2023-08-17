part of 'widgets.dart';

class ProductSellerImage extends StatelessWidget {
  const ProductSellerImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          padding: EdgeInsets.all(3.r),
          height: 95.w,
          width: 95.w,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryColor,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(95.r),
            child: Image.network(
              'https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 6.w, bottom: 6.w),
          child: Image.asset(
            ImageAssets.verify,
            height: 18.w,
            width: 18.w,
          ),
        ),
      ],
    );
  }
}
