import 'package:flutter/material.dart';
import 'package:soccer_mobile_app/config/theme/app_colors.dart';
import 'package:soccer_mobile_app/core/components/custom_svg.dart';
import 'package:soccer_mobile_app/core/constants/app_constant.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onLeftPressed;
  final VoidCallback onRightPressed;
  final bool isProfile;

  const CommonAppBar({
    required this.title,
    required this.onLeftPressed,
    this.isProfile = false,
    required this.onRightPressed,
  });

  @override
  Size get preferredSize => const Size.fromHeight(100.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.actionColor500,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(24.0), // Set the bottom radius to 24
        ),
      ),
      flexibleSpace: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0, left: 12, right: 12), // Adjust the padding as needed
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: SvgAsset(
                  svgName: isProfile ? "${AppConstant.assetImages}back.svg" : "${AppConstant.assetImages}profile.svg",
                ),
                onPressed: onLeftPressed,
              ),
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [AppColors.secondaryColor150, AppColors.primaryColor600],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ).createShader(bounds),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              if (!isProfile)
                IconButton(
                  icon: const SvgAsset(
                    svgName: "${AppConstant.assetImages}bell.svg",
                  ),
                  onPressed: onRightPressed,
                )
              else
                const SizedBox(width: 50),
            ],
          ),
        ),
      ),
    );
  }
}
