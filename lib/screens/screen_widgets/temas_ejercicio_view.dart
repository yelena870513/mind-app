import 'package:boilerplate/models/modelo/ejercicio.dart';
import 'package:boilerplate/models/modelo/tema.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import 'ejercicio_card_view.dart';

class TemaEjercicioView extends StatelessWidget {
  final Tema tema;
  final List<Ejercicio> ejercicios;
  final AnimationController animationController;
  final Animation animation;

  TemaEjercicioView(
      this.tema, this.ejercicios, this.animationController, this.animation);

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
                      tema.titulo,
                      style: TextStyle(
                          color: Color(0xff450075),
                          fontSize: 20,
                          fontFamily: 'Latto',
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    )),
                collapsed: Text(
                  ejercicios.length.toString() + ' Ejercicios',
                  style: TextStyle(
                      color: Colors.black, fontSize: 12, fontFamily: 'Latto'),
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
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
                            itemCount: ejercicios.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) {
                              final int count = ejercicios.length > 10
                                  ? 10
                                  : ejercicios.length;
                              final Animation<double> animation =
                                  Tween<double>(begin: 0.0, end: 1.0).animate(
                                      CurvedAnimation(
                                          parent: animationController,
                                          curve: Interval(
                                              (1 / count) * index, 1.0,
                                              curve: Curves.fastOutSlowIn)));
                              animationController.forward();

                              return EjercicioCardView(
                                animation: animation,
                                animationController: animationController,
                                ejercicio: ejercicios[index],
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
    ));
  }
}
