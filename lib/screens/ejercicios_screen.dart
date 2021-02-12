import 'package:boilerplate/stores/contenido/contenido_store.dart';
import 'package:boilerplate/stores/ejercicio/ejercicio_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:boilerplate/screens/screen_widgets/contenido_view.dart';
import 'screen_widgets/header_widget.dart';

class EjerciciosScreen extends StatefulWidget {
  final double toolbarHeight;
  EjerciciosScreen(this.toolbarHeight);
  @override
  _EjerciciosScreenState createState() => _EjerciciosScreenState();
}

class _EjerciciosScreenState extends State<EjerciciosScreen>
    with TickerProviderStateMixin {
  EjercicioStore _ejerciciosStore;
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
    _ejerciciosStore = Provider.of<EjercicioStore>(context);
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
          HeaderWidget(),
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
                      itemCount: _ejerciciosStore.ejercicioCount,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        final int count = _ejerciciosStore.ejercicioCount > 10
                            ? 10
                            : _ejerciciosStore.ejercicioCount;
                        final Animation<double> animation =
                            Tween<double>(begin: 0.0, end: 1.0).animate(
                                CurvedAnimation(
                                    parent: animationController,
                                    curve: Interval((1 / count) * index, 1.0,
                                        curve: Curves.fastOutSlowIn)));
                        animationController.forward();
                        // return ContenidoView(_ejerciciosStore.ejercicios[index]);
                        return SizedBox.shrink();
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
