import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/strings_manager.dart';

class BottomSheetElementModel {
  final String title;
  final String image;
  BottomSheetElementModel({
    required this.title,
    required this.image,
  });
}

List<BottomSheetElementModel> elements = [
  BottomSheetElementModel(
    title: AppStrings.sharingProfile,
    image: ImageAssets.share,
  ),
  BottomSheetElementModel(
    title: AppStrings.reportThisUser,
    image: ImageAssets.userReport,
  ),
  BottomSheetElementModel(
    title: AppStrings.blockUser,
    image: ImageAssets.userBlock,
  ),
];
