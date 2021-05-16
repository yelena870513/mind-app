import 'package:boilerplate/screens/screen_widgets/credito_view.dart';
import 'package:boilerplate/screens/screen_widgets/header_widget.dart';
import 'package:boilerplate/stores/font/font_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CreditoScreen extends StatefulWidget {
  final double toolbarHeight;
  final double fontSizeMainHeader;

  @override
  _CreditoScreenState createState() => _CreditoScreenState();

  const CreditoScreen({Key key, this.toolbarHeight, this.fontSizeMainHeader})
      : super(key: key);
}

class _CreditoScreenState extends State<CreditoScreen> {
  FontStore _fontStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _fontStore = Provider.of<FontStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Container(
        child: Stack(
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              color: const Color(0xff450075),
              margin: EdgeInsets.only(
                  top: 50, left: MediaQuery.of(context).size.width - 60),
            ),
            HeaderWidget(
              fontSizeMainHeader: _fontStore.fontSizeMainHeader,
            ),
            Container(
                height: (MediaQuery.of(context).size.height -
                        widget.toolbarHeight) -
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
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(top: 23.0),
                      child: CreditoView(
                        fontSizeContenido: _fontStore.fontSizeContenido,
                        fontSizeCreditoCargo: _fontStore.fontSizeCreditoCargo,
                        fontSizeTitulo: _fontStore.fontSizeTitulo,
                      ),
                    )
                  ],
                )),
          ],
        ),
        color: Colors.white10,
      ),
    );
  }
}
