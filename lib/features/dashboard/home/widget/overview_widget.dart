import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soccer_mobile_app/Models/data/auth/login_dm.dart';
import 'package:soccer_mobile_app/Provider/home_provider.dart';
import 'package:soccer_mobile_app/Utils/Constants/storage_keys.dart';
import 'package:soccer_mobile_app/config/routes/app_navigation.dart';
import 'package:soccer_mobile_app/config/theme/app_colors.dart';
import 'package:soccer_mobile_app/core/components/app_bar.dart';
import 'package:soccer_mobile_app/core/components/custom_button.dart';
import 'package:soccer_mobile_app/core/components/extensions.dart';
import 'package:soccer_mobile_app/core/constants/app_constant.dart';
import 'package:soccer_mobile_app/core/constants/widget_constant.dart';
import 'package:soccer_mobile_app/main.dart';

class OverviewWidget extends StatefulWidget {
  final arguments;
  const OverviewWidget({super.key, this.arguments});

  @override
  State<OverviewWidget> createState() => _OverviewWidgetState();
}

class _OverviewWidgetState extends State<OverviewWidget> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
        backgroundColor: AppColors.actionColor600,
        appBar: CommonAppBar(
          title: 'Overview',
          isProfile: true,
          onLeftPressed: () {
            AppNavigation.goBack();
          },
          onRightPressed: () {},
        ),
        body: Consumer<HomeProvider>(
          builder: (context, ref, child) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Image.asset(
                        '${AppConstant.assetImages}overview.png',
                        width: double.maxFinite,
                      ),
                      Positioned(
                        top: 30,
                        left: 8,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.arguments['index']['title'] ?? '',
                                style: textTheme.headlineSmall?.copyWith(
                                  color: AppColors.actionColor600,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              6.height,
                              Text(
                                widget.arguments['index']['sessionType'] ?? '',
                                style: textTheme.headlineMedium?.copyWith(
                                  color: AppColors.actionColor600,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              6.height,
                              Text(
                                WidgetConstants.formatDateRange(widget.arguments['index']['durationStart'], widget.arguments['index']['durationEnd']),
                                style: textTheme.headlineSmall?.copyWith(
                                  color: AppColors.actionColor600,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
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
                                        'Session Host',
                                        style: textTheme.bodySmall?.copyWith(
                                          color: AppColors.actionColor600,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        '${widget.arguments['index']['sessionHost']['firstName']} ${widget.arguments['index']['sessionHost']['lastName']}',
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
                                        '${widget.arguments['index']['sessionHost']['email']}',
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
                                        'Location',
                                        style: textTheme.bodySmall?.copyWith(
                                          color: AppColors.actionColor600,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        '${widget.arguments['index']['location'] ?? ''}',
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
                              (MediaQuery.sizeOf(context).height * 0.06).height,
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
                                        '\$${widget.arguments['index']['price']}',
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
                                        '\$${widget.arguments['index']['price']}',
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
                const Spacer(),
                CustomElevatedButton(
                  title: 'Continue',
                  minSize: Size(MediaQuery.sizeOf(context).width * 0.86, 45),
                  onPressed: () {
                    var userLogin = box.read(Storage.userData);
                    LoginResponse data = LoginResponse.fromJson(userLogin);
                    Map<String, dynamic> map = {};
                    map['sessionId'] = widget.arguments['index']['_id'];
                    map['userId'] = data.data?.sId;
                    ref.enrollSession(map);
                  },
                ),
                const Spacer(),
              ],
            );
          },
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
