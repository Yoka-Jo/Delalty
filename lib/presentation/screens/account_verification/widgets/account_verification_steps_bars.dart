part of 'widgets.dart';

class AccountVerificationStepsBars extends StatelessWidget {
  final bool firstStepFinished;
  const AccountVerificationStepsBars({
    super.key,
    this.firstStepFinished = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 8,
            decoration: BoxDecoration(
              color: AppColors.grey8,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        SizedBox(width: 20.w),
        Expanded(
          child: Container(
            height: 8,
            decoration: BoxDecoration(
              color:
                  firstStepFinished ? AppColors.primaryColor : AppColors.grey8,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
