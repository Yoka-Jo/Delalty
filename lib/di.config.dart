// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:delalty/core/app_prefs/app_prefs.dart' as _i11;
import 'package:delalty/core/app_prefs/shared_prefs_injectable.dart' as _i55;
import 'package:delalty/core/network/dio_factory.dart' as _i54;
import 'package:delalty/core/user_secure_storage.dart' as _i10;
import 'package:delalty/data/datasources/local_datasource/local_datasource.dart'
    as _i12;
import 'package:delalty/data/datasources/remote_datasource/app_api.dart' as _i5;
import 'package:delalty/data/datasources/remote_datasource/remote_modules.dart'
    as _i53;
import 'package:delalty/data/repository/repository.dart' as _i14;
import 'package:delalty/domain/repository/repository.dart' as _i13;
import 'package:delalty/domain/usecases/add_product_to_favorites_usecase.dart'
    as _i17;
import 'package:delalty/domain/usecases/add_product_to_recently_searched_usecase.dart'
    as _i18;
import 'package:delalty/domain/usecases/apple_login_usecase.dart' as _i19;
import 'package:delalty/domain/usecases/change_relationship_type_usecase.dart'
    as _i20;
import 'package:delalty/domain/usecases/create_chat_usecase.dart' as _i21;
import 'package:delalty/domain/usecases/create_message_usecase.dart' as _i22;
import 'package:delalty/domain/usecases/create_product_usecase.dart' as _i23;
import 'package:delalty/domain/usecases/facebook_login_usecase.dart' as _i24;
import 'package:delalty/domain/usecases/get_best_categories_usecase.dart'
    as _i25;
import 'package:delalty/domain/usecases/get_categories_usecase.dart' as _i26;
import 'package:delalty/domain/usecases/get_category_usecase.dart' as _i27;
import 'package:delalty/domain/usecases/get_favorites_usecase.dart' as _i28;
import 'package:delalty/domain/usecases/get_messages_usecase.dart' as _i29;
import 'package:delalty/domain/usecases/get_product_comments_usecase.dart'
    as _i30;
import 'package:delalty/domain/usecases/get_product_for_category_usecase.dart'
    as _i31;
import 'package:delalty/domain/usecases/get_product_single_comment_usecase.dart'
    as _i32;
import 'package:delalty/domain/usecases/get_product_usecase.dart' as _i33;
import 'package:delalty/domain/usecases/get_recently_searched_products_usecase.dart'
    as _i34;
import 'package:delalty/domain/usecases/get_seller_products_usecase.dart'
    as _i35;
import 'package:delalty/domain/usecases/get_user_data_usecase.dart' as _i36;
import 'package:delalty/domain/usecases/google_login_usecase.dart' as _i37;
import 'package:delalty/domain/usecases/login_usecase.dart' as _i39;
import 'package:delalty/domain/usecases/register_usecase.dart' as _i42;
import 'package:delalty/domain/usecases/remove_product_from_favorites_usecase.dart'
    as _i43;
import 'package:delalty/domain/usecases/search_for_products_usecase.dart'
    as _i15;
import 'package:delalty/domain/usecases/verify_phone_usecase.dart' as _i16;
import 'package:delalty/presentation/screens/account_verification/cubit/account_verification_cubit.dart'
    as _i3;
import 'package:delalty/presentation/screens/all_departments/cubit/all_departments_cubit.dart'
    as _i4;
import 'package:delalty/presentation/screens/app/cubit/app_cubit.dart' as _i49;
import 'package:delalty/presentation/screens/app/pages/home/cubit/home_cubit.dart'
    as _i38;
import 'package:delalty/presentation/screens/conversation/cubit/conversation_cubit.dart'
    as _i50;
import 'package:delalty/presentation/screens/favorite/cubit/favorite_cubit.dart'
    as _i51;
import 'package:delalty/presentation/screens/login/cubit/login_cubit.dart'
    as _i52;
import 'package:delalty/presentation/screens/product/cubit/product_cubit.dart'
    as _i40;
import 'package:delalty/presentation/screens/prohibited_persons/cubit/prohibited_persons_cubit.dart'
    as _i41;
import 'package:delalty/presentation/screens/property_filter/cubit/property_filter_cubit.dart'
    as _i8;
import 'package:delalty/presentation/screens/search/cubit/search_cubit.dart'
    as _i44;
import 'package:delalty/presentation/screens/seller_profile/cubit/seller_profile_cubit.dart'
    as _i45;
import 'package:delalty/presentation/screens/signup/cubit/signup_cubit.dart'
    as _i46;
import 'package:delalty/presentation/screens/verification_code/cubit/verification_code_cubit.dart'
    as _i47;
import 'package:delalty/presentation/screens/view_product_section/cubit/view_product_section_cubit.dart'
    as _i48;
import 'package:dio/dio.dart' as _i6;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i9;

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
    gh.lazySingleton<_i6.Dio>(() => injectableDioModule.dio);
    gh.lazySingleton<_i7.FlutterSecureStorage>(
        () => injectableUserSecureStorageModule.secureStorage);
    gh.factory<_i8.PropertyFilterCubit>(() => _i8.PropertyFilterCubit());
    await gh.factoryAsync<_i9.SharedPreferences>(
      () => sharedPrefsInjectableModule.prefs,
      preResolve: true,
    );
    gh.factory<_i10.UserSecureStorage>(
        () => _i10.UserSecureStorage(gh<_i7.FlutterSecureStorage>()));
    gh.factory<_i11.AppPreferences>(
        () => _i11.AppPreferences(gh<_i9.SharedPreferences>()));
    gh.factory<_i12.LocalDataSource>(
        () => _i12.LocalDataSource(gh<_i9.SharedPreferences>()));
    gh.factory<_i13.Repository>(() => _i14.RepositoryImpl(
          gh<_i5.AppServiceClient>(),
          gh<_i12.LocalDataSource>(),
        ));
    gh.lazySingleton<_i15.SearchForProductsUseCase>(
        () => _i15.SearchForProductsUseCase(gh<_i13.Repository>()));
    gh.lazySingleton<_i16.VerifyPhoneUseCase>(
        () => _i16.VerifyPhoneUseCase(gh<_i13.Repository>()));
    gh.lazySingleton<_i17.AddProductToFavoritesUseCase>(
        () => _i17.AddProductToFavoritesUseCase(gh<_i13.Repository>()));
    gh.factory<_i18.AddProductToRecentlySearchedUseCase>(
        () => _i18.AddProductToRecentlySearchedUseCase(gh<_i13.Repository>()));
    gh.lazySingleton<_i19.AppleLoginUseCase>(
        () => _i19.AppleLoginUseCase(gh<_i13.Repository>()));
    gh.lazySingleton<_i20.ChangeRelationshipTypeUseCase>(
        () => _i20.ChangeRelationshipTypeUseCase(gh<_i13.Repository>()));
    gh.lazySingleton<_i21.CreateChatUseCase>(
        () => _i21.CreateChatUseCase(gh<_i13.Repository>()));
    gh.lazySingleton<_i22.CreateMessageUseCase>(
        () => _i22.CreateMessageUseCase(gh<_i13.Repository>()));
    gh.lazySingleton<_i23.CreateProductUseCase>(
        () => _i23.CreateProductUseCase(gh<_i13.Repository>()));
    gh.lazySingleton<_i24.FacebookLoginUseCase>(
        () => _i24.FacebookLoginUseCase(gh<_i13.Repository>()));
    gh.lazySingleton<_i25.GetBestCategoriesUseCase>(
        () => _i25.GetBestCategoriesUseCase(gh<_i13.Repository>()));
    gh.lazySingleton<_i26.GetCategoriesUseCase>(
        () => _i26.GetCategoriesUseCase(gh<_i13.Repository>()));
    gh.lazySingleton<_i27.GetCategoryUseCase>(
        () => _i27.GetCategoryUseCase(gh<_i13.Repository>()));
    gh.lazySingleton<_i28.GetFavoritesUseCase>(
        () => _i28.GetFavoritesUseCase(gh<_i13.Repository>()));
    gh.lazySingleton<_i29.GetMessagesUseCase>(
        () => _i29.GetMessagesUseCase(gh<_i13.Repository>()));
    gh.lazySingleton<_i30.GetProductCommentsUseCase>(
        () => _i30.GetProductCommentsUseCase(gh<_i13.Repository>()));
    gh.lazySingleton<_i31.GetProductForCategoryUseCase>(
        () => _i31.GetProductForCategoryUseCase(gh<_i13.Repository>()));
    gh.lazySingleton<_i32.GetProductSingleCommentUseCase>(
        () => _i32.GetProductSingleCommentUseCase(gh<_i13.Repository>()));
    gh.lazySingleton<_i33.GetProductUseCase>(
        () => _i33.GetProductUseCase(gh<_i13.Repository>()));
    gh.factory<_i34.GetRecentlySearchedProductsUseCase>(
        () => _i34.GetRecentlySearchedProductsUseCase(gh<_i13.Repository>()));
    gh.lazySingleton<_i35.GetSellerProductsUseCase>(
        () => _i35.GetSellerProductsUseCase(gh<_i13.Repository>()));
    gh.lazySingleton<_i36.GetUserDataUseCase>(
        () => _i36.GetUserDataUseCase(gh<_i13.Repository>()));
    gh.lazySingleton<_i37.GoogleLoginUseCase>(
        () => _i37.GoogleLoginUseCase(gh<_i13.Repository>()));
    gh.factory<_i38.HomeCubit>(() => _i38.HomeCubit(
          gh<_i26.GetCategoriesUseCase>(),
          gh<_i25.GetBestCategoriesUseCase>(),
          gh<_i31.GetProductForCategoryUseCase>(),
          gh<_i27.GetCategoryUseCase>(),
        ));
    gh.lazySingleton<_i39.LoginUseCase>(
        () => _i39.LoginUseCase(gh<_i13.Repository>()));
    gh.factory<_i40.ProductCubit>(() => _i40.ProductCubit(
          gh<_i33.GetProductUseCase>(),
          gh<_i30.GetProductCommentsUseCase>(),
          gh<_i21.CreateChatUseCase>(),
          gh<_i20.ChangeRelationshipTypeUseCase>(),
        ));
    gh.factory<_i41.ProhibitedPersonsCubit>(() =>
        _i41.ProhibitedPersonsCubit(gh<_i20.ChangeRelationshipTypeUseCase>()));
    gh.lazySingleton<_i42.RegisterUseCase>(
        () => _i42.RegisterUseCase(gh<_i13.Repository>()));
    gh.lazySingleton<_i43.RemoveProductFromFavoritesUseCase>(
        () => _i43.RemoveProductFromFavoritesUseCase(gh<_i13.Repository>()));
    gh.factory<_i44.SearchCubit>(() => _i44.SearchCubit(
          gh<_i15.SearchForProductsUseCase>(),
          gh<_i18.AddProductToRecentlySearchedUseCase>(),
          gh<_i34.GetRecentlySearchedProductsUseCase>(),
          gh<_i27.GetCategoryUseCase>(),
        ));
    gh.factory<_i45.SellerProfileCubit>(() => _i45.SellerProfileCubit(
          gh<_i36.GetUserDataUseCase>(),
          gh<_i35.GetSellerProductsUseCase>(),
          gh<_i20.ChangeRelationshipTypeUseCase>(),
        ));
    gh.factory<_i46.SignupCubit>(
        () => _i46.SignupCubit(gh<_i42.RegisterUseCase>()));
    gh.factory<_i47.VerificationCodeCubit>(
        () => _i47.VerificationCodeCubit(gh<_i16.VerifyPhoneUseCase>()));
    gh.factory<_i48.ViewProductSectionCubit>(() =>
        _i48.ViewProductSectionCubit(gh<_i31.GetProductForCategoryUseCase>()));
    gh.factory<_i49.AppCubit>(
        () => _i49.AppCubit(gh<_i36.GetUserDataUseCase>()));
    gh.factory<_i50.ConversationCubit>(() => _i50.ConversationCubit(
          gh<_i22.CreateMessageUseCase>(),
          gh<_i29.GetMessagesUseCase>(),
        ));
    gh.factory<_i51.FavoriteCubit>(() => _i51.FavoriteCubit(
          gh<_i28.GetFavoritesUseCase>(),
          gh<_i17.AddProductToFavoritesUseCase>(),
          gh<_i43.RemoveProductFromFavoritesUseCase>(),
        ));
    gh.factory<_i52.LoginCubit>(() => _i52.LoginCubit(gh<_i39.LoginUseCase>()));
    return this;
  }
}

class _$InjectableAppServiceClientModule
    extends _i53.InjectableAppServiceClientModule {}

class _$InjectableDioModule extends _i54.InjectableDioModule {}

class _$InjectableUserSecureStorageModule
    extends _i10.InjectableUserSecureStorageModule {}

class _$SharedPrefsInjectableModule extends _i55.SharedPrefsInjectableModule {}
