 import 'package:flutter/material.dart';

class AppCustomForm extends StatelessWidget {
  final String hintText;
   final IconData? icon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  const AppCustomForm({
    Key? key,
    required this.hintText,
     this.icon,
    this.controller,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // FIRST NAME TEXT
         

        // FIRST NAME TEXT FIELD
        Material(
          elevation: 1,
          borderRadius: BorderRadius.circular(10),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFF7FBFF),
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Colors.blueGrey,
                fontSize: 15,
              ),
              suffixIcon: Icon(icon),
              enabledBorder:
                   const OutlineInputBorder(
                borderSide: BorderSide(
                    width: .25,
                    color: Colors.grey),
                borderRadius: BorderRadius.all(
                    Radius.circular(10)),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
