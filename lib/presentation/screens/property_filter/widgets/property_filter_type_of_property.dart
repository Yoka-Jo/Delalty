// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'widgets.dart';

class PropertyFilterTypeOfProperty extends StatelessWidget {
  const PropertyFilterTypeOfProperty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropertyFilterCubit, PropertyFilterState>(
      builder: (context, state) {
        final cubit = PropertyFilterCubit.get(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SimpleText(
              AppStrings.typeOfProperty,
              textStyle: TextStyleEnum.poppinsRegular,
              fontSize: 13.sp,
            ),
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: cubit.typesOfProperty
                  .map(
                    (typeOfProperty) => _TypeOfProperty(
                      title: typeOfProperty.title,
                      icon: typeOfProperty.image,
                      isSelected: cubit.typeOfProperty == typeOfProperty.title,
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

class _TypeOfProperty extends StatelessWidget {
  final String title;
  final String icon;
  final bool isSelected;
  const _TypeOfProperty({
    Key? key,
    required this.title,
    required this.icon,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        PropertyFilterCubit.get(context).changeTypeOfProperty(title);
      },
      child: Column(
        children: [
          Container(
            height: 65.h,
            width: 65.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: isSelected ? AppColors.primaryColor : Colors.white,
              border: Border.all(
                width: 1,
                color: AppColors.primaryColor,
              ),
            ),
            child: Center(
                child: Image.asset(
              icon,
              color: isSelected ? Colors.white : AppColors.primaryColor,
            )),
          ),
          SizedBox(height: 5.h),
          SimpleText(
            title,
            textStyle: isSelected
                ? TextStyleEnum.poppinsRegular
                : TextStyleEnum.poppinsMedium,
            fontSize: isSelected ? 12.sp : 13.sp,
          )
        ],
      ),
    );
  }
}
