import 'package:boilerplate/screens/screen_widgets/app_bar_widget.dart';
import 'package:boilerplate/screens/screen_widgets/category_widget.dart';
import 'package:boilerplate/screens/screen_widgets/popular_course_widget.dart';
import 'package:boilerplate/screens/screen_widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class FitnessScreen extends StatefulWidget {
  @override
  _FitnessScreenState createState() => _FitnessScreenState();
}

class _FitnessScreenState extends State<FitnessScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: const Color(0xFF00B6F0),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          AppBarWidget(),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.8,
                child: Column(
                  children: <Widget>[
                    SearchBarWidget(),
                    CategoryWidget(),
                    Flexible(
                      child: PopularCourseWidget(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
