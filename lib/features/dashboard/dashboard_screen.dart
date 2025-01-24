import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:soccer_mobile_app/config/theme/app_colors.dart';
import 'package:soccer_mobile_app/core/components/custom_svg.dart';
import 'package:soccer_mobile_app/core/constants/app_constant.dart';
import 'package:soccer_mobile_app/features/dashboard/account/account_screen.dart';
import 'package:soccer_mobile_app/features/dashboard/home/home_screen.dart';
import 'package:soccer_mobile_app/features/dashboard/medal/medal_screen.dart';
import 'package:soccer_mobile_app/features/dashboard/pitch/pitch_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.actionColor600,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: const [
          HomeScreen(),
          PitchScreen(),
          MedalScreen(),
          AccountScreen(),
        ],
      ),
      bottomNavigationBar: DotNavigationBar(
        currentIndex: _selectedIndex,
        marginR: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
        paddingR: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        onTap: _onItemTapped,
        backgroundColor: AppColors.actionColor500,
        items: [
          DotNavigationBarItem(
            icon: SvgAsset(
              svgName: _selectedIndex == 0 ? "${AppConstant.assetImages}solid_home.svg" : "${AppConstant.assetImages}home.svg",
              width: 28,
              height: 28,
            ),
            selectedColor: AppColors.actionColor500,
          ),
          DotNavigationBarItem(
            icon: SvgAsset(
              svgName: _selectedIndex == 1 ? "${AppConstant.assetImages}solid_pitch.svg" : "${AppConstant.assetImages}pitch.svg",
              width: 28,
              height: 28,
            ),
            selectedColor: AppColors.actionColor500,
          ),
          DotNavigationBarItem(
            icon: SvgAsset(
              svgName: _selectedIndex == 2 ? "${AppConstant.assetImages}solid_medal.svg" : "${AppConstant.assetImages}medal.svg",
              width: 28,
              height: 28,
            ),
            selectedColor: AppColors.actionColor500,
          ),
          DotNavigationBarItem(
            icon: SvgAsset(
              svgName: _selectedIndex == 3 ? "${AppConstant.assetImages}account.svg" : "${AppConstant.assetImages}account.svg",
              width: 28,
              height: 28,
            ),
            selectedColor: AppColors.actionColor500,
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
