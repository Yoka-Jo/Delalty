import 'package:delalty/core/resources/assets_manager.dart';
import 'package:flutter/material.dart';

import '../build_icon.dart';

class AttachmentIcon extends StatelessWidget {
  const AttachmentIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BuildSuffixIcon(asset: ImageAssets.attachment);
  }
}
