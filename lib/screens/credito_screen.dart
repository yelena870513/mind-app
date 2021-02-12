


import 'package:boilerplate/screens/screen_widgets/credito_view.dart';
import 'package:boilerplate/screens/screen_widgets/header_widget.dart';
import 'package:flutter/material.dart';

class CreditoScreen extends StatelessWidget{
  final double toolbarHeight;

  const CreditoScreen({Key key, this.toolbarHeight}) : super(key: key);
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
            (MediaQuery.of(context).size.height - toolbarHeight) - 40,
            margin: EdgeInsets.only(top: toolbarHeight),
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
                  child: Column(
                    children: <Widget>[
                      CreditoView(),
                    ],
                  ),
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