import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
  CustomFormTextField(
      {super.key,
      this.onChang,
      this.hintText,
      this.validator,
      this.isHidden = false});
  String? hintText;
  Function(String)? onChang;
  String? Function(String?)? validator;
  bool? isHidden;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isHidden!,
      validator: validator,
      onChanged: onChang,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        hintText: hintText,
      ),
    );
  }
}
