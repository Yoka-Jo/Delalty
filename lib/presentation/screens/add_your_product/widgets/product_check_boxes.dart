part of 'widgets.dart';

class ProductCheckBoxes extends StatefulWidget {
  const ProductCheckBoxes({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  State<ProductCheckBoxes> createState() => _ProductCheckBoxesState();
}

class _ProductCheckBoxesState extends State<ProductCheckBoxes> {
  List<Input> checkBoxes = [];

  @override
  void initState() {
    super.initState();
    checkBoxes =
        widget.category.inputs.where((e) => e.type == 'BOOLEAN').toList();
    for (final checkBox in checkBoxes) {
      AddYourProductCubit.get(context).addValue(ValueRequest(
        inputId: checkBox.id,
        value: 'false',
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddYourProductCubit, AddYourProductState>(
      builder: (context, state) {
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: checkBoxes.length,
          separatorBuilder: (context, index) => SizedBox(
            height: 10.h,
          ),
          itemBuilder: (context, index) {
            final input = checkBoxes[index];
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SimpleText(
                  input.name,
                  textStyle: TextStyleEnum.poppinsRegular,
                  fontSize: 15.sp,
                ),
                SizedBox(height: 15.h),
                Checkbox(
                  value: AddYourProductCubit.get(context)
                      .getCheckBoxValue(input.id),
                  activeColor: AppColors.primaryColor,
                  onChanged: (value) {
                    log(value.toString());
                    AddYourProductCubit.get(context)
                        .changeCheckBoxValue(input.id, value ?? false);
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
