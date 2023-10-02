part of 'widgets.dart';

class ViewProductSectionListOfProucts extends StatefulWidget {
  const ViewProductSectionListOfProucts({
    super.key,
    required this.isRealEstate,
  });

  final bool isRealEstate;

  @override
  State<ViewProductSectionListOfProucts> createState() =>
      _ViewProductSectionListOfProuctsState();
}

class _ViewProductSectionListOfProuctsState
    extends State<ViewProductSectionListOfProucts> {
  late final ScrollController controller;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    controller.onScrollEndsListener(() {
      ViewProductSectionCubit.get(context).getProducts(next: true);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = ViewProductSectionCubit.get(context);
    final isLoading = cubit.state is ViewProductSectionGetProductsLoading;

    final isGettingProdutsForFirstTime = cubit.isGettingProdutsForFirstTime;
    final products = cubit.products;
    return Expanded(
      child: Column(
        children: [
          SizedBox(height: 30.h),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.only(bottom: 50.h),
              controller: controller,
              physics: const BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: widget.isRealEstate ? 1 : 2,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 11.h,

                childAspectRatio: widget.isRealEstate ? 1.7 : 0.92,
                // isRealEstate ? (361.w / 203.h) : (173.w / 160.h), //361.w / 203.h,
              ),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ProductCardWidget(
                      isLoading: isGettingProdutsForFirstTime,
                      product: products.isEmpty ? null : products[index],
                      width: double.infinity,
                      height: 173.h,
                      titleSize: widget.isRealEstate ? 12.sp : 7.sp,
                      titleColor: widget.isRealEstate
                          ? AppColors.grey3
                          : AppColors.black,
                      priceSize: widget.isRealEstate ? 12.sp : 8.sp,
                      locationColor: widget.isRealEstate
                          ? AppColors.primaryColor
                          : AppColors.grey3,
                      showLocationPin: widget.isRealEstate,
                      padding: widget.isRealEstate
                          ? EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 7.h)
                          : EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 7.h),
                      details: widget.isRealEstate
                          ? const RealEstateFeatures(
                              area: 220,
                              bedsNumber: 4,
                              bathroomsNumber: 3,
                            )
                          : const SizedBox.shrink(),
                    ),
                  ],
                );
              },
              itemCount: isGettingProdutsForFirstTime ? 4 : (products.length),
            ),
          ),
          if (isLoading && !isGettingProdutsForFirstTime) ...[
            const CenteredCircularProgressIndicaotr(),
          ]
        ],
      ),
    );
  }
}
