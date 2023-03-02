
import 'package:advanced_update_delete_insert/screen/home/provider/modal_.dart';
import 'package:advanced_update_delete_insert/screen/home/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(
    ChangeNotifierProvider(
        create: (context) => HomeProvider(),
    child:MaterialApp(
  debugShowCheckedModeBanner:false,
  routes: {
    '/': (context)=>homescreen(),
  },
  ),
  ),
  );
}