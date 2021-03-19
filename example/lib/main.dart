import 'package:flutter/material.dart';
import 'package:vertical_barchart/vertical-barchart.dart';
import 'package:vertical_barchart/vertical-barchartmodel.dart';
import 'package:vertical_barchart/vertical-legend.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(
        title: "Vertical Barchart",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<VBarChartModel> bardata = [
    VBarChartModel(
      index: 0,
      label: "Strawberry",
      colors: [Colors.orange, Colors.deepOrange],
      jumlah: 20,
      tooltip: "20 Pcs",
    ),
    VBarChartModel(
      index: 1,
      label: "Apple",
      colors: [Colors.orange, Colors.deepOrange],
      jumlah: 55,
      tooltip: "55 Pcs",
    ),
    VBarChartModel(
      index: 2,
      label: "Broccoli",
      colors: [Colors.teal, Colors.indigo],
      jumlah: 12,
      tooltip: "12 Pcs",
    ),
    VBarChartModel(
      index: 3,
      label: "Chilli",
      colors: [Colors.teal, Colors.indigo],
      jumlah: 5,
      tooltip: "5 Pcs",
    ),
    VBarChartModel(
      index: 4,
      label: "Manggo",
      colors: [Colors.orange, Colors.deepOrange],
      jumlah: 15,
      tooltip: "15 Pcs",
    ),
    VBarChartModel(
      index: 5,
      label: "Asparagus",
      colors: [Colors.teal, Colors.indigo],
      jumlah: 30,
      tooltip: "30 Pcs",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? ""),
      ),
      body: Container(
          height: 200,
          child: Column(
            children: [
              _buildGrafik(bardata),
            ],
          )),
    );
  }

  Widget _buildGrafik(List<VBarChartModel> bardata) {
    return VerticalBarchart(
      maxX: 55,
      data: bardata,
      showLegend: true,
      legend: [
        Vlegend(
          isSquare: false,
          color: Colors.orange,
          text: "Fruits",
        ),
        Vlegend(
          isSquare: false,
          color: Colors.teal,
          text: "Vegetables",
        )
      ],
    );
  }
}
