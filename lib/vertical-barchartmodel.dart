import 'package:flutter/material.dart';

class VBarChartModel {
  final int index;
  //used for touch animation
  //
  //
  //
  final String label;
  //text shown on left side of bar
  //
  //
  //
  final String tooltip;
  //text shown on right side of bar
  //
  //
  //
  final double jumlah;
  //size of bar
  //
  //
  //
  final List<Color> colors;
  //Colors of bar, liniergradient start from left to right
  //
  //
  //

  const VBarChartModel({
    this.index,
    this.label,
    this.tooltip,
    this.jumlah = 0,
    this.colors = const [Colors.teal, Colors.indigo],
  });
}
