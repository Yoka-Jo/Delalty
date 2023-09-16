part of 'widgets.dart';

class ProductBody extends StatefulWidget {
  const ProductBody({
    super.key,
    required this.productId,
  });
  final String productId;

  @override
  State<ProductBody> createState() => _ProductBodyState();
}

class _ProductBodyState extends State<ProductBody> {
  @override
  void initState() {
    super.initState();

    ProductCubit.get(context).getProduct(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is GetProductLoading) {
          return SafeArea(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: const Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: BackIconWidget(
                      iconColor: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: CenteredCircularProgressIndicaotr(),
                  ),
                ],
              ),
            ),
          );
        }
        return const SingleChildScrollView(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              ProductImages(),
              ProductAppBar(),
              ProductContainer(),
            ],
          ),
        );
      },
    );
  }
}
