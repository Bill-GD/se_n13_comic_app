import 'package:flutter/material.dart';
import 'package:loginapp/constant.dart';

class CustomTextField extends StatefulWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? inputAction;
  final TextEditingController? controller;
  const CustomTextField({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.obscureText = false,
    this.inputAction,
    this.hintText,
    this.controller,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        widget.prefixIcon ?? Container(),
        const SizedBox(width: 14),
        Expanded(
          child: TextFormField(
            controller: widget.controller,
            cursorHeight: 18,
            cursorColor: kDarkBlue,
            obscureText: widget.obscureText,
            style: TextStyle(color: kDarkBlue),
            keyboardType: widget.keyboardType,
            textInputAction: widget.inputAction,
            decoration: InputDecoration(
              hintText: widget.hintText,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kDarkBlue),
              ),
              hintStyle: TextStyle(
                color: kGreyBlue,
                fontWeight: FontWeight.w500,
              ),
              suffixIcon: widget.suffixIcon,
            ),
          ),
        ),
      ],
    );
  }
}
