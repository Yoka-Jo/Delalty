part of 'widgets.dart';

class ConversationDivider extends StatelessWidget {
  const ConversationDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 1,
      color: AppColors.grey5,
    );
  }
}
