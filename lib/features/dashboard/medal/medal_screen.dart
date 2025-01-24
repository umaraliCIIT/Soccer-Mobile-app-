import 'package:flutter/material.dart';
import 'package:soccer_mobile_app/config/routes/app_navigation.dart';
import 'package:soccer_mobile_app/config/routes/app_routes.dart';
import 'package:soccer_mobile_app/config/theme/app_colors.dart';
import 'package:soccer_mobile_app/core/components/app_bar.dart';
import 'package:soccer_mobile_app/core/components/extensions.dart';
import 'package:soccer_mobile_app/core/constants/app_constant.dart';

class MedalScreen extends StatefulWidget {
  const MedalScreen({super.key});

  @override
  State<MedalScreen> createState() => _MedalScreenState();
}

class _MedalScreenState extends State<MedalScreen> {
  int _selectedIndex = 0;
  final List<String> labels = ["All", "Silver", "Bronze"];

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
        backgroundColor: AppColors.actionColor600,
        appBar: CommonAppBar(
          title: 'Ranking',
          isProfile: false,
          onLeftPressed: () {},
          onRightPressed: () {},
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
              width: double.maxFinite,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor350, // Light grey background
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(labels.length, (index) {
                    final bool isSelected = _selectedIndex == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 10),
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.primaryColor600 : Colors.transparent,
                          borderRadius: BorderRadius.circular(24),
                          border: isSelected ? Border.all(color: AppColors.primaryColor600, width: 2) : Border.all(color: Colors.transparent),
                        ),
                        child: Text(
                          labels[index],
                          style: textTheme.bodySmall?.copyWith(
                            color: isSelected ? AppColors.actionColor550 : AppColors.secondaryColor500,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            24.height,
            InkWell(
              onTap: () {
                AppNavigation.navigateTo(AppRoutes.routeMedalDetailScreen);
                print('btnn click');
              },
              child: Stack(
                clipBehavior: Clip.none, // Allow player image to overflow
                children: [
                  // Background Card with Gradient
                  Container(
                    width: double.maxFinite, // Reduced width
                    height: 100, // Reduced height
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12), // Smaller border radius
                      gradient: const LinearGradient(
                        colors: [Color(0xFFA63232), Colors.white],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                  ),

                  // Points section (Rotated text)
                  Positioned(
                    left: 10,
                    top: 15,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "35",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18, // Reduced size
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        12.height,
                        Transform.rotate(
                          angle: -1.57, // Rotate text vertically
                          child: const Text(
                            "POINTS",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10, // Reduced size
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Player Image (Head Outside the Card)
                  Positioned(
                    left: 60,
                    top: -25, // Moves the head above the card
                    child: SizedBox(
                      width: 70, // Smaller player image
                      height: 110,
                      child: Image.asset(
                        '${AppConstant.assetImages}player01.png', // Replace with your player image
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // Player Name
                  Positioned(
                    right: 50,
                    top: 35,
                    child: const Text(
                      "ELISAN\nDAVIDSON",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12, // Reduced font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // Team Logo
                  Positioned(
                    right: 15,
                    top: 20,
                    child: SizedBox(
                      width: 35, // Smaller logo
                      height: 45,
                      child: Image.asset(
                        'assets/logo.png', // Replace with your logo path
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  // Ranking Text
                  Positioned(
                    right: 15,
                    bottom: 5,
                    child: const Text(
                      "1ER",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10, // Smaller font size
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
