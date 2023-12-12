import 'package:fl_clean_arch_hexagonal/core/features/counter/domain/repositories/counter_repository.dart';
import 'package:fl_clean_arch_hexagonal/core/usecases/usecase.dart';

class GetCountUseCase implements UseCase {
  final CounterRepository repository;
  GetCountUseCase(this.repository);
  @override
  Future call() {
    return repository.getCount();
  }
}
