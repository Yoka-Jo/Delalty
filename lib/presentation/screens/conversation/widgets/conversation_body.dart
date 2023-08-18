part of 'widgets.dart';

class ConversationBody extends StatelessWidget {
  const ConversationBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        child: Column(
          children: [
            const ConversationAppBar(),
            SizedBox(height: 15.h),
            const ConversationContainer()
          ],
        ),
      ),
    );
  }
}
