import 'package:flutter/material.dart';
import 'package:interntask/src/constants/colors.dart';

class formFieldWidget extends StatelessWidget {
  const formFieldWidget({
    super.key,
    this.hintText,
    this.email,
    this.password,
    this.cpassword,
    this.textInputType,
    required this.obscureText,
    this.validator,
    required this.saveTxt,
    this.controller,
    this.hintStyle = const TextStyle(color: AppColors.lightGrey, fontSize: 15), this.prefixIcon, this.suffixIcon, required this.onChanged,
    
  });

  final String? hintText;
  final String? email;
  final String? password;
  final String? cpassword;
  final String? Function(String?)? validator;
  // final ValueChanged<String> onSaved;
  final void Function(String txt) saveTxt;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final bool obscureText;
  final TextStyle hintStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function(String value) onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.red, width: 1.5)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.red, width: 1.5)),
        // label: Text("Enter Student ID"),
        hintText: hintText,
        hintStyle:hintStyle,
        prefixIcon: prefixIcon,
        suffixIcon: UnconstrainedBox(child: suffixIcon),
        // suffixIconConstraints: BoxConstraints(
        //               maxHeight: 30
        //             ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade400, width: 1.5)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.grey, width: 1.5),
        ),
      ),
      keyboardType: textInputType,
      obscureText: obscureText,
      validator: validator,
      controller: controller,
      onChanged: onChanged,
      // prefixIcon: prefixIcon,
    
      onSaved: (newValue) => saveTxt(newValue!),
    );
  }
}
