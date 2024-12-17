import '../helper/default_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextFormFiled extends StatelessWidget {
  final String hintText;
  final IconData? prefixIcon;
  final IconButton? suffixIcon;
  final Function? validator;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool readOnly;  
  const CustomTextFormFiled(
      {super.key,
      required this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.keyboardType = TextInputType.name,
      required this.validator,
      this.readOnly=false  , 
      required this.controller});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // obscureText: true,
      readOnly:readOnly ,
      keyboardType: keyboardType,
      validator: (String? value) {
        validator!(value);
        return null;
      },
      controller: controller,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: AppDimensions.defaultBorderRaduis,
          ),
          hintText: hintText,
          contentPadding: const EdgeInsets.all(5),
          prefixIconColor: Colors.brown,
          suffixIconColor: Colors.brown,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          suffixIcon: suffixIcon),
    );
  }
}
