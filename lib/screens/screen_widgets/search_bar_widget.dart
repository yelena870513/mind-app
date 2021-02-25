import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/constants/font_family.dart';
import 'package:boilerplate/stores/contenido/contenido_store.dart';
import 'package:boilerplate/stores/font/font_store.dart';
import 'package:boilerplate/utils/device/device_utils.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';

class SearchBarWidget extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBarWidget> {
  ContenidoStore _contenidoStore;
  FontStore _fontStore;
  final _searchFormKey = GlobalKey<FormState>();
  FocusNode _searchFocusNode;
  final TextEditingController _userSearchController =
      new TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchFocusNode = FocusNode();
    _userSearchController.addListener(_printValue);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _contenidoStore ??= Provider.of<ContenidoStore>(context);
    _fontStore ??= Provider.of<FontStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    String placeholder = 'Buscar...';
    if (_contenidoStore.hidePlaceholder) {
      placeholder = '';
    }
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 64,
            child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffF8FAFB),
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(5.0),
                    bottomLeft: Radius.circular(5.0),
                    topLeft: Radius.circular(5.0),
                    topRight: Radius.circular(5.0),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Form(
                            key: _searchFormKey,
                            child: TextFormField(
                              cursorColor: const Color(0xffBC53FA),
                              textInputAction: TextInputAction.done,
                              controller: _userSearchController,
                              style: TextStyle(
                                fontFamily: FontFamily.latto,
                                fontWeight: FontWeight.bold,
                                fontSize: ScreenUtil()
                                    .setSp(_fontStore.fontSizeContenido),
                                color: Colors.black,
                              ),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                helperStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: FontFamily.latto,
                                  fontSize: 16,
                                  color: Color.fromRGBO(69, 0, 117, 0.6),
                                ),
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: ScreenUtil()
                                      .setSp(_fontStore.fontSizeContenido),
                                  letterSpacing: 0.2,
                                  color: Color.fromRGBO(69, 0, 117, 0.6),
                                ),
                              ),
                              onEditingComplete: () {},
                              onChanged: (vale) {
                                if (vale.isNotEmpty) {
                                  _contenidoStore.hidenPlaceholder(true);
                                } else {
                                  _contenidoStore.hidenPlaceholder(false);
                                }
                              },
                              focusNode: _searchFocusNode,
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: InkWell(
                        child: Observer(
                          builder: (context) {
                            Widget result =
                                Icon(Icons.search, color: AppColors.search);
                            if (_contenidoStore.searchTerm.isNotEmpty) {
                              result =
                                  Icon(Icons.close, color: AppColors.search);
                            }
                            return result;
                          },
                        ),
                        onTap: () {
                          if (_contenidoStore.searchTerm.isEmpty) {
                            DeviceUtils.hideKeyboard(context);
                            if (_userSearchController.value.text.length < 3 &&
                                _userSearchController.value.text.length > 0) {
                              _showErrorMessage(
                                  'Introduzca al menos 3 caracteres', context);
                            } else {
                              _contenidoStore.setSearchTerm(
                                  _userSearchController.value.text);
                              _userSearchController.clear();
                            }
                          } else {
                            _contenidoStore.setSearchTerm('');
                            _userSearchController.clear();
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const Expanded(
            child: SizedBox(),
          )
        ],
      ),
    );
  }

  _showErrorMessage(String message, context) {
    Future.delayed(Duration(milliseconds: 0), () {
      if (message != null && message.isNotEmpty) {
        Flushbar(
          title: '',
          message: message,
          messageText: Container(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              message,
              style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(_fontStore.fontSizeContenido),
                fontFamily: FontFamily.latto,
              ),
            ),
          ),
          backgroundColor: Color(0xff450075),
          icon: Icon(
            Icons.warning,
            size: 28.0,
            color: Colors.white,
          ),
          leftBarIndicatorColor: Colors.purple[200],
          duration: Duration(seconds: 4),
        )..show(context);
      }
    });

    return SizedBox.shrink();
  }

  _printValue() {
    print("${_userSearchController.text}");
  }
}
