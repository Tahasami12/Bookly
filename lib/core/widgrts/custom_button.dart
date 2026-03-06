import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){}, child: Text("19.99€",style: Styles.textstyle16.copyWith(
      color: Colors.black
    ),));
  }
}
