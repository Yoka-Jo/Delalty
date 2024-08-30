part of 'widgets.dart';

class VerificationCodeOtp extends StatefulWidget {
  const VerificationCodeOtp({
    Key? key,
  }) : super(key: key);

  @override
  State<VerificationCodeOtp> createState() => _VerificationCodeOtpState();
}

class _VerificationCodeOtpState extends State<VerificationCodeOtp> {
  List<TextEditingController> controllers =
      List.generate(6, (index) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());
  int currentField = 0;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < focusNodes.length; i++) {
      focusNodes[i].addListener(() {
        if (focusNodes[i].hasFocus) {
          setState(() {
            currentField = i;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = VerificationCodeCubit.get(context);
    return RawKeyboardListener(
      focusNode: FocusNode(),
      onKey: (RawKeyEvent event) {
        if (event is RawKeyDownEvent &&
            event.logicalKey == LogicalKeyboardKey.backspace) {
          // Check if the current field has text
          if (controllers[currentField].text.isNotEmpty) {
            setState(() {
              controllers[currentField].text = '';
            });
          } else if (currentField > 0) {
            // Move focus to the previous field
            setState(() {
              currentField--;
              FocusScope.of(context).requestFocus(focusNodes[currentField]);
            });
            controllers[currentField].text = '';
          }
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Wrap(
            direction: Axis.horizontal,
            spacing: 10.w,
            runSpacing: 10.w,
            alignment: WrapAlignment.center,
            children: List.generate(
              6,
              (index) {
                return SizedBox(
                  width: 60.w,
                  child: PinCodeTextField(
                    controller: controllers[index],
                    focusNode: focusNodes[index],
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    autoDismissKeyboard: index == controllers.length - 1,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    cursorColor: AppColors.primaryColor,
                    appContext: context,
                    length: 1, // Set the length to 1 for individual pin fields
                    textStyle: getRegularStyle(
                      color: Colors.black,
                      family: FontFamilies.montserrat,
                      fontSize: 25.sp,
                    ),
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      activeBorderWidth: 1,
                      shape: PinCodeFieldShape.circle,
                      fieldHeight: 60.w,
                      fieldWidth: 60.w,
                      errorBorderColor: Colors.red,
                      activeFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                      activeColor: AppColors.primaryColor,
                      inactiveColor: AppColors.grey,
                      selectedColor: AppColors.primaryColor,
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    errorAnimationController: cubit.errorAnimationController,
                    onChanged: (value) {
                      cubit.validateInput(value);

                      if (value.length == 1 && index < 5) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    onCompleted: (value) {
                      final String otp =
                          controllers.map((e) => e.text).join('');
                      if (index == controllers.length - 1 && otp.length == 6) {
                        cubit.onVerify(otp, context);
                      }
                    },
                    beforeTextPaste: (text) {
                      return true;
                    },
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 38.h),
          BlocBuilder<VerificationCodeCubit, VerificationCodeState>(
            builder: (context, state) {
              return buildTime(context);
            },
          ),
        ],
      ),
    );
  }

  Widget buildTime(BuildContext context) {
    final cubit = VerificationCodeCubit.get(context);
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final duration = cubit.otpDuration;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    final stringMinutes = twoDigits(minutes);
    final stringSeconds = twoDigits(seconds);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SimpleText(
          AppStrings.expiresAfter.tr(context: context),
          textStyle: TextStyleEnum.montserratMedium,
          fontSize: 15.sp,
        ),
        SimpleText(
          " : ${stringMinutes != '00' && stringSeconds != '00' ? '$stringMinutes.$stringSeconds' : '0'}",
          color: AppColors.primaryColor,
          textStyle: TextStyleEnum.montserratMedium,
          fontSize: 15.sp,
        ),
      ],
    );
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }

    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }
}
