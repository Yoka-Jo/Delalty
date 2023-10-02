part of 'widgets.dart';

class ProductSelectButtons extends StatelessWidget {
  const ProductSelectButtons({
    super.key,
    required this.category,
  });

  final Category category;

  List<Input> get getSelectInputs =>
      category.inputs.where((e) => e.type == 'SELECT').toList();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: getSelectInputs.length,
      separatorBuilder: (context, index) => SizedBox(
        height: 40.h,
      ),
      itemBuilder: (context, index) {
        final input = getSelectInputs[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SimpleText(
              input.name,
              textStyle: TextStyleEnum.poppinsRegular,
              fontSize: 15.sp,
            ),
            SizedBox(height: 15.h),
            Wrap(
              spacing: 7.w,
              runSpacing: 7.h,
              children: getSelectInputs
                  .map(
                    (input) => BuildOptionButton(
                      isSelected: false,
                      title: input.name,
                      onPressed: () {},
                    ),
                  )
                  .toList(),
            ),
          ],
        );
      },
    );
  }
}
