import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatefulWidget {
  final Function(String) onSubmitted;
  final List<String> searchHistory;

  const CustomSearchTextField({
    super.key,
    required this.onSubmitted,
    required this.searchHistory,
  });

  @override
  _CustomSearchTextFieldState createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  final TextEditingController _controller = TextEditingController();
  List<String> filteredHistory = [];

  @override
  void initState() {
    super.initState();
    _controller.addListener(_filterHistory);
  }

  @override
  void dispose() {
    _controller.removeListener(_filterHistory);
    _controller.dispose();
    super.dispose();
  }

  void _filterHistory() {
    final query = _controller.text;
    if (query.isNotEmpty) {
      setState(() {
        filteredHistory = widget.searchHistory
            .where(
                (search) => search.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    } else {
      setState(() {
        filteredHistory = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(6),
    );

    return Column(
      children: [
        TextFormField(
          controller: _controller,
          decoration: InputDecoration(
            enabledBorder: outlineInputBorder,
            hintText: 'Search',
            suffixIcon: GestureDetector(
              onTap: () {
                widget.onSubmitted(_controller.text);
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
          onFieldSubmitted: widget.onSubmitted,
        ),
        if (filteredHistory.isNotEmpty)
          Container(
            constraints: const BoxConstraints(maxHeight: 200),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: filteredHistory.length,
              itemBuilder: (context, index) {
                final suggestion = filteredHistory[index];
                return ListTile(
                  title: Text(suggestion),
                  onTap: () {
                    _controller.text = suggestion;
                    widget.onSubmitted(suggestion);
                  },
                );
              },
            ),
          ),
      ],
    );
  }
}
