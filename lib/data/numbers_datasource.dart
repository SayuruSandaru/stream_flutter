import 'dart:math';

class NumbersDatasource {
  Stream<int> generateNumbers() async* {
    var random = Random();
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      yield random.nextInt(100);
    }
  }
}
