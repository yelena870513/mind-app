import 'dart:async';

import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/routes.dart';
import 'package:boilerplate/stores/contenido/contenido_store.dart';
import 'package:boilerplate/stores/ejercicio/ejercicio_store.dart';
import 'package:boilerplate/widgets/splash_animation_counter.dart';
import 'package:boilerplate/widgets/splash_animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _progressAnimation;
  Animation<double> _cloudOutAnimation;
  ContenidoStore _contenidoStore;
  EjercicioStore _ejercicioStore;

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
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _contenidoStore = Provider.of<ContenidoStore>(context);
    _ejercicioStore = Provider.of<EjercicioStore>(context);
  }

  Future<bool> getData() async {
    await _contenidoStore.getContenidos();
    await _contenidoStore.getTemas();
    await _ejercicioStore.getEjercicios();
    await _ejercicioStore.getTemas();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return SizedBox.shrink();
          } else {
            return Scaffold(
                backgroundColor: AppColors.backgroundColor,
                body: Stack(
                  children: <Widget>[
                    SplashAnimationCounter(
                      progressAnimation: _progressAnimation,
                      cloudOutAnimation: _cloudOutAnimation,
                    ),
                    SplashAnimationWidget(
                      progressAnimation: _progressAnimation,
                      cloudOutAnimation: _cloudOutAnimation,
                    )
                  ],
                ));
          }
        });
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
