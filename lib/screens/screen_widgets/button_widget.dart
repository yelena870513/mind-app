import 'package:boilerplate/constants/category_type.dart';
import 'package:boilerplate/constants/colors.dart';
import 'package:flutter/material.dart';



class ButtonWidget extends StatelessWidget {
  final CategoryType categoryTypeData;
  final bool isSelected;

  const ButtonWidget({Key key, this.categoryTypeData, this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    String txt = '';
    if (CategoryType.ui == categoryTypeData) {
      txt = 'Ui/Ux';
    } else if (CategoryType.coding == categoryTypeData) {
      txt = 'Coding';
    } else if (CategoryType.basic == categoryTypeData) {
      txt = 'Basic UI';
    }
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: isSelected
                ? const Color(0xFF00B6F0)
                : const Color(0xFFFFFFFF),
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            border: Border.all(color: const Color(0xffcccccc))),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white24,
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 12, bottom: 12, left: 18, right: 18),
              child: Center(
                child: Text(
                  txt,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    letterSpacing: 0.27,
                    color: isSelected
                        ? const Color(0xFF00B6F0)
                        : const Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
