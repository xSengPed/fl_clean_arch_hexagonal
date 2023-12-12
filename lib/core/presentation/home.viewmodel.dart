import 'package:fl_clean_arch_hexagonal/core/features/counter/domain/usecases/get_count_usecase.dart';
import 'package:fl_clean_arch_hexagonal/dependency_injector.dart';
import 'package:flutter/material.dart';

class HomeViewmodel extends ChangeNotifier {
  late GetCountUseCase usecase = sl<GetCountUseCase>();
  int count = 0;
  HomeViewmodel() {
    getCount();
  }
  Future<void> getCount() async {
    final res = await usecase.call();

    count = res;
    notifyListeners();
  }
}
