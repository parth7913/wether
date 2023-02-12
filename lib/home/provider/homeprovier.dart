import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../model/daymodel.dart';

class HomeProvider extends ChangeNotifier {
  TextEditingController txtcity = TextEditingController();
  String? city;

  void search() {
    city = txtcity.text;
    notifyListeners();
  }
}
