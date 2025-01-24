import 'package:flutter/material.dart';

class AuthBackgroundWidget extends StatelessWidget {
  final String appLogo;
  final Widget child;

  const AuthBackgroundWidget({super.key, required this.appLogo, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.9,
          child: Image.asset(
            appLogo,
            width: double.maxFinite,
            // fit: BoxFit.cover, // Ensure the image covers the entire container
          ),
        ),
        Positioned(
          top: 0,
          child: Container(
            width: MediaQuery.of(context).size.width * .99,
            height: MediaQuery.of(context).size.height * 0.85,
            padding: const EdgeInsets.fromLTRB(24, 40, 24, 16),
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}
