part of 'widgets.dart';

class BottomNavIconWidget extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onTap;
  final bool isSelected;
  const BottomNavIconWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            icon,
            color: isSelected ? AppColors.primaryColor : null,
            height: 24.r,
            width: 24.r,
          ),
          SimpleText(
            title,
            textStyle: isSelected
                ? TextStyleEnum.poppinsSemiBold
                : TextStyleEnum.poppinsMedium,
            fontSize: isSelected ? 10.sp : 8.sp,
            color: isSelected ? AppColors.primaryColor : AppColors.grey3,
          ),
        ],
      ),
    );
  }
}
