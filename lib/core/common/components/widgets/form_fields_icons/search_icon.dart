import '../../../../resources/assets_manager.dart';
import 'package:flutter/material.dart';

import '../build_icon.dart';

class SearchIcon extends StatelessWidget {
  const SearchIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BuildSuffixIcon(asset: ImageAssets.search);
  }
}
