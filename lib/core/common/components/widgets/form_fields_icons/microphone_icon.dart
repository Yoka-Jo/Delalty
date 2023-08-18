import 'package:delalty/core/resources/assets_manager.dart';
import 'package:flutter/material.dart';

import '../build_icon.dart';

class MicrophoneIcon extends StatelessWidget {
  const MicrophoneIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BuildSuffixIcon(asset: ImageAssets.microphone);
  }
}
