import 'package:boilerplate/constants/font_family.dart';
import 'package:boilerplate/stores/contenido/contenido_store.dart';
import 'package:boilerplate/stores/font/font_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';
import 'package:boilerplate/screens/screen_widgets/contenido_view.dart';
import 'screen_widgets/header_widget.dart';
import 'screen_widgets/search_bar_widget.dart';

class ContenidoScreen extends StatefulWidget {
  final double toolbarHeight;

  ContenidoScreen(this.toolbarHeight);

  @override
  _ContenidoScreenState createState() => _ContenidoScreenState();
}

class _ContenidoScreenState extends State<ContenidoScreen>
    with TickerProviderStateMixin {
  ContenidoStore _contenidoStore;
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
    _contenidoStore = Provider.of<ContenidoStore>(context);
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
              child: Observer(
                builder: (context) {
                  Widget paintWidget = Container(
                      child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Sin Resultados',
                          style: TextStyle(
                            fontFamily: FontFamily.latto,
                            color: Color(0xff450075),
                            fontWeight: FontWeight.bold,
                            fontSize:
                                ScreenUtil().setSp(_fontStore.fontSizeTitulo),
                          ),
                        ),
                        Image.asset('assets/images/helpImage.png')
                      ],
                    ),
                  ));

                  if (_contenidoStore.contenidosCount > 0) {
                    paintWidget = SingleChildScrollView(
                      child: Container(
                        height: MediaQuery.of(context).size.height - 156 - 50,
                        padding: EdgeInsets.only(top: 5.0),
                        margin: EdgeInsets.only(top: 70.0),
                        child: ListView.builder(
                            padding: EdgeInsets.only(top: 30),
                            physics: const BouncingScrollPhysics(),
                            itemCount: _contenidoStore.contenidosCount,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) {
                              final int count =
                                  _contenidoStore.contenidosCount > 10
                                      ? 10
                                      : _contenidoStore.contenidosCount;
                              final Animation<double> animation =
                                  Tween<double>(begin: 0.0, end: 1.0).animate(
                                      CurvedAnimation(
                                          parent: animationController,
                                          curve: Interval(
                                              (1 / count) * index, 1.0,
                                              curve: Curves.fastOutSlowIn)));
                              animationController.forward();
                              return ContenidoView(
                                  _contenidoStore.contenidos[index],
                                  _contenidoStore.searchTerm,
                                  _fontStore.fontSizeTitulo,
                                  _fontStore.fontSizeContenido);
                            }),
                      ),
                    );
                  }

                  return paintWidget;
                },
              )),
          Container(
            margin: EdgeInsets.only(top: kToolbarHeight + 50),
            child: SearchBarWidget(),
          ),
        ],
      ),
      color: Colors.white10,
    );
  }
}
