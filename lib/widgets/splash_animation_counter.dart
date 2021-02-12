import 'package:boilerplate/constants/font_family.dart';
import 'package:flutter/material.dart';

import 'percent_progress_indicator_widget.dart';

class SplashAnimationCounter extends StatelessWidget {
  SplashAnimationCounter({this.progressAnimation, this.cloudOutAnimation});

  final Animation<double> progressAnimation;
  final Animation<double> cloudOutAnimation;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Text("Alzheimer",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    fontFamily: FontFamily.roboto)),
          ),
          Expanded(
            flex: 2,
            child: TweenAnimationBuilder(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: Duration(milliseconds: 500),
              builder: (_, value, child) {
                return Opacity(
                  opacity: value,
                  child: child,
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Cargando aplicación...',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        fontFamily: FontFamily.latto),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: FittedBox(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: PercentProgressCounter(progressAnimation),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
