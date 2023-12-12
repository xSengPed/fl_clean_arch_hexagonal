abstract class CounterLocalDataSource {
  Future<int> getCount();
}

class CounterLocalDataSourceImpl implements CounterLocalDataSource {
  @override
  Future<int> getCount() async {
    return 99900;
  }
}
