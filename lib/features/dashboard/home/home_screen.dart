import 'package:flutter/material.dart';
import 'package:soccer_mobile_app/config/routes/app_navigation.dart';
import 'package:soccer_mobile_app/config/routes/app_routes.dart';
import 'package:soccer_mobile_app/config/theme/app_colors.dart';
import 'package:soccer_mobile_app/core/components/app_bar.dart';
import 'package:soccer_mobile_app/core/components/extensions.dart';
import 'package:soccer_mobile_app/core/constants/app_constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<String> labels = ["All", "Basic", "Pro"];

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.actionColor600,
      appBar: CommonAppBar(
        title: 'Soccer',
        isProfile: false,
        onLeftPressed: () {},
        onRightPressed: () {},
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                        color: isSelected ? AppColors.secondaryColor500 : Colors.transparent,
                        borderRadius: BorderRadius.circular(24),
                        border: isSelected ? Border.all(color: AppColors.secondaryColor500, width: 2) : Border.all(color: Colors.transparent),
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
          16.height,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Upcoming Sessions',
              style: textTheme.headlineSmall?.copyWith(color: AppColors.secondaryColor150),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    AppNavigation.navigateTo(AppRoutes.routeHomeDetailsScreen, arguments: {'index': index});
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 24.0, right: 16),
                    child: Container(
                      width: 343,
                      height: 355,
                      decoration: BoxDecoration(
                        color: AppColors.secondaryColor450, // Same as android:fillColor
                        borderRadius: BorderRadius.circular(24), // Approximating corner rounding
                      ),
                      child: Column(
                        children: [
                          Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                              topRight: Radius.circular(24),
                              topLeft: Radius.circular(24),
                            ) // Adjust the radius as needed
                                ),
                            child: Image.asset(
                              // imgurl,
                              "${AppConstant.assetImages}footballer.png",
                              fit: BoxFit.fitWidth,
                              width: double.maxFinite,
                              height: 210,
                              // Ensures the image covers the entire container
                            ),
                          ),
                          8.height,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    "Soccer training session with an experienced coach",
                                    maxLines: 2,
                                    softWrap: true,
                                    style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600, color: AppColors.secondaryColor25),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "\$8$index",
                                    textAlign: TextAlign.end,
                                    style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600, color: AppColors.primaryColor600),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          18.height,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.location_on_rounded,
                                  color: AppColors.primaryColor600,
                                  size: 14,
                                ),
                                10.width,
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    "Soccer training session with an experienced coach",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: textTheme.bodySmall?.copyWith(color: AppColors.secondaryColor25, fontSize: 13),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "11:00am",
                                    textAlign: TextAlign.end,
                                    style: textTheme.titleSmall?.copyWith(color: AppColors.secondaryColor25, fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          18.height,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CircleAvatar(
                                  radius: 12,
                                  backgroundImage: AssetImage('${AppConstant.assetImages}footballer.png'),
                                ),
                                10.width,
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    "Chris brown",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: textTheme.bodySmall?.copyWith(color: AppColors.secondaryColor25, fontSize: 13),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
