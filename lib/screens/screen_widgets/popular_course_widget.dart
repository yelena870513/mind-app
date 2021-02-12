import 'package:boilerplate/screens/screen_widgets/popular_course_list_view.dart';
import 'package:boilerplate/stores/contenido/contenido_store.dart';
import 'package:boilerplate/stores/ejercicio/ejercicio_store.dart';
import 'package:boilerplate/ui/ejercicio/ejercicio_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PopularCourseWidget extends StatefulWidget {
  _PopularCourseWidget createState() => _PopularCourseWidget();
}

class _PopularCourseWidget extends State<PopularCourseWidget> {
  ContenidoStore _contenidoStore;
  EjercicioStore _ejercicioStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _contenidoStore ??= Provider.of<ContenidoStore>(context);
    _ejercicioStore ??= Provider.of<EjercicioStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Contenidos',
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
              callBack: () {
                Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) {
                  return FadeTransition(
                    opacity: animation1,
                    child: EjercicioVista(),
                  );
                }));
              },
            ),
          )
        ],
      ),
    );
  }
}
