import 'package:flutter/material.dart';
import 'package:vertical_barchart/vertical-barchartmodel.dart';
import 'package:vertical_barchart/vertical-legend.dart';

class VerticalBarchart extends StatefulWidget {
  final Color? background;
  //Background color of the container
  //
  //
  //
  final Color? labelColor;
  //Color of the label, default is Colors.indigo
  //
  //
  //
  final Color? tooltipColor;
  //Color of the tooltip shown at right side of bar, default is COlors.indigo
  //
  //
  //
  final double maxX;
  //Maximum size of bars, use your List<VBarChartModel> biggest value, or you can choose more than it. default is 20
  //
  //
  //
  final double labelSizeFactor;
  //Width of label space reserved, range is from 0.0 - 0.5, default is 0.33
  //
  //
  //
  final bool showLegend;
  //Show or hide legend, the legend must not be null.
  //
  //
  //
  final List<VBarChartModel>? data;
  //Your Bar Data.
  //
  //
  //
  final List<Vlegend>? legend;
  //Legend data, use legend as group of colors of the bar.
  //
  //
  //
  final LegendPosition? legendPosition;
  //Position of legend, LegendPosition.TOP or LegendPosition.BOTTOM, default is LegendPosition.BOTTOM
  //
  //
  //
  final double tooltipSize;
  //Width of tooltip
  //
  //
  //

  const VerticalBarchart({
    Key? key,
    this.maxX = 20,
    this.data,
    this.labelSizeFactor = 0.33,
    this.background = Colors.white,
    this.showLegend = false,
    this.legend,
    this.labelColor = Colors.indigo,
    this.tooltipColor = Colors.indigo,
    this.legendPosition = LegendPosition.BOTTOM,
    this.tooltipSize = 40
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => VerticalBarchartState();
}

class VerticalBarchartState extends State<VerticalBarchart> {
  late double width;
  double sizePadding = 10;
  int touchIndex = -1;
  double animWidth = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 200)).then((value) => setState(() {
          animWidth = 1;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      width = constraints.biggest.width;
      List<Widget> isi = [];
      if (widget.showLegend && widget.legendPosition == LegendPosition.TOP) {
        try {
          isi.add(
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Wrap(
                runSpacing: 6,
                spacing: 20,
                alignment: WrapAlignment.center,
                children: widget.legend!,
              ),
            ),
          );
        } catch (Exception) {
          print("Legend not found");
        }
      }

      try {
        if (widget.data!.length > 0) {
          widget.data!.forEach((e) {
            isi.add(GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTapDown: (a) {
                setState(() {
                  touchIndex = e.index!;
                });
              },
              onTapCancel: () {
                setState(() {
                  touchIndex = -1;
                });
              },
              onTapUp: (a) {
                setState(() {
                  touchIndex = -1;
                });
              },
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: _barData(e.label, widget.labelColor, e.tooltip,
                      widget.tooltipColor, e.jumlah, e.colors, e.index)),
            ));
          });
        } else {
          isi.add(Container());
        }
      } catch (Exception) {
        isi.add(Container(
          color: widget.background,
          child: Text(
            "Nothing to display.",
            style: TextStyle(fontSize: 12),
          ),
        ));
      }

      if (widget.showLegend && widget.legendPosition == LegendPosition.BOTTOM) {
        try {
          isi.add(
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Wrap(
                runSpacing: 6,
                spacing: 20,
                alignment: WrapAlignment.center,
                children: widget.legend!,
              ),
            ),
          );
        } catch (Exception) {
          print("Legend not found");
        }
      }

      return Container(
        padding: EdgeInsets.all(sizePadding),
        color: widget.background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: isi,
        ),
      );
    });
  }

  Widget _barData(String? label, Color? labelColor, String? tooltip,
      Color? tooltipColor, double jml, List<Color>? colors, int? index) {
    double maxLabel =
        widget.labelSizeFactor > 0.5 ? 0.5 : widget.labelSizeFactor;
    double sizeLabel = width * maxLabel - 16 - (sizePadding * 2);
    double sizeFullBar =
        width - sizeLabel - widget.tooltipSize - 16 - (sizePadding * 2);
    double sizeBar = jml / widget.maxX * sizeFullBar;
    double offSetX = widget.maxX - jml + 1;
    double sizeBarHeight = 8;

    return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
      SizedBox(
        width: sizeLabel,
        child: Text(
          label ?? "",
          textAlign: TextAlign.end,
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.bold, color: labelColor),
        ),
      ),
      SizedBox(
        width: 8,
      ),
      AnimatedContainer(
        width: sizeBar * animWidth,
        height: touchIndex == index ? sizeBarHeight + 5 : sizeBarHeight,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(offSetX, 1.0),
              colors: colors ?? [Colors.teal, Colors.indigo],
            ),
            color: Colors.teal),
        duration: Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
      ),
      SizedBox(
        width: 8,
      ),
      SizedBox(
        width: widget.tooltipSize,
        child: Text(
          tooltip ?? "",
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.bold, color: tooltipColor),
        ),
      ),
    ]);
  }
}

enum LegendPosition { TOP, BOTTOM }
