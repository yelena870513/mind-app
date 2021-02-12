import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class AppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 18, right: 18, bottom: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '   Enfermedad'.toUpperCase(),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 22,
                    letterSpacing: 0.2,
                    color: Colors.white,
                    fontFamily: 'Tippa',
                  ),
                ),
                Text(
                  ' de Alzheimer'.toUpperCase(),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 22,
                      letterSpacing: 0.27,
                      color: Colors.white,
                      fontFamily: 'Tippa'),
                ),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}
