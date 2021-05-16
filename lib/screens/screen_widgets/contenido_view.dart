import 'dart:math';

import 'package:boilerplate/constants/font_family.dart';
import 'package:boilerplate/stores/contenido/contenido_store.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/models/modelo/contenido.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class ContenidoView extends StatefulWidget {
  final Contenido contenido;
  final String searchTerm;
  final double fontSizeTitulo;
  final double fontSizeContenido;

  ContenidoView(this.contenido, this.searchTerm, this.fontSizeTitulo,
      this.fontSizeContenido);

  @override
  _ContenidoViewState createState() => _ContenidoViewState();
}

class _ContenidoViewState extends State<ContenidoView> {
  ContenidoStore _contenidoStore;
  ExpandableController controller;
  List<ReactionDisposer> _disposer;

  String _singleTextModifier(String text) {
    final RegExp exp =
    RegExp(r"<\/?[^>]+(>|$)", multiLine: true, caseSensitive: false);
    return text
        .replaceAll(exp, '')
        .replaceAll(RegExp(r'&aacute;'), 'á')
        .replaceAll(RegExp(r'&eacute;'), 'é')
        .replaceAll(RegExp(r'&iacute;'), 'í')
        .replaceAll(RegExp(r'&oacute;'), 'ó')
        .replaceAll(RegExp(r'&uacute;'), 'ú')
        .replaceAll(RegExp(r'&ntilde;'), 'ñ')
        .replaceAll(RegExp(r'&raquo;'), '');
  }

  String _htmlMarker(String text) {
    String result = text;
    if (widget.searchTerm.length >= 3) {
      String query = widget.searchTerm;
      query = query.replaceAll(new RegExp(r'a', caseSensitive: false), '[a|á]');
      query = query.replaceAll(new RegExp(r'e', caseSensitive: false), '[e|é]');
      query = query.replaceAll(new RegExp(r'i', caseSensitive: false), '[i|í]');
      query = query.replaceAll(new RegExp(r'o', caseSensitive: false), '[o|ó]');
      query = query.replaceAll(new RegExp(r'u', caseSensitive: false), '[u|ú]');
      result = result.replaceAll(RegExp(r'&aacute;'), 'á');
      result = result.replaceAll(RegExp(r'&eacute;'), 'é');
      result = result.replaceAll(RegExp(r'&iacute;'), 'í');
      result = result.replaceAll(RegExp(r'&oacute;'), 'ó');
      result = result.replaceAll(RegExp(r'&uacute;'), 'ú');
      result = result.replaceAll(RegExp(r'&ntilde;'), 'ñ');
      result = result.replaceAllMapped(new RegExp(query, caseSensitive: false),
              (Match m) {
            String group = m.group(0);
            return '<span><b><i><u>' + group + '</u></i></b></span>';
          });
    }
    return result;
  }

  @override
  void initState() {
    super.initState();
    controller = ExpandableController(initialExpanded: false);
    controller.addListener(() {
      if (controller.value) {
        _contenidoStore.setIdContenidoSeleccionado(widget.contenido.id);
        print(widget.contenido.id.toString());
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _contenidoStore = Provider.of<ContenidoStore>(context);
    _disposer ??= [
      reaction(
          (_) => _contenidoStore.idContenidoSeleccionado,
          (int contenido) {
            controller.expanded = contenido == widget.contenido.id;
          }
      )
    ];
  }

  @override
  void dispose() {
    _disposer.forEach((f) => f());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String texto = _singleTextModifier(widget.contenido.texto);
    String finalHtml = _htmlMarker(widget.contenido.texto);
    return ExpandableNotifier(
        controller: controller,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 15,
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
                      tapBodyToCollapse: false,
                    ),
                    header: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          widget.contenido.titulo,
                          style: TextStyle(
                              color: Color(0xff450075),
                              fontSize:
                              ScreenUtil().setSp(widget.fontSizeTitulo),
                              fontFamily: FontFamily.latto,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        )),
                    collapsed: Text(
                      texto,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize:
                          ScreenUtil().setSp(widget.fontSizeContenido),
                          fontFamily: FontFamily.latto,
                          fontWeight: FontWeight.w500),
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
                            data: finalHtml,
                            style: {
                              "p": Style(
                                  color: Colors.black,
                                  fontSize: FontSize(ScreenUtil()
                                      .setSp(widget.fontSizeContenido)),
                                  fontFamily: FontFamily.latto,
                                  fontWeight: FontWeight.w500),
                              "span": Style(
                                  color: const Color(0xff450075),
                                  fontSize: FontSize(ScreenUtil()
                                      .setSp(widget.fontSizeContenido)),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: FontFamily.latto),
                              "u": Style(color: const Color(0xff450075)),
                            },
                          ),
                        ),
                      ],
                    ),
                    builder: (_, collapsed, expanded) {
                      return Padding(
                        padding:
                        EdgeInsets.only(left: 10, right: 10, bottom: 10),
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
