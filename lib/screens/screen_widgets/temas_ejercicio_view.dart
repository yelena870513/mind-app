import 'package:boilerplate/constants/font_family.dart';
import 'package:boilerplate/models/modelo/ejercicio.dart';
import 'package:boilerplate/models/modelo/tema.dart';
import 'package:boilerplate/screens/screen_widgets/information_widget.dart';
import 'package:boilerplate/stores/ejercicio/ejercicio_store.dart';
import 'package:boilerplate/stores/font/font_store.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import 'ejercicio_card_view.dart';

class TemaEjercicioView extends StatefulWidget {
  final Tema tema;
  final List<Ejercicio> ejercicios;
  final AnimationController animationController;
  final Animation animation;

  const TemaEjercicioView(
      {Key key,
      this.tema,
      this.ejercicios,
      this.animationController,
      this.animation})
      : super(key: key);

  @override
  _TemaEjercicioViewState createState() => _TemaEjercicioViewState();
}

class _TemaEjercicioViewState extends State<TemaEjercicioView> {
  FontStore _fontStore;
  EjercicioStore _ejercicioStore;
  ExpandableController controller;
  List<ReactionDisposer> _disposer;

  @override
  void initState() {
    super.initState();
    controller = ExpandableController(initialExpanded: false);
    controller.addListener(() {
      if (controller.value) {
        _ejercicioStore.setIdTemaSeleccionado(widget.tema.id);
        print(widget.tema.id.toString());
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _fontStore = Provider.of<FontStore>(context);
    _ejercicioStore = Provider.of<EjercicioStore>(context);
    _disposer ??= [
      reaction(
              (_) => _ejercicioStore.idTemaSeleccionado,
              (int tema) {
            controller.expanded = tema == widget.tema.id;
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
    return Observer(builder: (_) => ExpandableNotifier(
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
                          widget.tema.titulo,
                          style: TextStyle(
                              color: Color(0xff450075),
                              fontSize: ScreenUtil().setSp(_fontStore.fontSizeTitulo),
                              fontFamily: FontFamily.latto,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        )),
                    collapsed: Row(
                      children: <Widget>[
                        Text(
                          widget.ejercicios.length.toString() + ' Ejercicios',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: _fontStore.fontSizeContenido - 2,
                              fontFamily: FontFamily.latto,
                              fontWeight: FontWeight.w600),
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 3),
                            child: InformationWidget(
                              subtitulo: widget.tema.subtitulo,
                              fontSizeContenido: _fontStore.fontSizeContenido,
                            ))
                      ],
                    ),
                    expanded: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: 300,
                            height: 200,
                            child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: widget.ejercicios.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int index) {
                                  final int count = widget.ejercicios.length > 10
                                      ? 10
                                      : widget.ejercicios.length;
                                  final Animation<double> animation =
                                  Tween<double>(begin: 0.0, end: 1.0).animate(
                                      CurvedAnimation(
                                          parent: widget.animationController,
                                          curve: Interval(
                                              (1 / count) * index, 1.0,
                                              curve: Curves.fastOutSlowIn)));
                                  widget.animationController.forward();

                                  return EjercicioCardView(
                                    animation: animation,
                                    animationController: widget.animationController,
                                    ejercicio: widget.ejercicios[index],
                                    fontSizeContenido: _fontStore.fontSizeContenido,
                                    fontSizeTitulo: _fontStore.fontSizeTitulo,
                                    fontSizeCreditoCargo: _fontStore.fontSizeCreditoCargo,
                                  );
                                }),
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
        )),);
  }
}
