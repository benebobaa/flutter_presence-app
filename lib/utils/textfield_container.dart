// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final ValueNotifier<bool>? valueListenablePass;
  final IconData icon;
  const TextFieldContainer({
    Key? key,
    required this.controller,
    required this.hintText,
    this.valueListenablePass,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget? suffixIcon() {
      if (valueListenablePass == null) {
        return null;
      }
      return IconButton(
        onPressed: () {
          valueListenablePass!.value = !valueListenablePass!.value;
        },
        icon: Icon(
          valueListenablePass!.value ? Icons.visibility_off : Icons.visibility,
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: 300,
      decoration: BoxDecoration(
          color: Colors.white70, borderRadius: BorderRadius.circular(25)),
      child: TextField(
        obscureText: valueListenablePass?.value ?? false,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon(),
          prefixIcon: Padding(
            padding: EdgeInsets.all(5),
            child: Icon(icon),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
