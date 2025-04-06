import 'package:flutter/material.dart';

class ImageSection extends StatelessWidget {
  final String image;
  final bool isOut;

  const ImageSection({
    super.key,
    required this.image,
    required this.isOut,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width,
      height: height * 0.5,
      child: AnimatedScale(
        scale: isOut ? 0 : 1,
        duration: const Duration(milliseconds: 250),
        child: Image.asset(image),
      ),
    );
  }
}
