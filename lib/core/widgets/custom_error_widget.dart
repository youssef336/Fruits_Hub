import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 0.2;
    return Padding(
      padding: EdgeInsets.only(top: height),
      child: Center(child: Text(text)),
    );
  }
}
