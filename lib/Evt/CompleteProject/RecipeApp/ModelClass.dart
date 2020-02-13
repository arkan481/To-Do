
import 'package:flutter/cupertino.dart';

class ModelClass {
  List<String> steps;
  List<String> ingridients;
  String image;
  String title;
  ModelClass(this.title,this.ingridients,this.steps,this.image);

  void settitle(String title) {
    this.title=title;
  }
  void setingridients(List<String>ingridients) {
    this.ingridients = ingridients;
  }
  void setimage(String image) {
    this.image = image;
  }
  void setsteps(List<String> steps) {
    this.steps = steps;
  }
  String gettitle() {
    return this.title;
  }
  String getimage() {
    return this.image;
  }
  List<String> getingridients() {
    return this.ingridients;
  }
  List<String> getsteps() {
    return this.steps;
  }
}