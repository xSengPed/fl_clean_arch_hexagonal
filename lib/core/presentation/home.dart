import 'package:fl_clean_arch_hexagonal/core/presentation/home.viewmodel.dart';
import 'package:fl_clean_arch_hexagonal/dependency_injector.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => sl<HomeViewmodel>(),
      child: Consumer<HomeViewmodel>(
        builder: (context, vm, child) {
          return Scaffold(
            body: Center(
                child: ElevatedButton(
              child: Text("${vm.count}"),
              onPressed: () async {},
            )),
          );
        },
      ),
    );
  }
}
