import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  const InputBox({
    Key? key,
    required this.label,
    required this.controller,
    required this.validator,
    this.enable = true,
    this.textType = TextInputType.text,
    this.hideContent = false,
    this.minLines = 1,
    this.maxLines = 5,
  }) : super(key: key);
  final String label;
  final TextEditingController controller;
  final bool enable;
  final TextInputType textType;
  final int minLines;
  final int maxLines;
  final Function? validator;
  final bool hideContent;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      minLines: minLines,
      maxLines: maxLines,
      obscureText: hideContent,
      keyboardType: textType,
      validator: (val) => validator!(val),
      decoration: InputDecoration(
        label: Text(label),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black.withOpacity(.5),
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.redAccent,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
