import 'package:flutter/material.dart';

class ThemeBackground extends StatelessWidget {
  final Widget child;
  const ThemeBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // TextTheme textTheme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          tileMode: TileMode.decal,
          stops: [0.1, 0.2, 0.8],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF172826),
            Color(0xFF17181C),
            Color(0xFF000000),
            // const Color(0xFFD3D0F1).withOpacity(0.1),
          ],
        ),
      ),
      child: child,
    );
  }
}
