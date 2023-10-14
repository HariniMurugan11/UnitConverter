import 'package:flutter/material.dart';
import 'dart:async';

class StopwatchTimer extends StatefulWidget {
  @override
  _StopwatchTimerState createState() => _StopwatchTimerState();
}

class _StopwatchTimerState extends State<StopwatchTimer> {
  final Stopwatch _stopwatch = Stopwatch();
  final Duration _tick = Duration(milliseconds: 10);
  Timer? _timer;

  Duration _remainingTime = Duration();
  TextEditingController _timerController = TextEditingController();

  void _startStopwatch() {
    _timer?.cancel();
    _stopwatch.start();
    _timer = Timer.periodic(_tick, (timer) {
      if (!_stopwatch.isRunning) timer.cancel();
      setState(() {});
    });
  }

  void _stopStopwatch() {
    _stopwatch.stop();
    setState(() {});
  }

  void _resetStopwatch() {
    _stopwatch.reset();
    setState(() {});
  }

  void _startTimer() {
    _stopwatch.stop();
    _timer?.cancel();
    setState(() {
      _remainingTime = Duration(minutes: int.parse(_timerController.text));
    });
    _timer = Timer.periodic(_tick, (timer) {
      if (_remainingTime <= Duration.zero) {
        timer.cancel();
      } else {
        setState(() {
          _remainingTime -= _tick;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stopwatch & Timer")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              _stopwatch.elapsed.inMinutes.toString().padLeft(2, '0') +
                  ':' +
                  (_stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, '0') +
                  '.' +
                  (_stopwatch.elapsed.inMilliseconds % 1000 ~/ 10).toString().padLeft(2, '0'),
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: _startStopwatch, child: Text("Start")),
                SizedBox(width: 10),
                ElevatedButton(onPressed: _stopStopwatch, child: Text("Stop")),
                SizedBox(width: 10),
                ElevatedButton(onPressed: _resetStopwatch, child: Text("Reset")),
              ],
            ),
            SizedBox(height: 40),
            TextField(
              controller: _timerController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter timer duration (in minutes)",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              _remainingTime.inMinutes.toString().padLeft(2, '0') +
                  ':' +
                  (_remainingTime.inSeconds % 60).toString().padLeft(2, '0'),
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _startTimer, child: Text("Start Timer")),
          ],
        ),
      ),
    );
  }
}
