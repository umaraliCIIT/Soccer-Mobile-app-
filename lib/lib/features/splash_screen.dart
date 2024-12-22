import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:soccer_mobile_app/lib/config/theme/app_colors.dart';
import 'package:soccer_mobile_app/lib/core/components/extensions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  PageController pagecontroll = PageController(viewportFraction: 1, keepPage: true);
  // final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            50.height,
            pageViewContianer(),
            SmoothPageIndicator(
              controller: pagecontroll,
              count: 3,
              effect: const ExpandingDotsEffect(
                dotHeight: 6,
                dotWidth: 13,
                activeDotColor: Colors.amber,
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // const Spacer(),
                  Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                      border: Border.all(
                        width: 2,
                        color: Colors.amber,
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        // Navigator.pushReplacementNamed(context, AppRoutes.routeSignUpScreen);
                      },
                      child: const Center(
                        child: Text(
                          'Skip',
                          style: TextStyle(
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
                    decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(12.0)), color: AppColors.primaryColor600),
                    child: InkWell(
                      onTap: () {
                        // Navigator.pushReplacementNamed(context, AppRoutes.routeSignInScreen);
                      },
                      child: const Center(
                        child: Text(
                          'Get Started',
                          style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

// widget containing data for the introduction screen
  Widget pageViewContianer() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.75,
      child: PageView(
        controller: pagecontroll,
        scrollDirection: Axis.horizontal,
        children: [
          pageView('Perfect Chat Solution', 'Welcome to a world where language barriers no longer exist!', "assets/walkthrough/2.png"),
          pageView('Chat anytime, anywhere', "Speak over 200 languages with the assistance of AI language translation.", "assets/walkthrough/1.png"),
          pageView(
            'Searching Features',
            "With Uhura, you can access more Asian, African, and Arabic languages than other language translation software.",
            "assets/walkthrough/3.png",
          ),
        ],
      ),
    );
  }

  //Page view builder code
  Widget pageView(String text, String text2, String imgurl) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 10),
              child: Image.asset(
                imgurl,
                width: MediaQuery.of(context).size.width - 30,
                height: MediaQuery.of(context).size.height / 2.3,
              ),
            )
          ],
        ),
        20.height,
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 24,
            ),
            maxLines: 2,
          ),
        ),
        20.height,
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 30, 0),
          child: Text(
            text2,
            style: const TextStyle(fontSize: 18),
            maxLines: 4,
          ),
        )
      ],
    );
  }
}
