import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({super.key,this.inputType ,this.label,  this.hint, this.onChange, this.obsecure=false});
  TextInputType? inputType ;
 String? label;
 String? hint;
 bool? obsecure;
 Function(String)?onChange;

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      keyboardType: inputType,
      obscureText: obsecure!,
      validator: (data)
      {
        if(data!.isEmpty)
        {
          return  'Field is required';
        }
      },
      onChanged:onChange ,
      decoration: InputDecoration(
        enabledBorder:  OutlineInputBorder(
          borderSide: const BorderSide(),
          borderRadius: BorderRadius.circular(8),
        ),

        labelText: label,
        hintText: hint,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
