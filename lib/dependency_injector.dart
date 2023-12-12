import 'package:fl_clean_arch_hexagonal/core/features/counter/data/datasources/counter_local_datasource.dart';
import 'package:fl_clean_arch_hexagonal/core/features/counter/data/repositories/counter_repository_impl.dart';
import 'package:fl_clean_arch_hexagonal/core/features/counter/domain/repositories/counter_repository.dart';
import 'package:fl_clean_arch_hexagonal/core/features/counter/domain/usecases/decrease_count_usecase.dart';
import 'package:fl_clean_arch_hexagonal/core/features/counter/domain/usecases/get_count_usecase.dart';
import 'package:fl_clean_arch_hexagonal/core/features/counter/domain/usecases/increase_count_usecase.dart';
import 'package:fl_clean_arch_hexagonal/core/presentation/home.viewmodel.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Data Source
  sl.registerLazySingleton<CounterLocalDataSource>(
      () => CounterLocalDataSourceImpl());
  // Repository
  sl.registerLazySingleton<CounterRepository>(
    () => CounterRepositoryImpl(localDataSource: sl<CounterLocalDataSource>()),
  );
  // Use Case
  sl.registerLazySingleton(
    () => GetCountUseCase(sl<CounterRepository>()),
  );
  sl.registerLazySingleton(
    () => IncrementCountUsecase(sl<CounterRepository>()),
  );
  sl.registerLazySingleton(
    () => DecreaseCountUsecase(sl<CounterRepository>()),
  );
  // Core

  // sl.registerLazySingleton(() => null)

  // Presenter Logic (View)

  sl.registerLazySingleton<HomeViewmodel>(() => HomeViewmodel());
}
