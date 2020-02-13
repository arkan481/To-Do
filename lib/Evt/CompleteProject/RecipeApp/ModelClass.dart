
import 'package:flutter/cupertino.dart';

class ModelClass {
  List<String> steps;
  List<String> ingridients;
  String image;
  String title;
  ModelClass(this.title,this.ingridients,this.steps,this.image);


  String gettitle() {
    return this.title;
  }
  String getimage() {
    return this.image;
  }
}