import 'package:fl_clean_arch_hexagonal/core/features/counter/data/datasources/counter_local_datasource.dart';
import 'package:fl_clean_arch_hexagonal/core/features/counter/domain/repositories/counter_repository.dart';

class CounterRepositoryImpl implements CounterRepository {
  final CounterLocalDataSource localDataSource;

  CounterRepositoryImpl({required this.localDataSource});

  @override
  Future<int> getCount() async {
    return localDataSource.getCount();
  }
}
