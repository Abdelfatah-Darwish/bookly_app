import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  final Function(String) onSubmitted;

  const CustomSearchTextField({
    super.key,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(6),
    );
    final TextEditingController controller = TextEditingController();

    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: outlineInputBorder,
        hintText: 'Search',
        suffixIcon: GestureDetector(
          onTap: () {
            onSubmitted(controller.text);
          },
          child: const Opacity(
            opacity: 0.8,
            child: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 24,
            ),
          ),
        ),
        focusedBorder: outlineInputBorder,
      ),
      onFieldSubmitted: onSubmitted,
    );
  }
}
