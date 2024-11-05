import 'package:flutter/material.dart';
import 'package:schop_app/constants/colors.dart';

class ColorList extends StatefulWidget {
  final List<Color> colors;
  final Function(Color?) onSelect; // Allowing null selection

  const ColorList(
    this.colors, {
    Key? key,
    required this.onSelect,
  }) : super(key: key);

  @override
  _ColorListState createState() => _ColorListState();
}

class _ColorListState extends State<ColorList> {
  Color? selected; // Initialize as null

  void select(Color color) {
    setState(() {
      if (selected == color) {
        selected = null; // Deselect the color if it's already selected
      } else {
        selected = color; // Select the new color
      }
    });

    widget.onSelect(selected); // Call the onSelect callback
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        scrollDirection: Axis.horizontal,
        child: Wrap(
          spacing: 20,
          children: widget.colors.map((color) {
            return InkWell(
              onTap: () {
                select(color);
              },
              child: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  border: selected == color
                      ? Border.all(width: 3, color: primaryColor)
                      : null,
                  color: color,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset.zero,
                      blurRadius: 15,
                    )
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
