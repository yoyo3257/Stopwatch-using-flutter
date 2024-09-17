import 'dart:async';

import 'package:flutter/material.dart';

import 'colors.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  Timer? timer;
  int elapsedTime = 0;
  int millisecond = 0;
  void start() {
    timer?.cancel();
    timer = Timer.periodic(
      Duration(milliseconds: 10),
      (timer) {
        setState(() {
          millisecond += 10;
          if (millisecond >= 1000) {
            elapsedTime++;
            millisecond = 0;
          }
        });
      },
    );
  }

  void stop() => timer?.cancel();

  void restart() {
    stop();
    setState(() {
      millisecond = 0;
      elapsedTime = 0;
    });
  }

  String format() {
    int min = (elapsedTime ~/ 60);
    int seconds = (elapsedTime % 60);
    int millis = (millisecond ~/ 10);
    return '${min.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}:${millis.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        title: Text(
          'StopWatch',
          style: TextStyle(
            color: whiteGray,
            fontWeight: FontWeight.bold,
            fontSize: 35,
          ),
        ),
      ),
      backgroundColor: navy,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              format(),
              style: TextStyle(
                color: teal,
                fontSize: 90,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    start();
                  },
                  icon: Icon(
                    Icons.play_arrow,
                    color: babyBlue,
                    size: 60,
                  )),
              IconButton(
                  onPressed: () {
                    stop();
                  },
                  icon: Icon(
                    Icons.pause,
                    color: babyBlue,
                    size: 60,
                  )),
              IconButton(
                  onPressed: () {
                    restart();
                  },
                  icon: Icon(
                    Icons.refresh,
                    color: babyBlue,
                    size: 60,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
