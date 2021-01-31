import 'package:boilerplate/constants/category_type.dart';
import 'package:boilerplate/screens/screen_widgets/button_widget.dart';
import 'package:boilerplate/stores/contenido/contenido_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'category_list_view.dart';

class CategoryWidget extends StatefulWidget {
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<CategoryWidget> {
  ContenidoStore _contenidoStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _contenidoStore = Provider.of<ContenidoStore>(context);
  }

  @override
  Widget build(BuildContext context) {
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
        CategoryListView(
          callBack: () {},
        ),
      ],
    );
  }
}
