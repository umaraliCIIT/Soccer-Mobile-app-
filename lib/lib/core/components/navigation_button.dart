import 'package:flutter/material.dart';
import 'package:soccer_mobile_app/lib/config/theme/app_colors.dart';

class NavigationButton extends StatelessWidget {
  final String? iconAddress;
  final Widget? icon;
  final VoidCallback? callback;

  const NavigationButton({
    super.key,
    this.iconAddress,
    this.icon,
    this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: callback,
        splashColor: AppColors.neutralColor500,
        borderRadius: BorderRadius.circular(100),
        child: iconAddress != null ? Image.asset(iconAddress!) : icon,
      ),
    );
  }
}
