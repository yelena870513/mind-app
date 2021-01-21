import 'package:boilerplate/constants/category_type.dart';
import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/screens/screen_widgets/button_widget.dart';
import 'package:flutter/material.dart';

import 'category_list_view.dart';

class CategoryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 18, right: 16),
          child: Text(
            'Ejercicios',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              letterSpacing: 0.27,
              color: Colors.orange,
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Row(
            children: <Widget>[
              ButtonWidget(
                categoryTypeData: CategoryType.ui,
                isSelected: true,
              ),
              const SizedBox(
                width: 16,
              ),
              ButtonWidget(
                categoryTypeData: CategoryType.coding,
                isSelected: false,
              ),
              const SizedBox(
                width: 16,
              ),
              ButtonWidget(
                categoryTypeData: CategoryType.basic,
                isSelected: false,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        CategoryListView(
          callBack: () {},
        ),
      ],
    );
  }
}
