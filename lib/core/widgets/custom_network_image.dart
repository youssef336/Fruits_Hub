import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({super.key, required this.ImageUrl});

  final String ImageUrl;

  @override
  Widget build(BuildContext context) {
    return Image.network(ImageUrl);
  }
}
