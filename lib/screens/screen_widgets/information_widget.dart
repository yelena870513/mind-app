import 'package:boilerplate/constants/font_family.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class InformationWidget extends StatelessWidget {
  final String subtitulo;
  final double fontSizeContenido;

  const InformationWidget({Key key, this.subtitulo, this.fontSizeContenido}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget result = SizedBox.shrink();
    if (subtitulo.isNotEmpty) {
      result = InkWell(
        onTap: () {
          _showMessage(subtitulo, context);
        },
        child: Icon(
          Icons.info_outline,
          color: const Color.fromRGBO(69, 0, 117, 0.6),
          size: 20,
        ),
      );
    }

    return result;
  }

  _showMessage(String message, context) {
    Future.delayed(Duration(milliseconds: 0), () {
      if (message != null && message.isNotEmpty) {
        Flushbar(
          title: '',
          message: message,
          messageText: Text(message,
          style: TextStyle(
              color: Colors.white,
              fontSize:  ScreenUtil().setSp(fontSizeContenido),
              fontFamily: FontFamily.latto,

             ),),
          backgroundColor: Color(0xff450075),
          icon: Icon(
            Icons.info_outline,
            size: 28.0,
            color: Colors.white,
          ),
          leftBarIndicatorColor: Colors.purple[200],
          duration: Duration(seconds: 6),
        )..show(context);
      }
    });

    return SizedBox.shrink();
  }
}
