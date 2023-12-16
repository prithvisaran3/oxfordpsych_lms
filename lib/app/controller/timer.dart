import 'dart:async';

import 'package:get/get.dart';

import 'main.dart';

class WaitingTimeController extends GetxController {
  static WaitingTimeController get to => Get.put(WaitingTimeController());
  Stopwatch watch = Stopwatch();
  late Timer timer;
  final _startStop = true.obs;

  get startStop => _startStop.value;

  set startStop(value) {
    _startStop.value = value;
  }

  final _elapsedTime = "".obs;

  get elapsedTime => _elapsedTime.value;

  set elapsedTime(value) {
    _elapsedTime.value = value;
  }

  startOrStop() {
    if (startStop) {
      startWatch();
    } else {
      if (MainController.to.isTripFinish == true ||
          MainController.to.isTripFinish == false) {
        pauseWatch();
      }
    }
  }

  updateTime(Timer timer) {
    if (watch.isRunning) {
      print("startstop Inside=$startStop");
      elapsedTime = transformMilliSeconds(watch.elapsedMilliseconds);
    }
  }

  startWatch() {
    startStop = false;
    watch.start();
    timer = Timer.periodic(const Duration(milliseconds: 100), updateTime);
  }

  pauseWatch() {
    startStop = true;
    watch.stop();
    setTime();
  }

  stopWatch() {
    var timeSoFar = watch.elapsedMilliseconds;

    elapsedTime = transformMilliSeconds(timeSoFar);

    // watch.reset();
    watch.stop();
    pauseWatch();
    print("time is $elapsedTime");
    watch.reset();
  }

  setTime() {
    var timeSoFar = watch.elapsedMilliseconds;

    elapsedTime = transformMilliSeconds(timeSoFar);
    MainController.to.waitingTime = transformMilliSeconds(timeSoFar);
    print("Waiting time is ${MainController.to.waitingTime}");
  }

  transformMilliSeconds(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();
    int hours = (minutes / 60).truncate();

    String hoursStr = (hours % 60).toString().padLeft(2, '0');
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    return "$hoursStr:$minutesStr:$secondsStr";
  }
}
