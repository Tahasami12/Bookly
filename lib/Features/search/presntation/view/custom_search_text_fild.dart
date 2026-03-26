import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTixtField extends StatelessWidget {
  const CustomSearchTixtField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(

      decoration: InputDecoration(
          enabledBorder:buildBorder() ,
          focusedBorder: buildBorder(),
          helperText:  "Search",
          suffixIcon: IconButton(onPressed:  (){}, icon: Opacity(opacity:.8, child: Icon(FontAwesomeIcons.magnifyingGlass,size: 22,)))
      ),
    );
  }
}
OutlineInputBorder buildBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
    ),
    borderRadius: BorderRadius.circular(12),
  );
}
