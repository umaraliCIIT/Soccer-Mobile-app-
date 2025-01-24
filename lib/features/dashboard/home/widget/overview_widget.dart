import 'package:flutter/material.dart';
import 'package:soccer_mobile_app/config/theme/app_colors.dart';
import 'package:soccer_mobile_app/core/components/app_bar.dart';
import 'package:soccer_mobile_app/core/components/custom_button.dart';
import 'package:soccer_mobile_app/core/components/extensions.dart';
import 'package:soccer_mobile_app/core/constants/app_constant.dart';

class OverviewWidget extends StatelessWidget {
  const OverviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
        backgroundColor: AppColors.actionColor600,
        appBar: CommonAppBar(
          title: 'Overview',
          isProfile: true,
          onLeftPressed: () {},
          onRightPressed: () {},
        ),
        body: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      '${AppConstant.assetImages}overview.png',
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
                    ),
                  ],
                ),
              ),
              const DottedLineRow(),
              24.height,
              const CustomLargeTextField(),
              30.height,
              CustomElevatedButton(
                title: 'Continue',
                minSize: Size(MediaQuery.sizeOf(context).width * 0.86, 45),
                onPressed: () {},
              ),
            ],
          ),
        ));
  }
}

class CustomLargeTextField extends StatefulWidget {
  const CustomLargeTextField({super.key});

  @override
  _CustomLargeTextFieldState createState() => _CustomLargeTextFieldState();
}

class _CustomLargeTextFieldState extends State<CustomLargeTextField> {
  final TextEditingController _controller = TextEditingController();
  int charCount = 0;
  final int maxLength = 500;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        width: 343,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF1F1D28), // Background color
          borderRadius: BorderRadius.circular(12), // Rounded corners
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              maxLines: 5, // Allows more text input
              maxLength: maxLength,
              style: const TextStyle(color: Colors.white, fontSize: 14),
              decoration: const InputDecoration(
                hintText: "Enter your text here...",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none, // Remove default border
                counterText: "", // Hide default character counter
              ),
              onChanged: (text) {
                setState(() {
                  charCount = text.length;
                });
              },
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "$charCount / $maxLength",
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DottedLineRow extends StatelessWidget {
  final double width; // Width of the dotted line
  final double dotSize; // Size of each dot
  final double space; // Space between dots
  final Color color; // Color of the dots

  const DottedLineRow({
    super.key,
    this.width = double.infinity, // Default full width
    this.dotSize = 4.0, // Default dot size
    this.space = 6.0, // Default space between dots
    this.color = Colors.grey, // Default dot color
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double totalWidth = width == double.infinity ? constraints.maxWidth : width;
        int dotCount = (totalWidth / (dotSize + space)).floor(); // Calculate number of dots

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(dotCount, (index) {
            return Container(
              width: dotSize,
              height: 1.5,
              margin: EdgeInsets.symmetric(horizontal: space / 2),
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            );
          }),
        );
      },
    );
  }
}
