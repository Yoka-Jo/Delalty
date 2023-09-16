import 'dart:convert';

import 'package:delalty/core/models/responses.dart';
import 'package:delalty/core/user_secure_storage.dart';
import 'package:delalty/di.dart';
import 'package:delalty/domain/entities/product_image.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/entities/product.dart';

const String kPrefsIsLightTheme = "is_light_theme";
const String kPrefsKeyIsOnBoardingScreenViewed =
    "PREFS_KEY_IS_ONBOARDING_SCREEN_VIEWED";

const String kPrefsSaveRecentlySearchedProduct =
    "kPrefsSaveRecentlySearchedProduct";

@injectable
class LocalDataSource {
  final SharedPreferences _sharedPreferences;

  LocalDataSource(this._sharedPreferences);

  Future<bool> saveRecentlySearchedProduct(Product product) async {
    ProductResponse productResponse = ProductResponse(
      id: product.id,
      title: product.title,
      description: product.description,
      price: product.price,
      categoryId: product.categoryId,
      values: product.values
          .map((e) => ValueResponse(inputId: e.inputId, value: e.value))
          .toList(),
      images: product.images
          .map((e) => ProductImageResponse(
              id: e.id, extension: e.extension, url: e.url))
          .toList(),
      seller: SellerResponse(
        id: product.seller?.id,
        verified: product.seller?.verified,
        user: UserResponse(
          id: product.seller!.user!.id,
          name: product.seller?.user?.name,
          image: product.seller?.user?.image,
          isAdmin: product.seller?.user?.isAdmin,
          isCompany: product.seller?.user?.isCompany,
        ),
      ),
      visible: product.visible,
      mainImageId: product.mainImageId,
    );

    String? productsJson =
        _sharedPreferences.getString(kPrefsSaveRecentlySearchedProduct);
    late final List<ProductResponse> productsResponse;
    final userId = await getIt<UserSecureStorage>().getUserID();
    if (productsJson == null) {
      productsResponse = [];
    } else {
      productsResponse =
          ((json.decode(productsJson) as Map<String, dynamic>)[userId] as List)
              .map((e) => ProductResponse.fromJson(e))
              .toList();
    }
    if (productsResponse.length == 5) {
      productsResponse.removeAt(0);
    }
    if (productsResponse
        .where((element) => element.id == productResponse.id)
        .isNotEmpty) {
      return true;
    }
    productsResponse.add(productResponse);

    productsJson =
        json.encode({userId: productsResponse.map((e) => e.toJson()).toList()});
    print("productsJson: $productsJson");
    return await _sharedPreferences.setString(
      kPrefsSaveRecentlySearchedProduct,
      productsJson,
    );
  }

  Future<List<Product>> getRecentlySearchedProducts() async {
    final productsJson =
        _sharedPreferences.getString(kPrefsSaveRecentlySearchedProduct);
    if (productsJson == null) {
      return [];
    }
    final userId = await getIt<UserSecureStorage>().getUserID();

    final List<ProductResponse> productsResponse =
        ((json.decode(productsJson) as Map<String, dynamic>)[userId] as List)
            .map((e) => ProductResponse.fromJson(e))
            .toList();

    return productsResponse.map((e) => e.toDomain()).toList();
  }

  Future<bool> saveIsOnBoardingScreenViewed() async {
    return await _sharedPreferences.setBool(
        kPrefsKeyIsOnBoardingScreenViewed, true);
  }

  bool getIsOnBoardingScreenViewed() {
    bool? isOnBoardingScreenViewed =
        _sharedPreferences.getBool(kPrefsKeyIsOnBoardingScreenViewed);
    if (isOnBoardingScreenViewed != null) {
      return isOnBoardingScreenViewed;
    } else {
      return false;
    }
  }

  Future<bool> removeData({
    required String key,
  }) async {
    return await _sharedPreferences.remove(key);
  }

  bool containsKey({required String key}) {
    return _sharedPreferences.containsKey(key);
  }
}
