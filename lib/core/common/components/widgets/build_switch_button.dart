import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/common/components/widgets/simple_text.dart';
import '../../../../core/resources/colors_manager.dart';

class BuildSwitchButton extends StatefulWidget {
  final String title;
  final String switchKey;
  final String icon;
  final bool isSelected;
  final void Function(bool value) onToggle;
  const BuildSwitchButton({
    Key? key,
    required this.title,
    required this.switchKey,
    required this.icon,
    required this.isSelected,
    required this.onToggle,
  }) : super(key: key);

  @override
  State<BuildSwitchButton> createState() => _BuildSwitchButtonState();
}

class _BuildSwitchButtonState extends State<BuildSwitchButton> {
  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((value) {
      sharedPrefs = value;
      setState(() {
        isSelected = sharedPrefs.getBool(widget.switchKey) ?? false;
      });
    });
  }

  late SharedPreferences sharedPrefs;
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: const Color(0xff111111).withOpacity(0.05),
        ),
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.grey7,
      ),
      child: Row(
        children: [
          Container(
            height: 35.h,
            width: 35.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: AppColors.primaryColor,
            ),
            child: Center(
              child: SvgPicture.asset(
                widget.icon,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: 15.w),
          SimpleText(
            widget.title,
            textStyle: TextStyleEnum.poppinsRegular,
            fontSize: 15.sp,
            color: AppColors.black,
          ),
          const Spacer(),
          FlutterSwitch(
            width: 55.w,
            valueFontSize: 25.0,
            height: 30.h,
            borderRadius: 30.0,
            value: isSelected,
            activeColor: AppColors.primaryColor,
            onToggle: (value) async {
              widget.onToggle(value);
              setState(() {
                isSelected = value;
              });
              final sharedPrefs = await SharedPreferences.getInstance();
              await sharedPrefs.setBool(widget.switchKey, value);
            },
          ),
        ],
      ),
    );
  }
}
