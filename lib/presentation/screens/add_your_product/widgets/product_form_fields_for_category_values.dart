part of 'widgets.dart';

class ProductFormFieldsForCategoryValues extends StatelessWidget {
  const ProductFormFieldsForCategoryValues({
    super.key,
    required this.category,
  });

  final Category category;

  List<Input> get getFormFieldsInputs => category.inputs
      .where((e) => e.type == 'TEXT' || e.type == 'NUMBER')
      .toList();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: getFormFieldsInputs.length,
      separatorBuilder: (context, index) => SizedBox(
        height: 40.h,
      ),
      itemBuilder: (context, index) {
        final input = getFormFieldsInputs[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SimpleText(
              input.name,
              textStyle: TextStyleEnum.poppinsRegular,
              fontSize: 15.sp,
            ),
            SizedBox(height: 10.h),
            DefaultTextFormField(
              key: ValueKey<String>('input_${input.id}'),
              initialValue:
                  AddYourProductCubit.get(context).getFromFieldValue(input.id),
              hintTxt: input.name,
              onSaved: (value) {
                log("OnSaved: $value");
                AddYourProductCubit.get(context).addValue(
                  ValueRequest(
                    inputId: input.id,
                    value: input.type != 'TEXT' ? num.parse(value!) : value!,
                  ),
                );
              },
              validationFunction: (value) {
                final max = input.validations['max'];
                final min = input.validations['min'];
                if (max != null && value!.length > max) {
                  return 'This field should be at most $max characters long.';
                }
                if (min != null && value!.length < min) {
                  return 'This field should be at least $min characters long.';
                }
                return null;
              },
              inputType: input.type == 'TEXT'
                  ? TextInputType.text
                  : TextInputType.number,
              textInputAction: index == getFormFieldsInputs.length - 1
                  ? TextInputAction.done
                  : TextInputAction.next,
            ),
          ],
        );
      },
    );
  }
}
