import 'package:boilerplate/stores/ejercicio/ejercicio_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'category_view_widget.dart';

class CategoryListView extends StatefulWidget {
  const CategoryListView({Key key, this.callBack}) : super(key: key);

  final Function callBack;

  @override
  _CategoryListViewState createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView>
    with TickerProviderStateMixin {
  AnimationController animationController;
  EjercicioStore _ejercicioStore;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _ejercicioStore = Provider.of<EjercicioStore>(context);
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      child: Container(
        height: 134,
        width: double.infinity,
        child: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return ListView.builder(
                padding: const EdgeInsets.only(
                    top: 0, bottom: 0, right: 16, left: 16),
                itemCount: _ejercicioStore.temas.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final int count = _ejercicioStore.temas.length > 10
                      ? 10
                      : _ejercicioStore.temas.length;
                  final Animation<double> animation =
                      Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: animationController,
                              curve: Interval((1 / count) * index, 1.0,
                                  curve: Curves.fastOutSlowIn)));
                  animationController.forward();

                  return CategoryView(
                    category: _ejercicioStore.temas[index],
                    animation: animation,
                    animationController: animationController,
                    callback: () {
                      widget.callBack();
                      _ejercicioStore
                          .setSelectedTema(_ejercicioStore.temas[index]);
                      _ejercicioStore
                          .setSelectedTema(_ejercicioStore.temas[index]);
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
