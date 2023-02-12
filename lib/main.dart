import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home/provider/homeprovier.dart';
import 'home/view/homepage.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => HomePage(),
        },
      ),
    ),
  );
}
//0e36147a0804ae8b76e6c542200fd14b
