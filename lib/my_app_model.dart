import 'package:flutter/material.dart';
import 'package:provider_with_select/global.dart';
import 'package:provider_with_select/post/post_model.dart';

class MyData extends ChangeNotifier {
  var one = 0;
  var two = 0;

  final list = ListModel(
    aspect: video_witness,
  );

  void morePosts() {
    list.morePosts(() => notifyListeners());
  }

  set one_one(v) {
    one = v;
    notifyListeners();
  }

  void incOne(){
    one += 1;
    notifyListeners();
  }

  void incTwo(){
    two += 1;
    notifyListeners();
  }
}

