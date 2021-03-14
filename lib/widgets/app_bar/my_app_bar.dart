import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  MyAppBar({Key key, title}) : super(key: key, title: title);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
    );
  }
}
