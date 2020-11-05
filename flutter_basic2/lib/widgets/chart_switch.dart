import 'package:flutter/material.dart';

class ChartSwitch extends StatelessWidget {
  final Function changeChartSwitch;
  final bool showChart;
  ChartSwitch(this.changeChartSwitch, this.showChart);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Show Chart',
          style: Theme.of(context).textTheme.headline6,
        ),
        Switch.adaptive(
          activeColor: Theme.of(context).accentColor,
          value: showChart,
          onChanged: (val) {
            changeChartSwitch(val);
          },
        ),
      ],
    );
  }
}
