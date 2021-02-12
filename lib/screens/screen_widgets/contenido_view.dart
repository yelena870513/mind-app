import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/models/modelo/contenido.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_screenutil/screenutil.dart';

class ContenidoView extends StatelessWidget {
  final Contenido contenido;

  ContenidoView(this.contenido);

  @override
  Widget build(BuildContext context) {
    final RegExp exp =
        RegExp(r"<\/?[^>]+(>|$)", multiLine: true, caseSensitive: false);
    String texto = contenido.texto.replaceAll(exp, '');
    texto = texto.replaceAll(RegExp(r'&aacute;'), 'á');
    texto = texto.replaceAll(RegExp(r'&eacute;'), 'é');
    texto = texto.replaceAll(RegExp(r'&iacute;'), 'í');
    texto = texto.replaceAll(RegExp(r'&oacute;'), 'ó');
    texto = texto.replaceAll(RegExp(r'&uacute;'), 'ú');
    texto = texto.replaceAll(RegExp(r'&ntilde;'), 'ñ');
    texto = texto.replaceAll(RegExp(r'&raquo;'), '');
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
                      contenido.titulo,
                      style: TextStyle(
                          color: Color(0xff450075),
                          fontSize: 20,
                          fontFamily: 'Latto',
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    )),
                collapsed: Text(
                  texto,
                  style: TextStyle(
                      color: Colors.black, fontSize: 16, fontFamily: 'Latto'),
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Html(
                        data: contenido.texto,
                        style: {
                          "p": Style(
                              color: Colors.black,
                              fontSize: FontSize(16),
                              fontFamily: 'Latto'),
                          "span": Style(
                              color: Color(0xff450075),
                              fontSize: FontSize(24),
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Latto')
                        },
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
