// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:delalty/core/app_prefs/app_prefs.dart' as _i15;
import 'package:delalty/core/app_prefs/shared_prefs_injectable.dart' as _i42;
import 'package:delalty/core/network/dio_factory.dart' as _i41;
import 'package:delalty/core/user_secure_storage.dart' as _i12;
import 'package:delalty/data/datasources/local_datasource/local_datasource.dart'
    as _i30;
import 'package:delalty/data/datasources/remote_datasource/app_api.dart' as _i4;
import 'package:delalty/data/datasources/remote_datasource/remote_modules.dart'
    as _i40;
import 'package:delalty/data/repository/repository.dart' as _i9;
import 'package:delalty/domain/repository/repository.dart' as _i8;
import 'package:delalty/domain/usecases/add_product_to_favorites_usecase.dart'
    as _i14;
import 'package:delalty/domain/usecases/apple_login_usecase.dart' as _i16;
import 'package:delalty/domain/usecases/create_product_usecase.dart' as _i17;
import 'package:delalty/domain/usecases/facebook_login_usecase.dart' as _i18;
import 'package:delalty/domain/usecases/get_best_categories_usecase.dart'
    as _i19;
import 'package:delalty/domain/usecases/get_categories_usecase.dart' as _i20;
import 'package:delalty/domain/usecases/get_category_usecase.dart' as _i21;
import 'package:delalty/domain/usecases/get_favorites_usecase.dart' as _i22;
import 'package:delalty/domain/usecases/get_product_comments_usecase.dart'
    as _i23;
import 'package:delalty/domain/usecases/get_product_for_category_usecase.dart'
    as _i24;
import 'package:delalty/domain/usecases/get_product_single_comment_usecase.dart'
    as _i25;
import 'package:delalty/domain/usecases/get_product_usecase.dart' as _i26;
import 'package:delalty/domain/usecases/get_user_data_usecase.dart' as _i27;
import 'package:delalty/domain/usecases/google_login_usecase.dart' as _i28;
import 'package:delalty/domain/usecases/login_usecase.dart' as _i31;
import 'package:delalty/domain/usecases/register_usecase.dart' as _i33;
import 'package:delalty/domain/usecases/remove_product_from_favorites_usecase.dart'
    as _i34;
import 'package:delalty/domain/usecases/verify_phone_usecase.dart' as _i13;
import 'package:delalty/presentation/screens/all_departments/cubit/all_departments_cubit.dart'
    as _i3;
import 'package:delalty/presentation/screens/app/cubit/app_cubit.dart' as _i37;
import 'package:delalty/presentation/screens/app/pages/home/cubit/home_cubit.dart'
    as _i29;
import 'package:delalty/presentation/screens/favorite/cubit/favorite_cubit.dart'
    as _i38;
import 'package:delalty/presentation/screens/login/cubit/login_cubit.dart'
    as _i39;
import 'package:delalty/presentation/screens/product/cubit/product_cubit.dart'
    as _i32;
import 'package:delalty/presentation/screens/property_filter/cubit/property_filter_cubit.dart'
    as _i7;
import 'package:delalty/presentation/screens/search/cubit/search_cubit.dart'
    as _i10;
import 'package:delalty/presentation/screens/signup/cubit/signup_cubit.dart'
    as _i35;
import 'package:delalty/presentation/screens/verification_code/cubit/verification_code_cubit.dart'
    as _i36;
import 'package:dio/dio.dart' as _i5;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i11;

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
    gh.factory<_i8.Repository>(
        () => _i9.RepositoryImpl(gh<_i4.AppServiceClient>()));
    gh.factory<_i10.SearchCubit>(() => _i10.SearchCubit());
    await gh.factoryAsync<_i11.SharedPreferences>(
      () => sharedPrefsInjectableModule.prefs,
      preResolve: true,
    );
    gh.factory<_i12.UserSecureStorage>(
        () => _i12.UserSecureStorage(gh<_i6.FlutterSecureStorage>()));
    gh.lazySingleton<_i13.VerifyPhoneUseCase>(
        () => _i13.VerifyPhoneUseCase(gh<_i8.Repository>()));
    gh.lazySingleton<_i14.AddProductToFavoritesUseCase>(
        () => _i14.AddProductToFavoritesUseCase(gh<_i8.Repository>()));
    gh.factory<_i15.AppPreferences>(
        () => _i15.AppPreferences(gh<_i11.SharedPreferences>()));
    gh.lazySingleton<_i16.AppleLoginUseCase>(
        () => _i16.AppleLoginUseCase(gh<_i8.Repository>()));
    gh.lazySingleton<_i17.CreateProductUseCase>(
        () => _i17.CreateProductUseCase(gh<_i8.Repository>()));
    gh.lazySingleton<_i18.FacebookLoginUseCase>(
        () => _i18.FacebookLoginUseCase(gh<_i8.Repository>()));
    gh.lazySingleton<_i19.GetBestCategoriesUseCase>(
        () => _i19.GetBestCategoriesUseCase(gh<_i8.Repository>()));
    gh.lazySingleton<_i20.GetCategoriesUseCase>(
        () => _i20.GetCategoriesUseCase(gh<_i8.Repository>()));
    gh.lazySingleton<_i21.GetCategoryUseCase>(
        () => _i21.GetCategoryUseCase(gh<_i8.Repository>()));
    gh.lazySingleton<_i22.GetFavoritesUseCase>(
        () => _i22.GetFavoritesUseCase(gh<_i8.Repository>()));
    gh.lazySingleton<_i23.GetProductCommentsUseCase>(
        () => _i23.GetProductCommentsUseCase(gh<_i8.Repository>()));
    gh.lazySingleton<_i24.GetProductForCategoryUseCase>(
        () => _i24.GetProductForCategoryUseCase(gh<_i8.Repository>()));
    gh.lazySingleton<_i25.GetProductSingleCommentUseCase>(
        () => _i25.GetProductSingleCommentUseCase(gh<_i8.Repository>()));
    gh.lazySingleton<_i26.GetProductUseCase>(
        () => _i26.GetProductUseCase(gh<_i8.Repository>()));
    gh.lazySingleton<_i27.GetUserDataUseCase>(
        () => _i27.GetUserDataUseCase(gh<_i8.Repository>()));
    gh.lazySingleton<_i28.GoogleLoginUseCase>(
        () => _i28.GoogleLoginUseCase(gh<_i8.Repository>()));
    gh.factory<_i29.HomeCubit>(() => _i29.HomeCubit(
          gh<_i20.GetCategoriesUseCase>(),
          gh<_i19.GetBestCategoriesUseCase>(),
          gh<_i24.GetProductForCategoryUseCase>(),
          gh<_i21.GetCategoryUseCase>(),
        ));
    gh.factory<_i30.LocalDataSource>(
        () => _i30.LocalDataSource(gh<_i11.SharedPreferences>()));
    gh.lazySingleton<_i31.LoginUseCase>(
        () => _i31.LoginUseCase(gh<_i8.Repository>()));
    gh.factory<_i32.ProductCubit>(() => _i32.ProductCubit(
          gh<_i26.GetProductUseCase>(),
          gh<_i23.GetProductCommentsUseCase>(),
        ));
    gh.lazySingleton<_i33.RegisterUseCase>(
        () => _i33.RegisterUseCase(gh<_i8.Repository>()));
    gh.lazySingleton<_i34.RemoveProductFromFavoritesUseCase>(
        () => _i34.RemoveProductFromFavoritesUseCase(gh<_i8.Repository>()));
    gh.factory<_i35.SignupCubit>(
        () => _i35.SignupCubit(gh<_i33.RegisterUseCase>()));
    gh.factory<_i36.VerificationCodeCubit>(
        () => _i36.VerificationCodeCubit(gh<_i13.VerifyPhoneUseCase>()));
    gh.factory<_i37.AppCubit>(
        () => _i37.AppCubit(gh<_i27.GetUserDataUseCase>()));
    gh.factory<_i38.FavoriteCubit>(() => _i38.FavoriteCubit(
          gh<_i22.GetFavoritesUseCase>(),
          gh<_i14.AddProductToFavoritesUseCase>(),
          gh<_i34.RemoveProductFromFavoritesUseCase>(),
        ));
    gh.factory<_i39.LoginCubit>(() => _i39.LoginCubit(gh<_i31.LoginUseCase>()));
    return this;
  }
}

class _$InjectableAppServiceClientModule
    extends _i40.InjectableAppServiceClientModule {}

class _$InjectableDioModule extends _i41.InjectableDioModule {}

class _$InjectableUserSecureStorageModule
    extends _i12.InjectableUserSecureStorageModule {}

class _$SharedPrefsInjectableModule extends _i42.SharedPrefsInjectableModule {}
