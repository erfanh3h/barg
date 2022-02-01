import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final Function func;
  final String title;
  final Color color;
  final Color fontColor;
  const SubmitButton({
    Key? key,
    required this.func,
    required this.title,
    required this.color,
    required this.fontColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => func(),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Text(
          title.toUpperCase(),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: fontColor,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
