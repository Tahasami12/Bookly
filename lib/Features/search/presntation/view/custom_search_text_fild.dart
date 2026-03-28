import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../home/presntation/manger/search_dart_cubit.dart';




class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        if (value.isNotEmpty) {
          context.read<SearchCubit>().search(value);
        }
      },
      onSubmitted: (value) {
        context.read<SearchCubit>().search(value);
      },
      decoration: InputDecoration(
        hintText: "Search",
        prefixIcon: IconButton(
          onPressed: () {},
          icon: Opacity(
            opacity: .8,
            child: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 22,
            ),
          ),
        ),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }
OutlineInputBorder buildBorder() {
  return OutlineInputBorder(
    borderSide: const BorderSide(
      color: Colors.white,
    ),
    borderRadius: BorderRadius.circular(12),
  );
}}