import 'dart:async';

import 'package:get/get.dart';

class CountdownController extends GetxController {
  RxInt secondsLeft = 180.obs; // 3 minutes

  Timer? _timer;

  void startCountdown() {
    _timer?.cancel(); // clear previous timer
    secondsLeft.value = 180;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsLeft > 0) {
        secondsLeft--;
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
