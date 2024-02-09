

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:session2d2v2/core/colors.dart';
import 'package:session2d2v2/main.dart';

class CustomTextField extends StatelessWidget{
  final String label;
  final String hint;
  final TextEditingController controller;
  final bool isObscure;
  final Function(String)? onChange;
  final Function()? onTapSuffix;
  final MaskTextInputFormatter? formatter;

  CustomTextField({required this.label, required this.hint, required this.isObscure, required this.controller, this.formatter, this.onTapSuffix, this.onChange});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start
          ,children: [Text(label,style: Theme.of(context).textTheme.titleSmall,),
            SizedBox(height: 8,),
            SizedBox(width: MediaQuery.of(context).size.width - 48,height: 44,child:
            TextField(
                inputFormatters: (formatter != null) ? [formatter!] : [],
                style: Theme.of(context).textTheme.titleSmall,  obscuringCharacter: "*", controller: controller, onChanged: onChange, obscureText: isObscure,
                decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)), contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10), hintText: hint,
                  suffixIcon: (onTapSuffix != null)
                      ? SizedBox(height: 15, width: 15,
                    child: GestureDetector(
                      onTap: onTapSuffix,
                      child: Image.asset("assets/eye-slash.png"),
                    ),
                  )
                      : null,
                  focusColor: Color.fromARGB(255, 167, 167, 167),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFA7A7A7))
                  ),


                )
            )
              ,)

          ],)
    );
  }
}