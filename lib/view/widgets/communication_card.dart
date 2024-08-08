import 'package:dashboard_ui/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CommunicationCard extends StatelessWidget {
  const CommunicationCard({super.key});

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomText(
              textAlign: TextAlign.start,
              maxWidth: size.width <= 550 ? double.infinity : size.width * 0.4,
              text: 'Communications',
              overflow: true,
              fontWeight: FontWeight.w600,
            ),
            Flexible(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 219, 219, 219),
                      ),
                    ),
                    title: CustomText(
                      text: 'Raj P',
                      textAlign: TextAlign.start,
                    ),
                    subtitle: CustomText(
                      textAlign: TextAlign.start,
                      text: 'Biscuit Sales',
                      size: 13,
                    ),
                    leading: CircleAvatar(
                      child: Icon(
                        Icons.person,
                        color: Colors.blue,
                      ),
                      backgroundColor: Color.fromARGB(255, 216, 241, 255),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 5,
                          backgroundColor: Colors.orange,
                        ),
                        SizedBox(width: 8),
                        CustomText(
                          text: '30/07/2024  17:50',
                          size: 12,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.camera_alt_rounded),
                    ),
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 219, 219, 219),
                            ),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.send),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
