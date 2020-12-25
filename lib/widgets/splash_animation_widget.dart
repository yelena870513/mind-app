import 'dart:ui';

import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/constants/font_family.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

const List<String> dictionary = ["Alzheimer", "Ejercicios", "Prevención"];

class _Bubble {
  final Color color;
  final double direction;
  final double speed;
  final double size;
  final double initialPosition;

  _Bubble(
      {this.color,
      this.direction,
      this.speed,
      this.size,
      this.initialPosition});
}

class _WordBubble {
  final Color color;
  final double direction;
  final double speed;
  final double size;
  final double initialPosition;
  final String word;

  _WordBubble(
      {this.color,
      this.direction,
      this.speed,
      this.size,
      this.initialPosition,
      this.word});
}

class _CloudBubblePainter extends CustomPainter {
  _CloudBubblePainter(
    this.animation,
    this.bubbles,
  ) : super(repaint: animation);

  final Animation<double> animation;
  final List<_Bubble> bubbles;

  @override
  void paint(Canvas canvas, Size size) {
    for (_Bubble _bubble in bubbles) {
      final offset = Offset(
        size.width / 2 + _bubble.direction * animation.value,
        size.height * 1.2 * (1 - animation.value) -
            _bubble.speed * animation.value +
            _bubble.initialPosition * (1 - animation.value),
      );
      canvas.drawCircle(offset, _bubble.size, Paint()..color = _bubble.color);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class __CloudWordBubblePainter extends CustomPainter {
  __CloudWordBubblePainter(
    this.animation,
    this.bubbles,
  ) : super(repaint: animation);

  final Animation<double> animation;
  final List<_WordBubble> bubbles;

  @override
  void paint(Canvas canvas, Size size) {
    for (_WordBubble _bubble in bubbles) {
      final offset = Offset(
        size.width / 2 + _bubble.direction * animation.value,
        size.height * 1.2 * (1 - animation.value) -
            _bubble.speed * animation.value +
            _bubble.initialPosition * (1 - animation.value),
      );

      TextSpan span = new TextSpan(
          style: new TextStyle(
              color: _bubble.color,
              fontFamily: FontFamily.productSans,
              fontSize: 18,
              fontWeight: FontWeight.w700),
          text: _bubble.word);
      TextPainter tp = new TextPainter(
          text: span,
          textAlign: TextAlign.left,
          textDirection: TextDirection.ltr);
      tp.layout();
      tp.paint(canvas, offset);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class SplashAnimationWidget extends StatelessWidget {
  SplashAnimationWidget(
      {Key key, this.progressAnimation, this.cloudOutAnimation})
      : super(key: key);

  final Animation<double> progressAnimation;
  final Animation<double> cloudOutAnimation;
  final bubbles = List<_WordBubble>.generate(100, (index) {
    final size = math.Random().nextInt(20) + 5.0;
    final speed = math.Random().nextInt(50) + 1.0;
    final directionRandom = math.Random().nextBool();
    final colorRandom = math.Random().nextBool();
    final direction =
        math.Random().nextInt(250) * (directionRandom ? 1.0 : -1.0);
    final color = colorRandom
        ? AppColors.mainSplashColor
        : AppColors.secundarySplashColor;
    final int wordIndex = math.Random().nextInt(dictionary.length);

    return _WordBubble(
        color: color,
        direction: direction,
        speed: speed,
        size: size,
        initialPosition: index * 10.0,
        word: dictionary.elementAt(wordIndex));
  });

  @override
  Widget build(BuildContext context) {
    final queryData = MediaQuery.of(context).size;

    return AnimatedBuilder(
        animation: Listenable.merge([progressAnimation, cloudOutAnimation]),
        builder: (context, snapshot) {
          final size = queryData.width * 0.5;
          final circleSize = size *
              math.pow(
                  (progressAnimation.value + cloudOutAnimation.value + 1), 2);
          final topPosition = queryData.height * 0.45;
          final centerMargin = queryData.width - circleSize;
          final leftSize = size * 0.6 * (1 - progressAnimation.value);
          final rightSize = size * 0.7 * (1 - progressAnimation.value);
          final leftMargin = queryData.width / 2 - leftSize * 1.2;
          final rightMargin = queryData.width / 2 - rightSize * 1.2;
          final middleMargin =
              queryData.width / 2 - (size / 2) * (1 - progressAnimation.value);
          final topOutPosition = queryData.height * cloudOutAnimation.value;
          return Positioned(
            left: 0,
            right: 0,
            top: topPosition - circleSize + topOutPosition,
            height: circleSize,
            child: Stack(
              children: <Widget>[
                Positioned(
                  height: leftSize,
                  width: leftSize,
                  left: leftMargin,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  height: leftSize / 2,
                  width: size * (1 - progressAnimation.value),
                  left: middleMargin,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  height: rightSize,
                  width: rightSize,
                  right: rightMargin,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  height: circleSize,
                  width: circleSize,
                  bottom: 0,
                  left: centerMargin / 2,
                  child: ClipOval(
                    child: CustomPaint(
                      foregroundPainter:
                          __CloudWordBubblePainter(progressAnimation, bubbles),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
