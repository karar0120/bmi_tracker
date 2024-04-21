import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class BmiFrom extends StatefulWidget {
  const BmiFrom({super.key});

  @override
  State<BmiFrom> createState() => _BmiFromState();
}

class _BmiFromState extends State<BmiFrom> {
  @override
  Widget build(BuildContext context) {
    double value = 40.0;

    return Scaffold(
      body: SfSlider.vertical(
        min: 0.0,
        max: 100.0,
        value: value,
        interval: 20,
        showTicks: true,
        showLabels: true,
        enableTooltip: true,
        minorTicksPerInterval: 1,
        onChanged: (dynamic value) {
          setState(() {
            value = value;
          });
        },
      ),
    );
  }
}
