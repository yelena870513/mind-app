import 'package:boilerplate/models/modelo/ejercicio.dart';
import 'package:boilerplate/screens/screen_widgets/temas_ejercicio_view.dart';
import 'package:boilerplate/stores/ejercicio/ejercicio_store.dart';
import 'package:boilerplate/stores/font/font_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';
import 'screen_widgets/header_widget.dart';

class TemaScreen extends StatefulWidget {
  final double toolbarHeight;

  TemaScreen(this.toolbarHeight);

  @override
  _TemaScreenState createState() => _TemaScreenState();
}

class _TemaScreenState extends State<TemaScreen> with TickerProviderStateMixin {
  EjercicioStore _temaStore;
  FontStore _fontStore;
  AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _temaStore = Provider.of<EjercicioStore>(context);
    _fontStore = Provider.of<FontStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            width: 100,
            height: 100,
            color: const Color(0xff450075),
            margin: EdgeInsets.only(
                top: 50, left: MediaQuery.of(context).size.width - 60),
          ),
          HeaderWidget(fontSizeMainHeader: _fontStore.fontSizeMainHeader,),
          Container(
            height:
                (MediaQuery.of(context).size.height - widget.toolbarHeight) -
                    40,
            margin: EdgeInsets.only(top: widget.toolbarHeight),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  bottomLeft: Radius.circular(70)),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height - 156 - 50,
                  padding: EdgeInsets.only(top: 23.0),
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: _temaStore.temas.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        final int count = _temaStore.temas.length > 10
                            ? 10
                            : _temaStore.temas.length;
                        final Animation<double> animation =
                            Tween<double>(begin: 0.0, end: 1.0).animate(
                                CurvedAnimation(
                                    parent: animationController,
                                    curve: Interval((1 / count) * index, 1.0,
                                        curve: Curves.fastOutSlowIn)));
                        animationController.forward();
                        List<Ejercicio> listado =
                            _temaStore.ejercicios.where((Ejercicio e) {
                          return e.tema == _temaStore.temas[index].id;
                        }).toList();

                        return TemaEjercicioView(
                            tema: _temaStore.temas[index],
                            ejercicios: listado,
                            animationController: animationController,
                            animation: animation);
                      }),
                )
              ],
            ),
          ),
        ],
      ),
      color: Colors.white10,
    );
  }
}
