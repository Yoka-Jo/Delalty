// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'widgets.dart';

class OnBoardingBottomSheet extends StatefulWidget {
  const OnBoardingBottomSheet({
    Key? key,
    required this.onTap,
  }) : super(key: key);
  final VoidCallback onTap;

  @override
  State<OnBoardingBottomSheet> createState() => _OnBoardingBottomSheetState();
}

class _OnBoardingBottomSheetState extends State<OnBoardingBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<OnboardingCubit, OnboardingState>(
            builder: (context, state) {
              return DotsIndicator(
                dotsCount: models.length,
                position: OnboardingCubit.get(context).currentPosition,
                decorator: const DotsDecorator(
                  size: Size.square(9.0),
                  activeSize: Size(18.0, 9.0),
                  activeColor: Colors.black,
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: widget.onTap,
              child: Container(
                margin: EdgeInsets.only(right: 16.w, bottom: 30.h),
                height: 50.w,
                width: 50.w,
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Colors.black.withOpacity(0.18), width: 0.5),
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 25.r,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 65.h),
        ],
      ),
    );
  }
}
