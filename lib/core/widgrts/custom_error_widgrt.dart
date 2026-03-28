import 'package:bookly/core/utils/styles.dart';

import 'package:flutter/material.dart';

class CustomErrorWidgrt extends StatelessWidget {
  const CustomErrorWidgrt({super.key,required this. errMessage});
final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(errMessage,style:Styles.textstyle18));
  }
}
