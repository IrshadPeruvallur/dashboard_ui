import 'package:dashboard_ui/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class QuickButtonWidget extends StatelessWidget {
  final String title;
  final Color iconBackgroundColor;
  final String count;
  final String imagePath;

  QuickButtonWidget({
    required this.title,
    required this.count,
    required this.imagePath,
    required this.iconBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 170,
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border.all(color: Color.fromARGB(255, 233, 233, 233), width: 1),
          borderRadius: BorderRadius.all(Radius.circular(7)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: iconBackgroundColor,
                child: ClipOval(
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: title,
                    textAlign: TextAlign.start,
                  ),
                  CustomText(
                    text: count,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
