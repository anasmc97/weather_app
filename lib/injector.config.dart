// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i7;
import 'package:weather_app/core/di/app_module.dart' as _i20;
import 'package:weather_app/core/di/storage_module.dart' as _i21;
import 'package:weather_app/core/storages/local_storages.dart' as _i9;
import 'package:weather_app/core/utils/interceptor/dio_error_interceptor.dart'
    as _i4;
import 'package:weather_app/core/utils/interceptor/dio_http_interceptor.dart'
    as _i5;
import 'package:weather_app/feature/data/datasources/local/weather_local_data_source.dart'
    as _i10;
import 'package:weather_app/feature/data/datasources/remote/weather_remote_data_source.dart'
    as _i8;
import 'package:weather_app/feature/data/repositories/weather_repository_impl.dart'
    as _i12;
import 'package:weather_app/feature/domain/repositories/weather_repository.dart'
    as _i11;
import 'package:weather_app/feature/domain/usecases/get_forecast_weather_local.dart'
    as _i13;
import 'package:weather_app/feature/domain/usecases/get_weather_local.dart'
    as _i14;
import 'package:weather_app/feature/domain/usecases/load_forecast_five_days.dart'
    as _i15;
import 'package:weather_app/feature/domain/usecases/load_weather_usecase.dart'
    as _i16;
import 'package:weather_app/feature/domain/usecases/save_forecast_weather_local.dart'
    as _i17;
import 'package:weather_app/feature/domain/usecases/save_weather_local_usecase.dart'
    as _i18;
import 'package:weather_app/feature/presentation/blocs/weather_bloc/weather_bloc.dart'
    as _i19;
import 'package:weather_app/shared/flash/presentation/blocs/cubit/flash_cubit.dart'
    as _i6;

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
    final appModule = _$AppModule();
    final storageModule = _$StorageModule();
    gh.singleton<_i3.Dio>(appModule.dio);
    gh.lazySingleton<_i4.DioErrorInterceptor>(() => _i4.DioErrorInterceptor());
    gh.lazySingleton<_i5.DioHttpInterceptor>(() => _i5.DioHttpInterceptor());
    gh.factory<_i6.FlashCubit>(() => _i6.FlashCubit());
    await gh.lazySingletonAsync<_i7.SharedPreferences>(
      () => storageModule.sharedPreference,
      preResolve: true,
    );
    gh.lazySingleton<_i8.WeatherRemoteDataSource>(
        () => _i8.WeatherRemoteDataSourceImpl(gh<_i3.Dio>()));
    gh.lazySingleton<_i9.LocalStorage>(
        () => _i9.LocalStorageImpl(gh<_i7.SharedPreferences>()));
    gh.lazySingleton<_i10.WeatherLocalDataSource>(
        () => _i10.WeatherLocalDataSourceImpl(gh<_i9.LocalStorage>()));
    gh.lazySingleton<_i11.WeatherRepository>(() => _i12.WeatherRepositoryImpl(
          remoteDataSource: gh<_i8.WeatherRemoteDataSource>(),
          localDataSource: gh<_i10.WeatherLocalDataSource>(),
        ));
    gh.lazySingleton<_i13.GetForecastWeatherLocalUseCase>(() =>
        _i13.GetForecastWeatherLocalUseCase(gh<_i11.WeatherRepository>()));
    gh.lazySingleton<_i14.GetWeatherLocalUseCase>(
        () => _i14.GetWeatherLocalUseCase(gh<_i11.WeatherRepository>()));
    gh.lazySingleton<_i15.LoadForecastFiveDaysUsecase>(
        () => _i15.LoadForecastFiveDaysUsecase(gh<_i11.WeatherRepository>()));
    gh.lazySingleton<_i16.LoadWeatherUsecase>(
        () => _i16.LoadWeatherUsecase(gh<_i11.WeatherRepository>()));
    gh.lazySingleton<_i17.SaveForecastWeatherLocalUseCase>(() =>
        _i17.SaveForecastWeatherLocalUseCase(gh<_i11.WeatherRepository>()));
    gh.lazySingleton<_i18.SaveWeatherLocalUseCase>(
        () => _i18.SaveWeatherLocalUseCase(gh<_i11.WeatherRepository>()));
    gh.factory<_i19.WeatherBloc>(() => _i19.WeatherBloc(
          gh<_i16.LoadWeatherUsecase>(),
          gh<_i18.SaveWeatherLocalUseCase>(),
          gh<_i14.GetWeatherLocalUseCase>(),
          gh<_i15.LoadForecastFiveDaysUsecase>(),
          gh<_i13.GetForecastWeatherLocalUseCase>(),
          gh<_i17.SaveForecastWeatherLocalUseCase>(),
        ));
    return this;
  }
}

class _$AppModule extends _i20.AppModule {}

class _$StorageModule extends _i21.StorageModule {}
