import 'package:flutter/material.dart';

import 'app_bar_widget.dart';

class HeaderWidget extends StatelessWidget {
  final double fontSizeMainHeader;

  const HeaderWidget({Key key, this.fontSizeMainHeader}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double toolbarHeight = kToolbarHeight + 50;
    return Container(
      child: AppBarWidget(),
      height: toolbarHeight,
      padding: EdgeInsets.only(top: 50.0),
      decoration: BoxDecoration(
        color: Color(0xff450075),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40)),
      ),
    );
  }
}

class MyClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 30);
    Offset controlPoint = Offset(20, size.height);
    Offset endPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
