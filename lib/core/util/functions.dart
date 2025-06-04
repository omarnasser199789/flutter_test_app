import 'package:flutter/material.dart';

Future<dynamic> goTo(BuildContext context, WidgetBuilder builder) async {

  var res= await Navigator.push(
    context,
    MaterialPageRoute(builder:builder),
  );
  return res;
}