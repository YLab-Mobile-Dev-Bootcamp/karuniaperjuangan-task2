import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StateController extends GetxController{
  var firstColor = Colors.lightBlue[500].obs;
  changeColor(Color color) => firstColor.value = color;

  var name = "Pengunjung".obs;
  changeName(String newName) => name.value = newName;
}

