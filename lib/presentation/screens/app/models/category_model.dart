// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:delalty/core/resources/assets_manager.dart';
import 'package:delalty/core/resources/strings_manager.dart';

class CategoryModel {
  final String title;
  final String image;
  const CategoryModel({
    required this.title,
    required this.image,
  });
}

const List<CategoryModel> categories = [
  CategoryModel(title: AppStrings.all, image: ImageAssets.all),
  CategoryModel(title: 'Vehicles', image: ImageAssets.vehicles),
  CategoryModel(title: 'Mobiles', image: ImageAssets.mobiles),
  CategoryModel(title: 'Electronics', image: ImageAssets.electronics),
  CategoryModel(title: 'Furniture', image: ImageAssets.furniture),
];

const List<CategoryModel> bestCategories = [
  CategoryModel(
    title: 'Vehicles',
    image:
        'https://images.pexels.com/photos/919073/pexels-photo-919073.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  ),
  CategoryModel(
      title: 'Electronics',
      image:
          'https://images.pexels.com/photos/5825422/pexels-photo-5825422.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
  CategoryModel(
      title: 'Real Estate',
      image:
          'https://images.pexels.com/photos/210538/pexels-photo-210538.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
  CategoryModel(
      title: 'Mobiles',
      image:
          'https://images.pexels.com/photos/404280/pexels-photo-404280.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
];

const trendingCategories = bestCategories;
