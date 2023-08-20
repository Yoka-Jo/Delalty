// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:delalty/core/user_secure_storage.dart' as _i13;
import 'package:delalty/data/datasources/local_datasource/local_datasource.dart'
    as _i15;
import 'package:delalty/data/datasources/local_datasource/local_modules.dart'
    as _i19;
import 'package:delalty/data/datasources/remote_datasource/app_api.dart' as _i3;
import 'package:delalty/data/datasources/remote_datasource/remote_modules.dart'
    as _i17;
import 'package:delalty/data/network/dio_factory.dart' as _i18;
import 'package:delalty/data/repository/repository.dart' as _i9;
import 'package:delalty/domain/repository/repository.dart' as _i8;
import 'package:delalty/domain/usecases/login_usecase.dart' as _i16;
import 'package:delalty/presentation/screens/login/cubit/login_cubit.dart'
    as _i6;
import 'package:delalty/presentation/screens/property_filter/cubit/property_filter_cubit.dart'
    as _i7;
import 'package:delalty/presentation/screens/search/cubit/search_cubit.dart'
    as _i10;
import 'package:delalty/presentation/screens/signup/cubit/signup_cubit.dart'
    as _i12;
import 'package:delalty/presentation/screens/verification_code/cubit/verification_code_cubit.dart'
    as _i14;
import 'package:dio/dio.dart' as _i4;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i5;
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
    gh.lazySingleton<_i3.AppServiceClient>(
        () => injectableAppServiceClientModule.appServiceClient);
    gh.lazySingleton<_i4.Dio>(() => injectableDioModule.dio);
    gh.lazySingleton<_i5.FlutterSecureStorage>(
        () => injectableUserSecureStorageModule.secureStorage);
    gh.factory<_i6.LoginCubit>(() => _i6.LoginCubit());
    gh.factory<_i7.PropertyFilterCubit>(() => _i7.PropertyFilterCubit());
    gh.factory<_i8.Repository>(
        () => _i9.RepositoryImpl(gh<_i3.AppServiceClient>()));
    gh.factory<_i10.SearchCubit>(() => _i10.SearchCubit());
    await gh.factoryAsync<_i11.SharedPreferences>(
      () => sharedPrefsInjectableModule.prefs,
      preResolve: true,
    );
    gh.factory<_i12.SignupCubit>(() => _i12.SignupCubit());
    gh.factory<_i13.UserSecureStorage>(
        () => _i13.UserSecureStorage(gh<_i5.FlutterSecureStorage>()));
    gh.factory<_i14.VerificationCodeCubit>(() => _i14.VerificationCodeCubit());
    gh.factory<_i15.LocalDataSource>(
        () => _i15.LocalDataSource(gh<_i11.SharedPreferences>()));
    gh.lazySingleton<_i16.LoginUseCase>(
        () => _i16.LoginUseCase(gh<_i8.Repository>()));
    return this;
  }
}

class _$InjectableAppServiceClientModule
    extends _i17.InjectableAppServiceClientModule {}

class _$InjectableDioModule extends _i18.InjectableDioModule {}

class _$InjectableUserSecureStorageModule
    extends _i13.InjectableUserSecureStorageModule {}

class _$SharedPrefsInjectableModule extends _i19.SharedPrefsInjectableModule {}
