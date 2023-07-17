import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key,this.onTap,
    this.hintText,this.onChange,this.obSecure=false,this.prefixIcon, required this.labelText,this.controller,this.validate}) ;
  bool obSecure;
  TextEditingController? controller;
  String? hintText;
  Function(String)? onChange;
  Widget? prefixIcon;
  String labelText;
  AutovalidateMode? validate;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      controller: controller,
      obscureText: obSecure!,
      validator: (data){
        if (data == null || data.isEmpty){
          return 'field is required';
        }
        return null;
      },
      onChanged: onChange,
      decoration: InputDecoration(

          enabledBorder:OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              )
          ) ,
          border: OutlineInputBorder(),
          hintText: hintText ,
          labelText: labelText,
          prefixIcon: prefixIcon,
          hintStyle:TextStyle(
              color: Colors.white
          )
      ),
    );
  }
}
