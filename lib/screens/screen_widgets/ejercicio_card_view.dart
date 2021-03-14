import 'package:boilerplate/constants/fintness_app_theme.dart';
import 'package:boilerplate/constants/font_family.dart';
import 'package:boilerplate/models/modelo/ejercicio.dart';
import 'package:boilerplate/stores/ejercicio/ejercicio_store.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:material_dialog/material_dialog.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class EjercicioCardView extends StatefulWidget {
  final AnimationController animationController;
  final Animation animation;
  final Ejercicio ejercicio;
  final double fontSizeTitulo;
  final double fontSizeContenido;
  final double fontSizeCreditoCargo;

  const EjercicioCardView(
      {Key key,
      this.animationController,
      this.animation,
      this.ejercicio,
      this.fontSizeTitulo,
      this.fontSizeContenido,
      this.fontSizeCreditoCargo})
      : super(key: key);
  @override
  _EjercicioCardViewState createState() => _EjercicioCardViewState();

}


class _EjercicioCardViewState extends State<EjercicioCardView> {
  EjercicioStore _ejercicioStore;
  ExpandableController controller;
  List<ReactionDisposer> _disposer;

  @override
  void initState() {
    super.initState();
    controller = ExpandableController(initialExpanded: false);
    controller.addListener(() {
      if (controller.value) {
        _ejercicioStore.setIdEjercicioSeleccionado(widget.ejercicio.id);
        print(widget.ejercicio.id.toString());
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _ejercicioStore = Provider.of<EjercicioStore>(context);
    _disposer ??= [
      reaction(
              (_) => _ejercicioStore.idEjercicioSeleccionado,
              (int ejercicio) {
            controller.expanded = ejercicio == widget.ejercicio.id;
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
    final RegExp exp =
    RegExp(r"<\/?[^>]+(>|$)", multiLine: true, caseSensitive: false);

    String header = widget.ejercicio.header;
    String texto = widget.ejercicio.header.replaceAll(exp, '');
    texto = texto.replaceAll(RegExp(r'&aacute;'), 'á');
    texto = texto.replaceAll(RegExp(r'&eacute;'), 'é');
    texto = texto.replaceAll(RegExp(r'&iacute;'), 'í');
    texto = texto.replaceAll(RegExp(r'&oacute;'), 'ó');
    texto = texto.replaceAll(RegExp(r'&uacute;'), 'ú');
    texto = texto.replaceAll(RegExp(r'&ntilde;'), 'ñ');
    texto = texto.replaceAll(RegExp(r'&raquo;'), '');
    return AnimatedBuilder(
      animation: widget.animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: widget.animation,
          child: new Transform(
            transform: new Matrix4.translationValues(
                0.0, 30 * (1.0 - widget.animation.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 16, bottom: 18),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(69, 0, 117, 0.6),
                    Color(0xff450075),
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                      topRight: Radius.circular(68.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: FintnessAppTheme.grey.withOpacity(0.6),
                        offset: Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Ejercicio ' + widget.ejercicio.ejercicio.toString(),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: FontFamily.latto,
                          fontWeight: FontWeight.w600,
                          fontSize: ScreenUtil().setSp(widget.fontSizeCreditoCargo),
                          letterSpacing: 0.0,
                          color: FintnessAppTheme.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          texto,
                          textAlign: TextAlign.left,
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: FontFamily.latto,
                            fontWeight: FontWeight.w600,
                            fontSize: ScreenUtil().setSp(widget.fontSizeTitulo),
                            letterSpacing: 0.0,
                            color: FintnessAppTheme.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Icon(
                                Icons.timer,
                                color: FintnessAppTheme.white,
                                size: 16,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 4.0),
                              child: Text(
                                widget.ejercicio.tiempo,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: FontFamily.latto,
                                  fontWeight: FontWeight.w600,
                                  fontSize:
                                  ScreenUtil().setSp(widget.fontSizeCreditoCargo),
                                  letterSpacing: 0.0,
                                  color: FintnessAppTheme.white,
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: FintnessAppTheme.nearlyWhite,
                                shape: BoxShape.circle,
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: FintnessAppTheme.nearlyBlack
                                          .withOpacity(0.4),
                                      offset: Offset(8.0, 8.0),
                                      blurRadius: 8.0),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: InkWell(
                                  child: Icon(
                                    Icons.add,
                                    color:
                                    const Color.fromRGBO(69, 0, 117, 0.6),
                                    size: 44,
                                  ),
                                  onTap: () {
                                    _showDialog(
                                        context: context,
                                        child: MaterialDialog(
                                            borderRadius: 5.0,
                                            enableFullWidth: true,
                                            title: Text(
                                              'Ejercicio ' +
                                                  widget.ejercicio.ejercicio
                                                      .toString(),
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: ScreenUtil()
                                                    .setSp(widget.fontSizeContenido),
                                                fontWeight: FontWeight.w600,
                                                fontFamily: FontFamily.latto,
                                              ),
                                            ),
                                            headerColor: Color(0xff450075),
                                            backgroundColor: Colors.white,
                                            closeButtonColor: Colors.white,
                                            enableCloseButton: true,
                                            enableBackButton: false,
                                            onCloseButtonClicked: () {
                                              Navigator.of(context).pop();
                                            },
                                            content: Container(
                                              child: SingleChildScrollView(
                                                physics:
                                                const BouncingScrollPhysics(),
                                                child: Column(
                                                  mainAxisSize:
                                                  MainAxisSize.min,
                                                  children: <Widget>[
                                                    Container(
                                                      width: 150,
                                                      color: Colors.white10,
                                                      child: Image.asset(
                                                        'assets/images/' +
                                                            widget.ejercicio.img,
                                                      ),
                                                    ),
                                                    Html(
                                                      data: header,
                                                      style: {
                                                        "p": Style(
                                                            color: Colors.black,
                                                            fontSize: FontSize(
                                                                ScreenUtil().setSp(
                                                                    widget.fontSizeContenido)),
                                                            fontFamily: 'Latto',
                                                            fontWeight:
                                                            FontWeight
                                                                .w500),
                                                        "span": Style(
                                                            color: const Color(
                                                                0xff450075),
                                                            fontSize:
                                                            FontSize( ScreenUtil().setSp(
                                                                widget.fontSizeContenido)),
                                                            fontWeight:
                                                            FontWeight.w400,
                                                            fontFamily:
                                                            FontFamily
                                                                .latto),
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )));
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }


  _showDialog<T>({BuildContext context, Widget child}) {
    showDialog<T>(
      context: context,
      builder: (BuildContext context) => child,
    ).then<void>((T value) {
      // The value passed to Navigator.pop() or null.
    });
  }
}