part of 'widgets.dart';

class ChatCategory extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;
  final ChatsType type;
  const ChatCategory({
    Key? key,
    required this.title,
    required this.image,
    required this.onTap,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
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
                fontSize: ChatCubit.get(context).currentFilter == type
                    ? 18.sp
                    : 15.sp,
                color: Colors.white,
              ),
            ],
          ),
        );
      },
    );
  }
}
