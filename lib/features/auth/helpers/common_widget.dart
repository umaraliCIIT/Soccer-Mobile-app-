import 'package:flutter/material.dart';
import 'package:soccer_mobile_app/config/theme/theme_background.dart';
import 'package:soccer_mobile_app/core/components/auth_backgroud_widget.dart';
import 'package:soccer_mobile_app/core/constants/app_constant.dart';

class CommonWidget extends StatelessWidget {
  final Widget child;
  const CommonWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: true,
      body: BackgroundWidget(
          logo: '${AppConstant.assetImages}background03.png',
          padding: EdgeInsets.zero,
          childView: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
                child: Image.asset(
                  "${AppConstant.assetImages}logo.png",
                  fit: BoxFit.fitWidth,
                  height: 35,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(child: AuthBackgroundWidget(appLogo: '${AppConstant.assetImages}background04.png', child: child)),
              ),
            ],
          )),
    );
  }
}
