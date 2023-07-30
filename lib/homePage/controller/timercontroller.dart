import 'dart:async';
import 'dart:ffi';
import 'dart:math';

class MyTimer {
  Timer? _timer;
  double _maxValue = 20.0; // Change this to the maximum value you want to reach
  final _resetDurationInSeconds = 4; // to the reset duration in seconds
  Function(double) onUpdateCounter;

  MyTimer(this.onUpdateCounter);

  void startTimer() {
    // Start the timer to run the `updateCounter` function every _resetDurationInSeconds seconds
    _timer =
        Timer.periodic(Duration(seconds: _resetDurationInSeconds), (timer) {
      updateCounter();
    });
  }

  void updateCounter() {
    // Generate a random number between 0 and _maxValue (exclusive)
    double newCounter = Random().nextDouble() * _maxValue;
    onUpdateCounter(newCounter);
  }

  void stopTimer() {
    // Cancel the timer when it's no longer needed (e.g., when the app is closed)
    _timer?.cancel();
  }
}
