import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(6));
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: outlineInputBorder,
        hintText: 'Search',
        suffixIcon: const Opacity(
          opacity: 0.8,
          child: Icon(
            FontAwesomeIcons.magnifyingGlass,
            size: 24,
          ),
        ),
        focusedBorder: outlineInputBorder,
      ),
    );
  }
}
