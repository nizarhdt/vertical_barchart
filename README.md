# vertical_barchart

<h4 align="center">
  Need large item on bar chart? Here is Vertical BarChart, simple, responsive and beautiful chart. Expanded Height make this chart more dynamics.
</h4>

<p align="center">
  <a href="#key-features">Key Features</a> •
  <a href="https://github.com/nizarhdt/vertical_barchart/tree/master/example">Examples</a>
</p>

<p align="center">
  <img src="https://github.com/nizarhdt/vertical_barchart/blob/master/screenshot/ss-simple.png?raw=true" height="400" alt="Vertical BarChart" />
</p>

## Key Features

- Easy to use
- Vertical responsive bars
- Initial and touch animation
- Legend
- Bars Description

## packages.yaml

```yaml
vertical_barchart: <lastest version>
```

## Import

```dart
import 'package:vertical_barchart/vertical_barchart.dart';
```

## Simple implementation

```dart
List<VBarChartModel> bardata = [
    VBarChartModel(
      index: 0,
      label: "Strawberry",
      colors: [Colors.orange, Colors.deepOrange],
      jumlah: 20,
      tooltip: "20 Pcs",
      description: Text(
        "Most selling fruit last week",
        style: TextStyle(fontSize: 10),
      ),
    ),
    VBarChartModel(
      index: 1,
      label: "Apple",
      colors: [Colors.orange, Colors.deepOrange],
      jumlah: 55,
      tooltip: "55 Pcs",
      description: Text(
        "Most selling fruit this week",
        style: TextStyle(fontSize: 10),
      ),
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
      description: Text(
        "Favorites vegetables",
        style: TextStyle(fontSize: 10),
      ),
    ),
  ];

VerticalBarchart(
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
    ),
```

Example `alwaysShowDescription` and `showBackdrop`:

```dart
VerticalBarchart(
      maxX: 55,
      data: bardata,
      showLegend: true,
      alwaysShowDescription: true,
      showBackdrop: true,
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
    ),
```

<img src="https://github.com/nizarhdt/vertical_barchart/blob/master/screenshot/Screenshot_20210322-092328.png?raw=true" height="400" alt="Vertical BarChart Example" />

| Properties              | Description                                                                                             |
| ----------------------- | ------------------------------------------------------------------------------------------------------- |
| `background`            | Background color of the container                                                                       |
| `labelColor`            | Color of the label, default is `Colors.indigo`                                                          |
| `tooltipColor`          | Color of the tooltip shown at right side of bar, default is `COlors.indigo`                             |
| `tooltipSize`           | Tooltip width                                                                                           |
| `maxX`                  | Maximum size of bars, use your `List<VBarChartModel>` biggest value, or you can choose more than it.    |
| `labelSizeFactor`       | Width of label space reserved, range is from 0.0 - 0.5, default is 0.33                                 |
| `showLegend`            | Show or hide legend, the legend must not be null.                                                       |
| `data`                  | Your Bar Data.                                                                                          |
| `legend`                | Legend data, use legend as group of colors of the bar.                                                  |
| `legendPosition`        | Position of legend, `LegendPosition.TOP` or `LegendPosition.BOTTOM`, default is `LegendPosition.BOTTOM` |
| `alwaysShowDescription` | Show or hide all description, `true` will override the tapping function on bars                         |
| `showBackdrop`          | Show or hide backdrop of bars                                                                           |
| `backdropColor`         | Set custom colors of backdrop                                                                           |

## Support

I would be very grateful if you buy me a cup of coffee.

<a href="https://www.buymeacoffee.com/nizarhdt" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/guidelines/download-assets-2.svg" alt="Buy Me A Coffee" style="height: 41px !important;" ></a>
