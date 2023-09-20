// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:delalty/core/app_prefs/app_prefs.dart' as _i12;
import 'package:delalty/core/app_prefs/shared_prefs_injectable.dart' as _i53;
import 'package:delalty/core/network/dio_factory.dart' as _i52;
import 'package:delalty/core/user_secure_storage.dart' as _i11;
import 'package:delalty/data/datasources/local_datasource/local_datasource.dart'
    as _i13;
import 'package:delalty/data/datasources/remote_datasource/app_api.dart' as _i5;
import 'package:delalty/data/datasources/remote_datasource/remote_modules.dart'
    as _i51;
import 'package:delalty/data/repository/repository.dart' as _i15;
import 'package:delalty/domain/repository/repository.dart' as _i14;
import 'package:delalty/domain/usecases/add_product_to_favorites_usecase.dart'
    as _i18;
import 'package:delalty/domain/usecases/add_product_to_recently_searched_usecase.dart'
    as _i19;
import 'package:delalty/domain/usecases/apple_login_usecase.dart' as _i20;
import 'package:delalty/domain/usecases/change_relationship_type_usecase.dart'
    as _i21;
import 'package:delalty/domain/usecases/create_chat_usecase.dart' as _i22;
import 'package:delalty/domain/usecases/create_product_usecase.dart' as _i23;
import 'package:delalty/domain/usecases/facebook_login_usecase.dart' as _i24;
import 'package:delalty/domain/usecases/get_best_categories_usecase.dart'
    as _i25;
import 'package:delalty/domain/usecases/get_categories_usecase.dart' as _i26;
import 'package:delalty/domain/usecases/get_category_usecase.dart' as _i27;
import 'package:delalty/domain/usecases/get_favorites_usecase.dart' as _i28;
import 'package:delalty/domain/usecases/get_product_comments_usecase.dart'
    as _i29;
import 'package:delalty/domain/usecases/get_product_for_category_usecase.dart'
    as _i30;
import 'package:delalty/domain/usecases/get_product_single_comment_usecase.dart'
    as _i31;
import 'package:delalty/domain/usecases/get_product_usecase.dart' as _i32;
import 'package:delalty/domain/usecases/get_recently_searched_products_usecase.dart'
    as _i33;
import 'package:delalty/domain/usecases/get_seller_products_usecase.dart'
    as _i34;
import 'package:delalty/domain/usecases/get_user_data_usecase.dart' as _i35;
import 'package:delalty/domain/usecases/google_login_usecase.dart' as _i36;
import 'package:delalty/domain/usecases/login_usecase.dart' as _i38;
import 'package:delalty/domain/usecases/register_usecase.dart' as _i41;
import 'package:delalty/domain/usecases/remove_product_from_favorites_usecase.dart'
    as _i42;
import 'package:delalty/domain/usecases/search_for_products_usecase.dart'
    as _i16;
import 'package:delalty/domain/usecases/verify_phone_usecase.dart' as _i17;
import 'package:delalty/presentation/screens/account_verification/cubit/account_verification_cubit.dart'
    as _i3;
import 'package:delalty/presentation/screens/all_departments/cubit/all_departments_cubit.dart'
    as _i4;
import 'package:delalty/presentation/screens/app/cubit/app_cubit.dart' as _i48;
import 'package:delalty/presentation/screens/app/pages/home/cubit/home_cubit.dart'
    as _i37;
import 'package:delalty/presentation/screens/conversation/cubit/conversation_cubit.dart'
    as _i6;
import 'package:delalty/presentation/screens/favorite/cubit/favorite_cubit.dart'
    as _i49;
import 'package:delalty/presentation/screens/login/cubit/login_cubit.dart'
    as _i50;
import 'package:delalty/presentation/screens/product/cubit/product_cubit.dart'
    as _i39;
import 'package:delalty/presentation/screens/prohibited_persons/cubit/prohibited_persons_cubit.dart'
    as _i40;
import 'package:delalty/presentation/screens/property_filter/cubit/property_filter_cubit.dart'
    as _i9;
import 'package:delalty/presentation/screens/search/cubit/search_cubit.dart'
    as _i43;
import 'package:delalty/presentation/screens/seller_profile/cubit/seller_profile_cubit.dart'
    as _i44;
import 'package:delalty/presentation/screens/signup/cubit/signup_cubit.dart'
    as _i45;
import 'package:delalty/presentation/screens/verification_code/cubit/verification_code_cubit.dart'
    as _i46;
import 'package:delalty/presentation/screens/view_product_section/cubit/view_product_section_cubit.dart'
    as _i47;
import 'package:dio/dio.dart' as _i7;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i10;

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
    gh.factory<_i3.AccountVerificationCubit>(
        () => _i3.AccountVerificationCubit());
    gh.factory<_i4.AllDepartmentsCubit>(() => _i4.AllDepartmentsCubit());
    gh.lazySingleton<_i5.AppServiceClient>(
        () => injectableAppServiceClientModule.appServiceClient);
    gh.factory<_i6.ConversationCubit>(() => _i6.ConversationCubit());
    gh.lazySingleton<_i7.Dio>(() => injectableDioModule.dio);
    gh.lazySingleton<_i8.FlutterSecureStorage>(
        () => injectableUserSecureStorageModule.secureStorage);
    gh.factory<_i9.PropertyFilterCubit>(() => _i9.PropertyFilterCubit());
    await gh.factoryAsync<_i10.SharedPreferences>(
      () => sharedPrefsInjectableModule.prefs,
      preResolve: true,
    );
    gh.factory<_i11.UserSecureStorage>(
        () => _i11.UserSecureStorage(gh<_i8.FlutterSecureStorage>()));
    gh.factory<_i12.AppPreferences>(
        () => _i12.AppPreferences(gh<_i10.SharedPreferences>()));
    gh.factory<_i13.LocalDataSource>(
        () => _i13.LocalDataSource(gh<_i10.SharedPreferences>()));
    gh.factory<_i14.Repository>(() => _i15.RepositoryImpl(
          gh<_i5.AppServiceClient>(),
          gh<_i13.LocalDataSource>(),
        ));
    gh.lazySingleton<_i16.SearchForProductsUseCase>(
        () => _i16.SearchForProductsUseCase(gh<_i14.Repository>()));
    gh.lazySingleton<_i17.VerifyPhoneUseCase>(
        () => _i17.VerifyPhoneUseCase(gh<_i14.Repository>()));
    gh.lazySingleton<_i18.AddProductToFavoritesUseCase>(
        () => _i18.AddProductToFavoritesUseCase(gh<_i14.Repository>()));
    gh.factory<_i19.AddProductToRecentlySearchedUseCase>(
        () => _i19.AddProductToRecentlySearchedUseCase(gh<_i14.Repository>()));
    gh.lazySingleton<_i20.AppleLoginUseCase>(
        () => _i20.AppleLoginUseCase(gh<_i14.Repository>()));
    gh.lazySingleton<_i21.ChangeRelationshipTypeUseCase>(
        () => _i21.ChangeRelationshipTypeUseCase(gh<_i14.Repository>()));
    gh.lazySingleton<_i22.CreateChatUseCase>(
        () => _i22.CreateChatUseCase(gh<_i14.Repository>()));
    gh.lazySingleton<_i23.CreateProductUseCase>(
        () => _i23.CreateProductUseCase(gh<_i14.Repository>()));
    gh.lazySingleton<_i24.FacebookLoginUseCase>(
        () => _i24.FacebookLoginUseCase(gh<_i14.Repository>()));
    gh.lazySingleton<_i25.GetBestCategoriesUseCase>(
        () => _i25.GetBestCategoriesUseCase(gh<_i14.Repository>()));
    gh.lazySingleton<_i26.GetCategoriesUseCase>(
        () => _i26.GetCategoriesUseCase(gh<_i14.Repository>()));
    gh.lazySingleton<_i27.GetCategoryUseCase>(
        () => _i27.GetCategoryUseCase(gh<_i14.Repository>()));
    gh.lazySingleton<_i28.GetFavoritesUseCase>(
        () => _i28.GetFavoritesUseCase(gh<_i14.Repository>()));
    gh.lazySingleton<_i29.GetProductCommentsUseCase>(
        () => _i29.GetProductCommentsUseCase(gh<_i14.Repository>()));
    gh.lazySingleton<_i30.GetProductForCategoryUseCase>(
        () => _i30.GetProductForCategoryUseCase(gh<_i14.Repository>()));
    gh.lazySingleton<_i31.GetProductSingleCommentUseCase>(
        () => _i31.GetProductSingleCommentUseCase(gh<_i14.Repository>()));
    gh.lazySingleton<_i32.GetProductUseCase>(
        () => _i32.GetProductUseCase(gh<_i14.Repository>()));
    gh.factory<_i33.GetRecentlySearchedProductsUseCase>(
        () => _i33.GetRecentlySearchedProductsUseCase(gh<_i14.Repository>()));
    gh.lazySingleton<_i34.GetSellerProductsUseCase>(
        () => _i34.GetSellerProductsUseCase(gh<_i14.Repository>()));
    gh.lazySingleton<_i35.GetUserDataUseCase>(
        () => _i35.GetUserDataUseCase(gh<_i14.Repository>()));
    gh.lazySingleton<_i36.GoogleLoginUseCase>(
        () => _i36.GoogleLoginUseCase(gh<_i14.Repository>()));
    gh.factory<_i37.HomeCubit>(() => _i37.HomeCubit(
          gh<_i26.GetCategoriesUseCase>(),
          gh<_i25.GetBestCategoriesUseCase>(),
          gh<_i30.GetProductForCategoryUseCase>(),
          gh<_i27.GetCategoryUseCase>(),
        ));
    gh.lazySingleton<_i38.LoginUseCase>(
        () => _i38.LoginUseCase(gh<_i14.Repository>()));
    gh.factory<_i39.ProductCubit>(() => _i39.ProductCubit(
          gh<_i32.GetProductUseCase>(),
          gh<_i29.GetProductCommentsUseCase>(),
          gh<_i22.CreateChatUseCase>(),
          gh<_i21.ChangeRelationshipTypeUseCase>(),
        ));
    gh.factory<_i40.ProhibitedPersonsCubit>(() =>
        _i40.ProhibitedPersonsCubit(gh<_i21.ChangeRelationshipTypeUseCase>()));
    gh.lazySingleton<_i41.RegisterUseCase>(
        () => _i41.RegisterUseCase(gh<_i14.Repository>()));
    gh.lazySingleton<_i42.RemoveProductFromFavoritesUseCase>(
        () => _i42.RemoveProductFromFavoritesUseCase(gh<_i14.Repository>()));
    gh.factory<_i43.SearchCubit>(() => _i43.SearchCubit(
          gh<_i16.SearchForProductsUseCase>(),
          gh<_i19.AddProductToRecentlySearchedUseCase>(),
          gh<_i33.GetRecentlySearchedProductsUseCase>(),
          gh<_i27.GetCategoryUseCase>(),
        ));
    gh.factory<_i44.SellerProfileCubit>(() => _i44.SellerProfileCubit(
          gh<_i35.GetUserDataUseCase>(),
          gh<_i34.GetSellerProductsUseCase>(),
          gh<_i21.ChangeRelationshipTypeUseCase>(),
        ));
    gh.factory<_i45.SignupCubit>(
        () => _i45.SignupCubit(gh<_i41.RegisterUseCase>()));
    gh.factory<_i46.VerificationCodeCubit>(
        () => _i46.VerificationCodeCubit(gh<_i17.VerifyPhoneUseCase>()));
    gh.factory<_i47.ViewProductSectionCubit>(() =>
        _i47.ViewProductSectionCubit(gh<_i30.GetProductForCategoryUseCase>()));
    gh.factory<_i48.AppCubit>(
        () => _i48.AppCubit(gh<_i35.GetUserDataUseCase>()));
    gh.factory<_i49.FavoriteCubit>(() => _i49.FavoriteCubit(
          gh<_i28.GetFavoritesUseCase>(),
          gh<_i18.AddProductToFavoritesUseCase>(),
          gh<_i42.RemoveProductFromFavoritesUseCase>(),
        ));
    gh.factory<_i50.LoginCubit>(() => _i50.LoginCubit(gh<_i38.LoginUseCase>()));
    return this;
  }
}

class _$InjectableAppServiceClientModule
    extends _i51.InjectableAppServiceClientModule {}

class _$InjectableDioModule extends _i52.InjectableDioModule {}

class _$InjectableUserSecureStorageModule
    extends _i11.InjectableUserSecureStorageModule {}

class _$SharedPrefsInjectableModule extends _i53.SharedPrefsInjectableModule {}
