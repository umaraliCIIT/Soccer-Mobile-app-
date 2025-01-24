import 'package:flutter/material.dart';
import 'package:soccer_mobile_app/config/theme/app_colors.dart';
import 'package:soccer_mobile_app/core/components/app_bar.dart';
import 'package:soccer_mobile_app/core/components/extensions.dart';
import 'package:soccer_mobile_app/core/constants/app_constant.dart';

class PitchScreen extends StatefulWidget {
  const PitchScreen({super.key});

  @override
  State<PitchScreen> createState() => _PitchScreenState();
}

class _PitchScreenState extends State<PitchScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
        backgroundColor: AppColors.actionColor600,
        appBar: CommonAppBar(
          title: 'MY SESSIONS',
          onLeftPressed: () {},
          onRightPressed: () {},
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                '${AppConstant.assetImages}sessions.png',
                width: double.maxFinite,
              ),
              Positioned(
                top: MediaQuery.paddingOf(context).top,
                left: 8,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'RWDM ACADEMIE TEST',
                        style: textTheme.headlineSmall?.copyWith(
                          color: AppColors.actionColor600,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      6.height,
                      Text(
                        'Saturday, 12 Dec 2024',
                        style: textTheme.headlineMedium?.copyWith(
                          color: AppColors.actionColor600,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      6.height,
                      Text(
                        '2:00 PM - 04:00 PM',
                        style: textTheme.headlineSmall?.copyWith(
                          color: AppColors.actionColor600,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      (MediaQuery.sizeOf(context).height * 0.09).height,
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'Player Name',
                                style: textTheme.bodySmall?.copyWith(
                                  color: AppColors.actionColor600,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'David liz',
                                textAlign: TextAlign.end,
                                style: textTheme.bodySmall?.copyWith(
                                  color: AppColors.actionColor600,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      6.height,
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'Email',
                                style: textTheme.bodySmall?.copyWith(
                                  color: AppColors.actionColor600,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'David@gmail.com',
                                textAlign: TextAlign.end,
                                style: textTheme.bodySmall?.copyWith(
                                  color: AppColors.actionColor600,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      6.height,
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'Phone Number',
                                style: textTheme.bodySmall?.copyWith(
                                  color: AppColors.actionColor600,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '+938 283 8827',
                                textAlign: TextAlign.end,
                                style: textTheme.bodySmall?.copyWith(
                                  color: AppColors.actionColor600,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      (MediaQuery.sizeOf(context).height * 0.08).height,
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'Price',
                                style: textTheme.bodySmall?.copyWith(
                                  color: AppColors.actionColor600,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '\$85',
                                textAlign: TextAlign.end,
                                style: textTheme.bodySmall?.copyWith(
                                  color: AppColors.actionColor600,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      12.height,
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'Total',
                                style: textTheme.bodySmall?.copyWith(
                                  color: AppColors.actionColor600,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '\$85',
                                textAlign: TextAlign.end,
                                style: textTheme.bodySmall?.copyWith(
                                  color: AppColors.actionColor600,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
