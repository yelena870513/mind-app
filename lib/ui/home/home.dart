import 'package:boilerplate/widgets/bounce_tab_bar.dart';
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
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          Container(
            color: Colors.red[200],
          ),
          Container(
            color: Colors.black12,
          ),
          Container(
            color: Colors.lightGreenAccent,
          ),
          Container(
            color: Colors.purple[100],
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
        backgroundColor: Colors.purple,
        items: <Widget>[
          Icon(
            Icons.person_outline,
            color: Colors.white,
          ),
          Icon(Icons.message, color: Colors.white),
          Icon(Icons.print, color: Colors.white),
          Icon(Icons.settings, color: Colors.white),
        ],
      ),
    );
  }
}
