import 'package:boilerplate/screens/screen_widgets/popular_course_list_view.dart';
import 'package:flutter/material.dart';

class PopularCourseWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Popular Course',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              letterSpacing: 0.27,
              color: Colors.black87,
            ),
          ),
          Flexible(
            child: PopularCourseListView(
              callBack: () {},
            ),
          )
        ],
      ),
    );
  }
}
