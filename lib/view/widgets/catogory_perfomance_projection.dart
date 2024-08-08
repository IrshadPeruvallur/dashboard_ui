import 'package:dashboard_ui/model/sale_model.dart';
import 'package:dashboard_ui/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CatogoryPerfomanceProjection extends StatelessWidget {
  const CatogoryPerfomanceProjection({super.key});

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
            text: 'Category Performance Projection V/S Actuais',
            overflow: true,
            fontWeight: FontWeight.w600,
          ),
          Flexible(
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              primaryYAxis: NumericAxis(
                minimum: 0,
                maximum: 3000,
                interval: 500,
              ),
              legend: Legend(
                isVisible: true,
                position: LegendPosition.bottom,
              ),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <CartesianSeries>[
                ColumnSeries<SalesData, String>(
                  legendIconType: LegendIconType.rectangle,
                  name: 'Target',
                  dataSource: getTargetData(),
                  xValueMapper: (SalesData data, _) => data.category,
                  yValueMapper: (SalesData data, _) => data.value,
                  color: Color.fromARGB(255, 21, 76, 121),
                ),
                ColumnSeries<SalesData, String>(
                  legendIconType: LegendIconType.rectangle,
                  name: 'Projection',
                  dataSource: getProjectionData(),
                  xValueMapper: (SalesData data, _) => data.category,
                  yValueMapper: (SalesData data, _) => data.value,
                  color: Color.fromARGB(255, 31, 45, 86),
                ),
                ColumnSeries<SalesData, String>(
                  legendIconType: LegendIconType.rectangle,
                  name: 'Actual',
                  dataSource: getActualData(),
                  xValueMapper: (SalesData data, _) => data.category,
                  yValueMapper: (SalesData data, _) => data.value,
                  color: Color.fromARGB(255, 116, 165, 57),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<SalesData> getTargetData() {
    return [
      SalesData('Beauty Toys', 1100),
      SalesData('Computer', 2000),
      SalesData('Dress', 1100),
      SalesData('Grocery', 1100),
      SalesData('Home Appliances', 1100),
    ];
  }

  List<SalesData> getProjectionData() {
    return [
      SalesData('Beauty Toys', 0),
      SalesData('Computer', 0),
      SalesData('Dress', 0),
      SalesData('Grocery', 0),
      SalesData('Home Appliances', 0),
    ];
  }

  List<SalesData> getActualData() {
    return [
      SalesData('Beauty Toys', 0),
      SalesData('Computer', 250),
      SalesData('Dress', 0),
      SalesData('Grocery', 2823),
      SalesData('Home Appliances', 0),
    ];
  }
}
