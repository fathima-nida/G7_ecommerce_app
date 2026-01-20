import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousal extends StatelessWidget {
  final List<String> image;

  const Carousal({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 149,
        autoPlay: true,
        enableInfiniteScroll: true,
      ),
      items: image.map((img) {
        return SizedBox(
          width: 384,
          child: img.startsWith('http')
              ? Image.network(
                  img,
                  fit: BoxFit.cover,
                  // errorBuilder: (_, __, ___) =>
                  //     Image.asset('assets/images/ad1.png'),
                )
              : Image.asset(
                  img,
                  fit: BoxFit.cover,
                ),
        );
      }).toList(),
    );
  }
}
