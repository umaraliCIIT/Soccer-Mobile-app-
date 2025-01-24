import 'package:flutter/material.dart';

import '../../config/theme/app_colors.dart';
import '../constants/app_constant.dart';
import 'custom_svg.dart';

class DeviceConnectWidget extends StatelessWidget {
  final Function() onTap;
  final String title;
  final String subTitle;
  final double? top;
  final String svgPath;
  const DeviceConnectWidget({super.key, required this.onTap, required this.title, this.top, required this.subTitle, required this.svgPath});

  @override
  Widget build(BuildContext context) {
    TextTheme textheme = Theme.of(context).textTheme;

    return Material(
      color: Colors.transparent,
      child: Container(
        width: 400,
        height: 91,
        margin: EdgeInsets.only(top: top ?? 50, bottom: 24),
        decoration: ShapeDecoration(
          color: AppColors.whiteColor.withOpacity(0.07),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: AppColors.whiteColor.withOpacity(0.07),
            ),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: InkWell(
          onTap: onTap,
          splashColor: AppColors.neutralColor500,
          borderRadius: BorderRadius.circular(16),
          child: Row(
            children: [
              Container(
                  width: 72,
                  height: 79,
                  margin: const EdgeInsets.only(right: 14, left: 8),
                  decoration: ShapeDecoration(
                    color: AppColors.whiteColor.withOpacity(0.12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: SvgAsset(
                    svgName: svgPath,
                    width: 28,
                    height: 28,
                  )),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.start,
                      style: textheme.titleMedium?.copyWith(
                        color: AppColors.whiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      subTitle,
                      textAlign: TextAlign.start,
                      style: textheme.titleMedium?.copyWith(
                        color: AppColors.whiteColor.withOpacity(0.5),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: 28,
                height: 28,
                margin: const EdgeInsets.only(right: 14, left: 8),
                child: const SvgAsset(
                  svgName: '${AppConstant.assetIcons}right_arrow.svg',
                  width: 28,
                  height: 28,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
