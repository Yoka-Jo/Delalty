// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:delalty/core/app_prefs/app_prefs.dart' as _i10;
import 'package:delalty/core/app_prefs/shared_prefs_injectable.dart' as _i47;
import 'package:delalty/core/network/dio_factory.dart' as _i46;
import 'package:delalty/core/user_secure_storage.dart' as _i9;
import 'package:delalty/data/datasources/local_datasource/local_datasource.dart'
    as _i11;
import 'package:delalty/data/datasources/remote_datasource/app_api.dart' as _i4;
import 'package:delalty/data/datasources/remote_datasource/remote_modules.dart'
    as _i45;
import 'package:delalty/data/repository/repository.dart' as _i13;
import 'package:delalty/domain/repository/repository.dart' as _i12;
import 'package:delalty/domain/usecases/add_product_to_favorites_usecase.dart'
    as _i16;
import 'package:delalty/domain/usecases/add_product_to_recently_searched_usecase.dart'
    as _i17;
import 'package:delalty/domain/usecases/apple_login_usecase.dart' as _i18;
import 'package:delalty/domain/usecases/create_product_usecase.dart' as _i19;
import 'package:delalty/domain/usecases/facebook_login_usecase.dart' as _i20;
import 'package:delalty/domain/usecases/get_best_categories_usecase.dart'
    as _i21;
import 'package:delalty/domain/usecases/get_categories_usecase.dart' as _i22;
import 'package:delalty/domain/usecases/get_category_usecase.dart' as _i23;
import 'package:delalty/domain/usecases/get_favorites_usecase.dart' as _i24;
import 'package:delalty/domain/usecases/get_product_comments_usecase.dart'
    as _i25;
import 'package:delalty/domain/usecases/get_product_for_category_usecase.dart'
    as _i26;
import 'package:delalty/domain/usecases/get_product_single_comment_usecase.dart'
    as _i27;
import 'package:delalty/domain/usecases/get_product_usecase.dart' as _i28;
import 'package:delalty/domain/usecases/get_recently_searched_products_usecase.dart'
    as _i29;
import 'package:delalty/domain/usecases/get_seller_products_usecase.dart'
    as _i30;
import 'package:delalty/domain/usecases/get_user_data_usecase.dart' as _i31;
import 'package:delalty/domain/usecases/google_login_usecase.dart' as _i32;
import 'package:delalty/domain/usecases/login_usecase.dart' as _i34;
import 'package:delalty/domain/usecases/register_usecase.dart' as _i36;
import 'package:delalty/domain/usecases/remove_product_from_favorites_usecase.dart'
    as _i37;
import 'package:delalty/domain/usecases/search_for_products_usecase.dart'
    as _i14;
import 'package:delalty/domain/usecases/verify_phone_usecase.dart' as _i15;
import 'package:delalty/presentation/screens/all_departments/cubit/all_departments_cubit.dart'
    as _i3;
import 'package:delalty/presentation/screens/app/cubit/app_cubit.dart' as _i42;
import 'package:delalty/presentation/screens/app/pages/home/cubit/home_cubit.dart'
    as _i33;
import 'package:delalty/presentation/screens/favorite/cubit/favorite_cubit.dart'
    as _i43;
import 'package:delalty/presentation/screens/login/cubit/login_cubit.dart'
    as _i44;
import 'package:delalty/presentation/screens/product/cubit/product_cubit.dart'
    as _i35;
import 'package:delalty/presentation/screens/property_filter/cubit/property_filter_cubit.dart'
    as _i7;
import 'package:delalty/presentation/screens/search/cubit/search_cubit.dart'
    as _i38;
import 'package:delalty/presentation/screens/seller_profile/cubit/seller_profile_cubit.dart'
    as _i39;
import 'package:delalty/presentation/screens/signup/cubit/signup_cubit.dart'
    as _i40;
import 'package:delalty/presentation/screens/verification_code/cubit/verification_code_cubit.dart'
    as _i41;
import 'package:dio/dio.dart' as _i5;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableAppServiceClientModule =
        _$InjectableAppServiceClientModule();
    final injectableDioModule = _$InjectableDioModule();
    final injectableUserSecureStorageModule =
        _$InjectableUserSecureStorageModule();
    final sharedPrefsInjectableModule = _$SharedPrefsInjectableModule();
    gh.factory<_i3.AllDepartmentsCubit>(() => _i3.AllDepartmentsCubit());
    gh.lazySingleton<_i4.AppServiceClient>(
        () => injectableAppServiceClientModule.appServiceClient);
    gh.lazySingleton<_i5.Dio>(() => injectableDioModule.dio);
    gh.lazySingleton<_i6.FlutterSecureStorage>(
        () => injectableUserSecureStorageModule.secureStorage);
    gh.factory<_i7.PropertyFilterCubit>(() => _i7.PropertyFilterCubit());
    await gh.factoryAsync<_i8.SharedPreferences>(
      () => sharedPrefsInjectableModule.prefs,
      preResolve: true,
    );
    gh.factory<_i9.UserSecureStorage>(
        () => _i9.UserSecureStorage(gh<_i6.FlutterSecureStorage>()));
    gh.factory<_i10.AppPreferences>(
        () => _i10.AppPreferences(gh<_i8.SharedPreferences>()));
    gh.factory<_i11.LocalDataSource>(
        () => _i11.LocalDataSource(gh<_i8.SharedPreferences>()));
    gh.factory<_i12.Repository>(() => _i13.RepositoryImpl(
          gh<_i4.AppServiceClient>(),
          gh<_i11.LocalDataSource>(),
        ));
    gh.lazySingleton<_i14.SearchForProductsUseCase>(
        () => _i14.SearchForProductsUseCase(gh<_i12.Repository>()));
    gh.lazySingleton<_i15.VerifyPhoneUseCase>(
        () => _i15.VerifyPhoneUseCase(gh<_i12.Repository>()));
    gh.lazySingleton<_i16.AddProductToFavoritesUseCase>(
        () => _i16.AddProductToFavoritesUseCase(gh<_i12.Repository>()));
    gh.factory<_i17.AddProductToRecentlySearchedUseCase>(
        () => _i17.AddProductToRecentlySearchedUseCase(gh<_i12.Repository>()));
    gh.lazySingleton<_i18.AppleLoginUseCase>(
        () => _i18.AppleLoginUseCase(gh<_i12.Repository>()));
    gh.lazySingleton<_i19.CreateProductUseCase>(
        () => _i19.CreateProductUseCase(gh<_i12.Repository>()));
    gh.lazySingleton<_i20.FacebookLoginUseCase>(
        () => _i20.FacebookLoginUseCase(gh<_i12.Repository>()));
    gh.lazySingleton<_i21.GetBestCategoriesUseCase>(
        () => _i21.GetBestCategoriesUseCase(gh<_i12.Repository>()));
    gh.lazySingleton<_i22.GetCategoriesUseCase>(
        () => _i22.GetCategoriesUseCase(gh<_i12.Repository>()));
    gh.lazySingleton<_i23.GetCategoryUseCase>(
        () => _i23.GetCategoryUseCase(gh<_i12.Repository>()));
    gh.lazySingleton<_i24.GetFavoritesUseCase>(
        () => _i24.GetFavoritesUseCase(gh<_i12.Repository>()));
    gh.lazySingleton<_i25.GetProductCommentsUseCase>(
        () => _i25.GetProductCommentsUseCase(gh<_i12.Repository>()));
    gh.lazySingleton<_i26.GetProductForCategoryUseCase>(
        () => _i26.GetProductForCategoryUseCase(gh<_i12.Repository>()));
    gh.lazySingleton<_i27.GetProductSingleCommentUseCase>(
        () => _i27.GetProductSingleCommentUseCase(gh<_i12.Repository>()));
    gh.lazySingleton<_i28.GetProductUseCase>(
        () => _i28.GetProductUseCase(gh<_i12.Repository>()));
    gh.factory<_i29.GetRecentlySearchedProductsUseCase>(
        () => _i29.GetRecentlySearchedProductsUseCase(gh<_i12.Repository>()));
    gh.lazySingleton<_i30.GetSellerProductsUseCase>(
        () => _i30.GetSellerProductsUseCase(gh<_i12.Repository>()));
    gh.lazySingleton<_i31.GetUserDataUseCase>(
        () => _i31.GetUserDataUseCase(gh<_i12.Repository>()));
    gh.lazySingleton<_i32.GoogleLoginUseCase>(
        () => _i32.GoogleLoginUseCase(gh<_i12.Repository>()));
    gh.factory<_i33.HomeCubit>(() => _i33.HomeCubit(
          gh<_i22.GetCategoriesUseCase>(),
          gh<_i21.GetBestCategoriesUseCase>(),
          gh<_i26.GetProductForCategoryUseCase>(),
          gh<_i23.GetCategoryUseCase>(),
        ));
    gh.lazySingleton<_i34.LoginUseCase>(
        () => _i34.LoginUseCase(gh<_i12.Repository>()));
    gh.factory<_i35.ProductCubit>(() => _i35.ProductCubit(
          gh<_i28.GetProductUseCase>(),
          gh<_i25.GetProductCommentsUseCase>(),
        ));
    gh.lazySingleton<_i36.RegisterUseCase>(
        () => _i36.RegisterUseCase(gh<_i12.Repository>()));
    gh.lazySingleton<_i37.RemoveProductFromFavoritesUseCase>(
        () => _i37.RemoveProductFromFavoritesUseCase(gh<_i12.Repository>()));
    gh.factory<_i38.SearchCubit>(() => _i38.SearchCubit(
          gh<_i14.SearchForProductsUseCase>(),
          gh<_i17.AddProductToRecentlySearchedUseCase>(),
          gh<_i29.GetRecentlySearchedProductsUseCase>(),
          gh<_i23.GetCategoryUseCase>(),
        ));
    gh.factory<_i39.SellerProfileCubit>(() => _i39.SellerProfileCubit(
          gh<_i31.GetUserDataUseCase>(),
          gh<_i30.GetSellerProductsUseCase>(),
        ));
    gh.factory<_i40.SignupCubit>(
        () => _i40.SignupCubit(gh<_i36.RegisterUseCase>()));
    gh.factory<_i41.VerificationCodeCubit>(
        () => _i41.VerificationCodeCubit(gh<_i15.VerifyPhoneUseCase>()));
    gh.factory<_i42.AppCubit>(
        () => _i42.AppCubit(gh<_i31.GetUserDataUseCase>()));
    gh.factory<_i43.FavoriteCubit>(() => _i43.FavoriteCubit(
          gh<_i24.GetFavoritesUseCase>(),
          gh<_i16.AddProductToFavoritesUseCase>(),
          gh<_i37.RemoveProductFromFavoritesUseCase>(),
        ));
    gh.factory<_i44.LoginCubit>(() => _i44.LoginCubit(gh<_i34.LoginUseCase>()));
    return this;
  }
}

class _$InjectableAppServiceClientModule
    extends _i45.InjectableAppServiceClientModule {}

class _$InjectableDioModule extends _i46.InjectableDioModule {}

class _$InjectableUserSecureStorageModule
    extends _i9.InjectableUserSecureStorageModule {}

class _$SharedPrefsInjectableModule extends _i47.SharedPrefsInjectableModule {}
