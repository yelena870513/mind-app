import 'dart:async';

import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/data/sharedpref/constants/preferences.dart';
import 'package:boilerplate/routes.dart';
import 'package:boilerplate/widgets/splash_animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _progressAnimation;
  Animation<double> _cloudOutAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 7,
      ),
    );
    _progressAnimation = CurvedAnimation(
        parent: _animationController, curve: Interval(0.0, 0.65));
    _cloudOutAnimation = CurvedAnimation(
        parent: _animationController, curve: Interval(0.7, 0.85));

    super.initState();
    startTimer();
  }

  @override
  void disposed() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgraundColor,
        body: Stack(
          children: <Widget>[
            SplashAnimationWidget(
              progressAnimation: _progressAnimation,
              cloudOutAnimation: _cloudOutAnimation,
            )
          ],
        ));
  }

  startTimer() {
    var _duration = Duration(milliseconds: 100);
    return Timer(_duration, _cloudAnimation);
  }

  navigate() {
    Navigator.of(context).pushReplacementNamed(Routes.home);
  }

  _cloudAnimation() {
    _animationController.forward().whenComplete(navigate);
  }
}
