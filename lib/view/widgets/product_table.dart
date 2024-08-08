import 'package:dashboard_ui/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ProductTable extends StatelessWidget {
  const ProductTable({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        // color: Colors.white,
        border: Border.all(
          color: const Color.fromARGB(255, 233, 233, 233),
          width: 1,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(7)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomText(
              textAlign: TextAlign.start,
              maxWidth: size.width <= 550 ? double.infinity : size.width * 0.4,
              text: 'Frequently Bought Products',
              overflow: true,
              fontWeight: FontWeight.w600,
            ),
            Flexible(
              child: Table(
                border: TableBorder.all(
                  color: Color.fromARGB(255, 219, 219, 219),
                  width: 1,
                ),
                children: [
                  TableRow(
                    // decoration: BoxDecoration(color: Colors.grey[100]),
                    children: [
                      tableHeader('Product'),
                      tableHeader('Last Purchase'),
                      tableHeader('Time'),
                      tableHeader('Price'),
                      tableHeader('Qty'),
                    ],
                  ),
                  tableRow('16 GB', '01-08-2024', '2', '\$3.00', '10'),
                  tableRow(
                      'Lenovo Think Pad', '01-08-2024', '2', '\$1.50', '20'),
                  tableRow('200', '01-08-2024', '2', '\$2.00', '15'),
                  tableRow('Narrow', '01-08-2024', '5', '\$4.00', '25'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TableRow tableRow(String product, String lastPurchase, String time,
      String price, String qty) {
    return TableRow(
      children: [
        tableCell(product),
        tableCell(lastPurchase),
        tableCell(time),
        tableCell(price),
        tableCell(qty),
      ],
    );
  }

  Widget tableHeader(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomText(
        text: text,
        fontWeight: FontWeight.w600,
        size: 14,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget tableCell(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomText(
        size: 14,
        text: text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
