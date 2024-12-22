import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgAsset extends StatelessWidget {
  final String svgName;
  final double? width, height;
  final Function()? onTap;
  final BorderRadius? radius;
  final Color? splashColor;
  const SvgAsset({super.key, required this.svgName, this.width = 50, this.height = 50, this.onTap, this.radius, this.splashColor});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          svgName, // Replace with your SVG path
          width: width, // Set width of the SVG
          height: height,
          fit: BoxFit.scaleDown, // Set height of the SVG
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            splashColor: splashColor ?? Colors.grey.withOpacity(0.4),
            borderRadius: radius ?? BorderRadius.circular(18), // Optional: Add rounding if needed
            child: SizedBox(
              width: width, // Set the same width as SVG to cover it
              height: height, // Set the same height as SVG to cover it
            ),
          ),
        ),
      ],
    );
  }
}
