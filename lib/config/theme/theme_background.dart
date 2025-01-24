import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  final String logo;
  final Widget childView;
  final EdgeInsets? padding;

  const BackgroundWidget({super.key, required this.logo, required this.childView, this.padding});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          logo,
          fit: BoxFit.fitWidth,
          width: double.maxFinite,
          height: double.maxFinite,
          // Ensures the image covers the entire container
        ),
        Positioned(
          top: 20,
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.sizeOf(context).width * .99,
              height: MediaQuery.sizeOf(context).height,
              padding: padding ?? const EdgeInsets.fromLTRB(16, 40, 16, 16),
              alignment: Alignment.topCenter,
              child: childView,
            ),
          ),
        ),
      ],
    );
  }
}
