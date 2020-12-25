import 'package:flutter/material.dart';

class PercentProgressCounter extends AnimatedWidget {
  PercentProgressCounter(Animation<double> animation)
      : super(listenable: animation);
  double get value => (listenable as Animation).value;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${(value * 100).truncate().toString()}%',
    );
  }
}
