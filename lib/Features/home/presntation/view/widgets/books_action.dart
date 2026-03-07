import 'package:flutter/material.dart';

import '../../../../../core/widgrts/custom_button.dart';

class BooksAction  extends StatelessWidget {
  const BooksAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(child: CustomButton(
            text: "19.99€",
            backgroundcolor: Colors.white,
            textcolor: Colors.black,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(16),bottomLeft: Radius.circular(16) ),
          )),
          Expanded(child: CustomButton(
            fontSize: 16,
            text: "Free preview",
            backgroundcolor: Color(0xffEF8262),
            textcolor: Colors.white,
            borderRadius: BorderRadius.only(topRight: Radius.circular(16),bottomRight: Radius.circular(16) ),
          ))
        ],
      ),
    );
  }
}