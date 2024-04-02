import 'package:flutter/material.dart';

class myAppBar extends AppBar {
  String texto;
  myAppBar({required this.texto}) : super(title: Text(texto));
}
