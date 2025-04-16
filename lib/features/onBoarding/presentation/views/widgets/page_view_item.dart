import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PageViewItem extends StatelessWidget {
  @override
  const PageViewItem({
    Key? key,
    required this.image,
    required this.backgroundimage,
    required this.subtitle,
    required this.title,
  }) : super(key: key);
  final String image, backgroundimage;
  final String subtitle;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(backgroundimage, fit: BoxFit.fill),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: SvgPicture.asset(image),
              ),
              Padding(padding: const EdgeInsets.all(16), child: Text("تخطي")),
            ],
          ),
        ),
      ],
    );
  }
}
