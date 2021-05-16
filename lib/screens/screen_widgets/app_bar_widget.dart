import 'package:auto_size_text/auto_size_text.dart';
import 'package:boilerplate/constants/font_family.dart';
import 'package:boilerplate/stores/font/font_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';
import 'package:validators/validators.dart';

class AppBarWidget extends StatefulWidget {
  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget>{
  FontStore _fontStore;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _fontStore = Provider.of<FontStore>(context);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0, left: 18, right: 18, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AutoSizeText(
                  '   Enfermedad'.toUpperCase(),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: ScreenUtil().setSp(22),
                    letterSpacing: 0.2,
                    color: Colors.white,
                    fontFamily: FontFamily.tippa,
                  ),
                ),
                AutoSizeText(
                  ' de Alzheimer'.toUpperCase(),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(22),
                      letterSpacing: 0.27,
                      color: Colors.white,
                      fontFamily: FontFamily.tippa),
                ),

              ],
            ),

          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () {
                print('incremento');
                _fontStore.incrementFontSizeCreditoCargo();
                _fontStore.incrementFontSizeContenido();
                _fontStore.incrementFontSizeBuscadorResultado();
                _fontStore.incrementFontSizeTitulo();
              },
              child: Icon(
                Icons.zoom_in,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              print('decremento');
              _fontStore.decrementFontSizeCreditoCargo();
              _fontStore.decrementFontSizeContenido();
              _fontStore.decrementFontSizeBuscadorResultado();
              _fontStore.decrementFontSizeTitulo();

            },
            child: Center(
              child: Icon(
                Icons.zoom_out,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}



