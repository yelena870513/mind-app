import 'package:boilerplate/constants/font_family.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_screenutil/screenutil.dart';

class CreditoView extends StatelessWidget {
  final double fontSizeContenido;
  final double fontSizeTitulo;
  final double fontSizeCreditoCargo;

  const CreditoView({Key key,
    this.fontSizeContenido,
    this.fontSizeTitulo,
    this.fontSizeCreditoCargo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        semanticContainer: true,
        elevation: 10.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              color: const Color.fromRGBO(69, 0, 117, 0.6),
              height: 15,
            ),
            ListTile(
              title: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Créditos Realización',
                    style: TextStyle(
                        color: Color(0xff450075),
                        fontSize: ScreenUtil().setSp(fontSizeTitulo),
                        fontFamily: FontFamily.latto,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                    textAlign: TextAlign.center,
                  )),
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'Dirección de proyecto'.toUpperCase(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: ScreenUtil().setSp(fontSizeCreditoCargo),
                          fontFamily: 'Latto',
                          fontWeight: FontWeight.bold),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                    subtitle: Text(
                      'Yanet Cabargas Fernández',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: ScreenUtil().setSp(fontSizeContenido),
                          fontFamily: 'Latto'),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Proveedor de contenidos'.toUpperCase(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: ScreenUtil().setSp(fontSizeCreditoCargo),
                          fontFamily: 'Latto',
                          fontWeight: FontWeight.bold),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                    subtitle: Text(
                      'Dr. Miguel Rolando González Corona',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: ScreenUtil().setSp(fontSizeContenido),
                          fontFamily: 'Latto'),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Maquetación y programación'.toUpperCase(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: ScreenUtil().setSp(fontSizeCreditoCargo),
                          fontFamily: 'Latto',
                          fontWeight: FontWeight.bold),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                    subtitle: Text(
                      'Yelena Islen San Juan',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: ScreenUtil().setSp(fontSizeContenido),
                          fontFamily: 'Latto'),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Diseño y edición de imágenes'.toUpperCase(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: ScreenUtil().setSp(fontSizeCreditoCargo),
                          fontFamily: 'Latto',
                          fontWeight: FontWeight.bold),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                    subtitle: Text(
                      'Jeniffer Lucia Muñiz Márquez',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: ScreenUtil().setSp(fontSizeContenido),
                          fontFamily: 'Latto'),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Control de calidad'.toUpperCase(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: ScreenUtil().setSp(fontSizeCreditoCargo),
                          fontFamily: 'Latto',
                          fontWeight: FontWeight.bold),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                    subtitle: Text(
                      'Hissel Lamanier Regueiferos',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: ScreenUtil().setSp(fontSizeContenido),
                          fontFamily: 'Latto'),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Gestión de la calidad y auditoría'.toUpperCase(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: ScreenUtil().setSp(fontSizeCreditoCargo),
                          fontFamily: 'Latto',
                          fontWeight: FontWeight.bold),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                    subtitle: Column(
                      children: <Widget>[
                        Text(
                          'Mercedes María Sosa Hernández',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: ScreenUtil().setSp(fontSizeContenido),
                              fontFamily: 'Latto'),
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
    Text(
    'Anays Gómez García ',
    style: TextStyle(
    color: Colors.black,
    fontSize: ScreenUtil().setSp(fontSizeContenido),
    fontFamily: 'Latto'),
    softWrap: true,
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
    textAlign: TextAlign.center,
    ),
                        Text(
                          'Ivett Muñoz Ramírez',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: ScreenUtil().setSp(fontSizeContenido),
                              fontFamily: 'Latto'),
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )
                  ),

                  ListTile(
                    title: Text(
                      'ISBN'.toUpperCase(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: ScreenUtil().setSp(fontSizeCreditoCargo),
                          fontFamily: 'Latto',
                          fontWeight: FontWeight.bold),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                    subtitle: Text(
                      '978-959-315-130-6',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: ScreenUtil().setSp(fontSizeContenido),
                          fontFamily: 'Latto'),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      '\u00a9 Copyright CITMATEL \u00ae 2021'.toUpperCase(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: ScreenUtil().setSp(fontSizeCreditoCargo),
                          fontFamily: 'Latto',
                          fontWeight: FontWeight.bold),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                    subtitle: Text(
                      'Todos los derechos reservados',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: ScreenUtil().setSp(fontSizeContenido),
                          fontFamily: 'Latto'),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),

                ],
              ),
            )
          ],


        ),
      ),
    );
  }
}
