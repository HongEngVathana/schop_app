import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:schop_app/constants/colors.dart';
import 'package:schop_app/models/item.dart';

class FurnitureGridItem extends StatelessWidget {
  final Item item;
  final EdgeInsets margin;

  const FurnitureGridItem({
    Key? key,
    required this.item,
    this.margin = EdgeInsets.zero, // Default value for margin
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: Offset.zero,
            blurRadius: 15.0,
          )
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 37),
                  height: 180,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      alignment: Alignment.bottomCenter,
                      image: AssetImage(item.imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                if (item.discountPercent != null)
                  Positioned(
                    top: 16,
                    right: 16,
                    child: Container(
                      width: 40,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '${item.discountPercent}%',
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    height: 1.5,
                  ),
                ),
                Wrap(
                  spacing: 3,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      '${Item.format(item.price)}',
                      style: const TextStyle(
                        fontSize: 18,
                        color: primaryColor,
                        height: 1.5,
                      ),
                    ),
                    if (item.discountPercent != null)
                      Text(
                        '${Item.format(item.originalPrice)}',
                        style: const TextStyle(
                          fontSize: 12,
                          height: 1.5,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.black38,
                        ),
                      ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                      RatingBarIndicator(
                        rating: item.rating,
                        itemCount: 5,
                        itemSize: 12,
                        unratedColor: Colors.amber[100],
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          size: 12, // Adjusted size for better visibility
                          color: Colors.amber,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '${item.rating}',
                        style: const TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
