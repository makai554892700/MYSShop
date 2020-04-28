import 'dart:async';
import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class Waiter extends StatefulWidget {
  final onCountDownFinishCallBack;
  final String text;
  int seconds;

  Waiter(
      {Key key,
      @required this.text,
      @required this.seconds,
      @required this.onCountDownFinishCallBack})
      : super(key: key);

  @override
  State createState() {
    return WaiterState();
  }
}

class WaiterState extends State<Waiter> {
  Timer timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        cancelTimer();
      },
      child: Text(
        '${widget.seconds} s ${widget.text} >>',
        style: TextStyle(
          fontSize: 24.0,
        ),
      ),
    );
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {});
        if (widget.seconds <= 1) {
          cancelTimer();
          return;
        }
        widget.seconds--;
      }
    });
  }

  void cancelTimer() {
    widget.onCountDownFinishCallBack(true);
    timer?.cancel();
  }
}
