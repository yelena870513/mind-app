import 'package:boilerplate/constants/category_type.dart';
import 'package:boilerplate/stores/contenido/contenido_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonWidget extends StatelessWidget {
  final CategoryType categoryTypeData;
  final bool isSelected;

  const ButtonWidget({Key key, this.categoryTypeData, this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String txt = '';
    switch (categoryTypeData) {
      case CategoryType.acuaticos:
        txt = 'Acuáticos';
        break;
      case CategoryType.escalera:
        txt = 'Escalera';
        break;
      case CategoryType.tobillos:
        txt = 'Tobillos';
        break;
      case CategoryType.tronco:
        txt = 'Tronco';
        break;
      case CategoryType.matutino:
        txt = 'Matutino';
        break;
      case CategoryType.vespertino:
        txt = 'Vespertino';
        break;
      case CategoryType.rodillas:
        txt = 'Rodillas';
        break;
      case CategoryType.manos:
        txt = 'Manos';
        break;
      case CategoryType.hombros:
        txt = 'Hombros';
        break;
      default:
        break;
    }
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: isSelected
                ? const Color.fromRGBO(69, 0, 117, 0.6)
                : const Color(0xFFFFFFFF),
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            border: Border.all(color: const Color(0xffcccccc))),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white24,
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            onTap: () {
              ContenidoStore _contenido =
                  Provider.of<ContenidoStore>(context, listen: false);
              _contenido.setCategoryType(categoryTypeData);
            },
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
                        ? const Color.fromRGBO(69, 0, 117, 0.6)
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
