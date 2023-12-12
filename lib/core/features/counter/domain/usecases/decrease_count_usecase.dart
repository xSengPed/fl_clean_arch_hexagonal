import 'package:fl_clean_arch_hexagonal/core/features/counter/domain/repositories/counter_repository.dart';

class DecreaseCountUsecase {
  final CounterRepository repository;
  DecreaseCountUsecase(this.repository);
}
