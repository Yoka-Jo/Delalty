part of 'widgets.dart';

class ChatCategory extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;
  const ChatCategory({
    Key? key,
    required this.title,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          SvgPicture.asset(
            image,
            color: Colors.white,
          ),
          SimpleText(
            title,
            textStyle: TextStyleEnum.poppinsRegular,
            fontSize: 15.sp,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
