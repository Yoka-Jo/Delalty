part of 'widgets.dart';

class ChatFormField extends StatelessWidget {
  const ChatFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTextFormField(
      radius: 10.r,
      onChangedFunction: (value) =>
          ChatCubit.get(context).search(value, context),
      padding: EdgeInsets.zero,
      filledColor: Colors.white,
      inputType: TextInputType.text,
      textInputAction: TextInputAction.done,
      hintTxt: AppStrings.search.tr(context: context),
      prefixIcon: const SearchIcon(),
    );
  }
}
