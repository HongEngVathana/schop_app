import 'package:flutter/material.dart';

import 'package:schop_app/data/fake.dart';
import 'package:schop_app/screens/home/widgets/search_bar.dart';

import 'package:schop_app/widgets/cart.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 16.0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Furniture Shop',
                style: TextStyle(fontSize: 28.0, height: 1),
              ),
              Cart(numberOfItemsInCart: Fake.numberOfItemsInCart),
            ],
          ),
          const Text(
            'Get unique furniture for your home',
            style: TextStyle(fontSize: 15.0, height: 2, color: Colors.black38),
          ),
          SearchBar()
        ],
      ),
    );
  }
}
