import 'package:flutter/material.dart';

class CustomTextF extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final String? obscureCharacter;
  final String? lableText;
  final String? hintText;
  final Widget? suffixIcon;
final Color bgColor;
final Color underlineColor;
final Color bordersideColor;
final Color labelColor;


  const CustomTextF({super.key, this.controller, this.keyboardType, this.obscureText, this.obscureCharacter, this.lableText, this.hintText, this.suffixIcon, required this.bgColor, required this.underlineColor, required this.bordersideColor, required this.labelColor, required String? Function(dynamic val) validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
        decoration: InputDecoration(
            labelText: hintText,
           // hintText: lableText,
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color:underlineColor)
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color:bordersideColor)
            ),
            suffixIcon: suffixIcon,

            labelStyle: TextStyle(
              color: labelColor,

            )
    ),

    );
  }
}
