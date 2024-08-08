import 'package:dashboard_ui/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RevenueChart extends StatelessWidget {
  final String heading;
  final List<SalesData> chartData;
  final Map<String, Color> categoryColors;

  const RevenueChart({
    Key? key,
    required this.chartData,
    required this.categoryColors,
    required this.heading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color.fromARGB(255, 233, 233, 233),
          width: 1,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(7)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomText(
            textAlign: TextAlign.start,
            maxWidth: size.width <= 550 ? double.infinity : size.width * 0.4,
            overflow: true,
            text: heading,
            fontWeight: FontWeight.w600,
          ),
          Flexible(
            child: SfCircularChart(
              legend: Legend(
                isVisible: true,
                position: LegendPosition.bottom,
                legendItemBuilder:
                    (String name, dynamic series, dynamic point, int index) {
                  SalesData data = chartData[index];
                  return Row(
                    children: <Widget>[
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: categoryColors[data.category],
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text('${data.category}: ${data.value}'),
                    ],
                  );
                },
              ),
              series: <CircularSeries>[
                DoughnutSeries<SalesData, String>(
                  legendIconType: LegendIconType.rectangle,
                  dataSource: chartData,
                  xValueMapper: (SalesData data, _) => data.category,
                  yValueMapper: (SalesData data, _) => data.value,
                  dataLabelSettings: const DataLabelSettings(
                    isVisible: false,
                  ),
                  innerRadius: '60%',
                  pointColorMapper: (SalesData data, _) =>
                      categoryColors[data.category] ?? Colors.grey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SalesData {
  final String category;
  final double value;

  SalesData(this.category, this.value);
}
