import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key,  required this.backgroundcolor, required this.textcolor,  this.borderRadius, required this.text,  this.fontSize,});

final String text;
final Color backgroundcolor;
final Color textcolor;
final BorderRadius? borderRadius;
final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(onPressed: (){},
          style: TextButton.styleFrom(
            backgroundColor:backgroundcolor,
            shape: RoundedRectangleBorder(
              borderRadius:borderRadius?? BorderRadius.circular(12)
            )
          ),
          child: Text(text,style: Styles.textstyle18.copyWith(
        color: textcolor,fontWeight: FontWeight.w900,
              fontSize: fontSize,
      ),)),
    );
  }
}
