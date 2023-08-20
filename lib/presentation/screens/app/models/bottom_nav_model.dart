// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:delalty/core/resources/assets_manager.dart';
import 'package:delalty/core/resources/strings_manager.dart';

class BottomNavModel {
  final String title;
  final String icon;
  const BottomNavModel({
    required this.title,
    required this.icon,
  });
}

const List<BottomNavModel> bottomNavModelIcons = [
  BottomNavModel(title: AppStrings.more, icon: ImageAssets.moreNav),
  BottomNavModel(title: AppStrings.chat, icon: ImageAssets.chatNav),
  BottomNavModel(title: AppStrings.myAccount, icon: ImageAssets.profileNav),
  BottomNavModel(title: AppStrings.home, icon: ImageAssets.homeNav),
];
