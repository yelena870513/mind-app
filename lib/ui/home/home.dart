import 'package:boilerplate/screens/contenido_screen.dart';
import 'package:boilerplate/screens/credito_screen.dart';

import 'package:boilerplate/screens/tema_screen.dart';
import 'package:boilerplate/stores/font/font_store.dart';
import 'package:boilerplate/widgets/bounce_tab_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _homeAnimation;

  //stores:---------------------------------------------------------------------
  int _currentIndex = 0;
  FontStore _fontStore;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 7,
      ),
    );
    _homeAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn);

    _animationController.forward();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _fontStore = Provider.of<FontStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    final double toolbarHeight = kToolbarHeight + 50;
    final query = MediaQuery.of(context);
    return MediaQuery(
      data: query.copyWith(
        textScaleFactor: query.textScaleFactor.clamp(1.0, 1.4),
      ),
      child: Theme(
        data: ThemeData.light(),
        child: Scaffold(
          extendBody: true,
          resizeToAvoidBottomInset: false,
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
                        child: FadeTransition(
                          opacity: _homeAnimation,
                          child: Image.asset(
                            'assets/images/fondo.png',
                            fit: BoxFit.contain,
                          ),
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
                child: CreditoScreen(
                  toolbarHeight: toolbarHeight,
                  fontSizeMainHeader: _fontStore.fontSizeMainHeader,
                ),
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
        ),
      ),
    );
  }
}
