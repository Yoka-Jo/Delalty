// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'widgets.dart';

class PropertyFilterPrice extends StatefulWidget {
  const PropertyFilterPrice({
    super.key,
  });

  @override
  State<PropertyFilterPrice> createState() => _PropertyFilterPriceState();
}

class _PropertyFilterPriceState extends State<PropertyFilterPrice> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropertyFilterCubit, PropertyFilterState>(
      builder: (context, state) {
        final cubit = PropertyFilterCubit.get(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SimpleText(
              AppStrings.price,
              textStyle: TextStyleEnum.poppinsRegular,
              fontSize: 13.sp,
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _PriceFilter(
                  title: AppStrings.highestPrice,
                  hint: AppStrings.all,
                  controller: cubit.maxPriceController,
                ),
                _PriceFilter(
                  title: AppStrings.lowestPrice,
                  hint: '0',
                  controller: cubit.minPriceController,
                ),
              ],
            ),
            RangeSlider(
              activeColor: AppColors.primaryColor,
              // ignore: prefer_const_constructors
              values: cubit.currentRangeValues,
              max: 1000000,
              divisions: 100,
              labels: RangeLabels(
                cubit.currentRangeValues.start.round().toString(),
                cubit.currentRangeValues.end.round().toString(),
              ),
              onChangeStart: (value) {
                cubit.changeMinPrice(value.start.round().toString());
              },
              onChangeEnd: (value) {
                cubit.changeMaxPrice(value.end.round().toString());
              },
              onChanged: (RangeValues values) {
                setState(() {
                  cubit.currentRangeValues = values;
                });
              },
            )
          ],
        );
      },
    );
  }
}

class _PriceFilter extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController controller;

  const _PriceFilter({
    Key? key,
    required this.title,
    required this.hint,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SimpleText(
          title,
          textStyle: TextStyleEnum.poppinsRegular,
          fontSize: 13.sp,
        ),
        SizedBox(height: 8.h),
        SizedBox(
          width: 110.w,
          height: 32.h,
          child: DefaultTextFormField(
            controller: controller,
            radius: 5.r,
            textAlign: TextAlign.center,
            inputType: TextInputType.number,
            textInputAction: TextInputAction.done,
            hintTxt: hint,
            padding: EdgeInsets.zero,
          ),
        )
      ],
    );
  }
}
