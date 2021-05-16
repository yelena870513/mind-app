
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreditosScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 80),
      child: Column(

        children: <Widget>[
          Text(
            '  Enfermedad'.toUpperCase(),
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 40,
              letterSpacing: 0.2,
              color: Colors.white,
              fontFamily: 'Tippa',
            ),
          ),
          Text(
            'de Alzheimer'.toUpperCase(),
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 40,
                letterSpacing: 0.27,
                color: Colors.white,
                fontFamily: 'Tippa'),
          ),


        ],
      ),
    );
  }

}