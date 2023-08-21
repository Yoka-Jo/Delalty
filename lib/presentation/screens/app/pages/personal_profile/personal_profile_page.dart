import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/widgets.dart';

class PersonalProfilePage extends StatelessWidget {
  const PersonalProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const PersonalProfileImages(),
          const PersonalProfileInfo(),
          SizedBox(height: 40.h),
          const PersonalProfileButtons(),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
