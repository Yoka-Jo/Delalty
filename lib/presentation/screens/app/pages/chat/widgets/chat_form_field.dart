part of 'widgets.dart';

class ChatFormField extends StatelessWidget {
  const ChatFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTextFormField(
      radius: 10.r,
      filledColor: Colors.white,
      inputType: TextInputType.text,
      textInputAction: TextInputAction.done,
      hintTxt: AppStrings.search,
      prefixIcon: const SearchIcon(),
    );
  }
}
