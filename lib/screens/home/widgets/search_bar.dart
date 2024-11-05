import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24.0, bottom: 28.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.075),
            offset: const Offset(0.0, 1.0),
            blurRadius: 10.0,
          )
        ],
      ),
      child: TextFormField(
        decoration: InputDecoration(
          icon: SvgPicture.asset('assets/icons/search.svg'),
          hintText: 'Search unique furniture...',
          hintStyle: const TextStyle(
            color: Colors.black26,
            fontSize: 14.0,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
