import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:schop_app/screens/home/widgets/header.dart';

class HeaderSliver implements SliverPersistentHeaderDelegate {
  final double minExtent;
  final double maxExtent;

  HeaderSliver({
    required this.minExtent,
    required this.maxExtent,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Header();
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  PersistentHeaderShowOnScreenConfiguration? get showOnScreenConfiguration =>
      null;

  @override
  FloatingHeaderSnapConfiguration? get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration? get stretchConfiguration => null;

  @override
  TickerProvider? get vsync => null;
}
