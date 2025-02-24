import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:soccer_mobile_app/config/routes/app_navigation.dart';
import 'package:soccer_mobile_app/config/routes/app_routes.dart';
import 'package:soccer_mobile_app/config/theme/app_colors.dart';
import 'package:soccer_mobile_app/core/components/extensions.dart';
import 'package:soccer_mobile_app/core/constants/app_constant.dart';

class FirstWalkThrough extends StatefulWidget {
  const FirstWalkThrough({super.key});
  @override
  State<FirstWalkThrough> createState() => _FirstWalkThroughState();
}

class _FirstWalkThroughState extends State<FirstWalkThrough> {
  PageController pageControl = PageController(viewportFraction: 1, keepPage: true);
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(backgroundColor: Colors.black, body: pageViewContainer(textTheme));
  }

// widget containing data for the introduction screen
  Widget pageViewContainer(TextTheme textTheme) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: PageView(
        controller: pageControl,
        scrollDirection: Axis.horizontal,
        children: [
          pageView(textTheme, 'Join our expert-led soccer training sessions and level up your ', 'Skills.', "${AppConstant.assetImages}background01.png", 'Skip'),
          pageView(textTheme, 'Earn your personalized', " Performance card!", "${AppConstant.assetImages}background02.png", 'Back'),
        ],
      ),
    );
  }

  //Page view builder code
  Widget pageView(TextTheme textTheme, String text, String text2, String imgurl, String btnText) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset(
          imgurl,
          // "${AppConstant.assetImages}background01.png",
          fit: BoxFit.fitWidth,
          width: double.infinity,
          height: double.infinity,
          // Ensures the image covers the entire container
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: MediaQuery.sizeOf(context).width * .99,
            height: MediaQuery.sizeOf(context).height * .5,
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (btnText == 'Skip')
                  Image.asset(
                    "${AppConstant.assetImages}logo.png",
                    fit: BoxFit.fitWidth,
                  )
                else
                  36.height,
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 24, 30, 0),
                  child: RichText(
                    overflow: TextOverflow.visible,
                    textAlign: (btnText == 'Skip') ? TextAlign.start : TextAlign.center,
                    softWrap: true,
                    maxLines: 5,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: text,
                          style: textTheme.bodyMedium?.copyWith(color: AppColors.whiteColor75, fontFamily: 'Spartan'),
                        ),
                        TextSpan(
                          text: (btnText == 'Skip') ? text2 : '\n$text2',
                          style: textTheme.bodyMedium?.copyWith(color: AppColors.whiteColor75, fontFamily: 'Spartan', fontSize: (btnText == 'Skip') ? 18 : 24, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                50.height,
                SmoothPageIndicator(
                  controller: pageControl,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                    dotHeight: 6,
                    dotWidth: 13,
                    activeDotColor: Colors.amber,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // const Spacer(),
                      SizedBox(
                        height: 40,
                        width: 80,
                        child: InkWell(
                          onTap: () {
                            if (btnText != 'Skip') {
                              pageControl.previousPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.decelerate,
                              );
                            } else {
                              AppNavigation.pushReplacementTo(AppRoutes.routeTypeSelectionScreen);
                            }
                            // Navigator.pushReplacementNamed(context, AppRoutes.routeSignUpScreen);
                          },
                          child: Center(
                            child: Text(
                              btnText,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 120,
                        decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.primaryColor600),
                        child: InkWell(
                          onTap: () {
                            if (btnText == 'Skip') {
                              pageControl.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.decelerate,
                              );
                            } else {
                              AppNavigation.pushReplacementTo(AppRoutes.routeTypeSelectionScreen);
                            }
                          },
                          child: const Icon(Icons.arrow_right_alt_rounded),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
