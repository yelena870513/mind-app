import 'package:boilerplate/screens/contenido_screen.dart';
import 'package:boilerplate/screens/credito_screen.dart';
import 'package:boilerplate/screens/ejercicios_screen.dart';
import 'package:boilerplate/screens/fitness_screen.dart';
import 'package:boilerplate/screens/screen_widgets/creditos_screen.dart';
import 'package:boilerplate/screens/tema_screen.dart';
import 'package:boilerplate/widgets/bounce_tab_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //stores:---------------------------------------------------------------------
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final double toolbarHeight = kToolbarHeight + 50;
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(20))),
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Image.asset(
                      'assets/images/fondo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ContenidoScreen(toolbarHeight),
          Container(
            color: Colors.white,
            child: TemaScreen(toolbarHeight),
          ),

          Container(
            color: Colors.white,
            child: CreditoScreen(toolbarHeight: toolbarHeight),
          )
        ],
      ),
      bottomNavigationBar: BounceTabBar(
        initialIndex: _currentIndex,
        onTabChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: const Color(0xff450075),
        items: <Widget>[
          InkWell(
            child: Image.asset(
              'assets/images/home.png',
            ),
          ),
          InkWell(
            child: Image.asset(
              'assets/images/contenido.png',
            ),
          ),
          InkWell(
            child: Image.asset(
              'assets/images/ejercicio.png',
            ),
          ),
          InkWell(
            child: Image.asset(
              'assets/images/creditos.png',
            ),
          )
        ],
      ),
    );
  }
}
