import 'package:boilerplate/screens/fitness_screen.dart';
import 'package:boilerplate/screens/team_time_line.dart';
import 'package:boilerplate/widgets/bounce_tab_bar.dart';
import 'package:boilerplate/widgets/fitness_screen.dart';
import 'package:boilerplate/widgets/running_view.dart';
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
    const int count = 5;
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
            child:  FitnessScreen(),
          ),

          Container(
            color: Colors.green[100],
            child: TeamTimeLine(),
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
            Icons.home,
            color: Colors.white,
          ),
          Icon(Icons.collections_bookmark, color: Colors.white),
          Icon(Icons.accessibility, color: Colors.white),
          Icon(Icons.people, color: Colors.white),
        ],
      ),
    );
  }
}
