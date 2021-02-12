import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/models/modelo/contenido.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_screenutil/screenutil.dart';

class CreditoView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(69, 0, 117, 0.6),
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
            ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                ),
                header: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Créditos Realización',
                      style: TextStyle(
                          color: Color(0xff450075),
                          fontSize: 20,
                          fontFamily: 'Latto',
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    )),
                collapsed: Column(

                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Dirección de proyecto'.toUpperCase(),
                      style: TextStyle(
                          color: Colors.black, fontSize: 14, fontFamily: 'Latto', fontWeight: FontWeight.bold),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Mayling Mirabal Olivera',
                      style: TextStyle(
                          color: Colors.black, fontSize: 16, fontFamily: 'Latto'),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Proveedor de contenidos'.toUpperCase(),
                      style: TextStyle(
                          color: Colors.black, fontSize: 14, fontFamily: 'Latto', fontWeight: FontWeight.bold),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Dr. Miguel Rolando González Corona',
                      style: TextStyle(
                          color: Colors.black, fontSize: 16, fontFamily: 'Latto'),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Maquetación y programación'.toUpperCase(),
                      style: TextStyle(
                          color: Colors.black, fontSize: 14, fontFamily: 'Latto', fontWeight: FontWeight.bold),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Yelena Islen San Juan',
                      style: TextStyle(
                          color: Colors.black, fontSize: 16, fontFamily: 'Latto'),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Diseño y edición de imágenes'.toUpperCase(),
                      style: TextStyle(
                          color: Colors.black, fontSize: 14, fontFamily: 'Latto', fontWeight: FontWeight.bold),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Jennifer',
                      style: TextStyle(
                          color: Colors.black, fontSize: 16, fontFamily: 'Latto'),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Gestión de la calidad y auditoría'.toUpperCase(),
                      style: TextStyle(
                          color: Colors.black, fontSize: 14, fontFamily: 'Latto', fontWeight: FontWeight.bold),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Mercedes María Sosa Hernández;'
                          ' Anays Gómez García',
                      style: TextStyle(
                          color: Colors.black, fontSize: 16, fontFamily: 'Latto'),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'ISBN'.toUpperCase(),
                      style: TextStyle(
                          color: Colors.black, fontSize: 14, fontFamily: 'Latto', fontWeight: FontWeight.bold),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '978-959-327-973-6',
                      style: TextStyle(
                          color: Colors.black, fontSize: 16, fontFamily: 'Latto'),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '\u00a9 Copyright CITMATEL \u00ae 2021'.toUpperCase(),
                      style: TextStyle(
                          color: Colors.black, fontSize: 14, fontFamily: 'Latto', fontWeight: FontWeight.bold),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                  ],
                ),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        'Datos del autor'.toUpperCase(),
                        style: TextStyle(
                            color: Colors.black, fontSize: 14, fontFamily: 'Latto', fontWeight: FontWeight.bold),
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                builder: (_, collapsed, expanded) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: const ExpandableThemeData(crossFadePoint: 0),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
