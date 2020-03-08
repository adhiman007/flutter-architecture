import 'package:injectable/injectable.dart';

@lazySingleton
class Analytics {
  void sendLog(Map<String, dynamic> data) {
    print('date: $data');
  }
}
