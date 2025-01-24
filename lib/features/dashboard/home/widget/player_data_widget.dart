import 'package:flutter/material.dart';
import 'package:soccer_mobile_app/config/theme/app_colors.dart';
import 'package:soccer_mobile_app/core/components/app_bar.dart';
import 'package:soccer_mobile_app/core/components/custom_button.dart';
import 'package:soccer_mobile_app/core/components/custom_text_field.dart';
import 'package:soccer_mobile_app/core/components/extensions.dart';

class PlayerDataWidget extends StatefulWidget {
  const PlayerDataWidget({super.key});

  @override
  State<PlayerDataWidget> createState() => _PlayerDataWidgetState();
}

class _PlayerDataWidgetState extends State<PlayerDataWidget> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  TextEditingController clubController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.primaryColor300.withOpacity(0.1),
      appBar: CommonAppBar(
        title: 'Player Data',
        isProfile: true,
        onLeftPressed: () {},
        onRightPressed: () {},
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'We need some information',
                style: textTheme.bodyMedium?.copyWith(
                  color: AppColors.secondaryColor600,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              24.height,
              Text(
                'Height *',
                style: textTheme.bodyMedium?.copyWith(
                  color: AppColors.secondaryColor400,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              12.height,
              WidgetTextField(controller: heightController),
              24.height,
              Text(
                'Weight *',
                style: textTheme.bodyMedium?.copyWith(
                  color: AppColors.secondaryColor400,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              12.height,
              WidgetTextField(controller: weightController),
              24.height,
              Text(
                'Country *',
                style: textTheme.bodyMedium?.copyWith(
                  color: AppColors.secondaryColor400,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              12.height,
              WidgetTextField(controller: countryController),
              24.height,
              Text(
                'Position *',
                style: textTheme.bodyMedium?.copyWith(
                  color: AppColors.secondaryColor400,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              12.height,
              WidgetTextField(controller: positionController),
              24.height,
              Text(
                'Club *',
                style: textTheme.bodyMedium?.copyWith(
                  color: AppColors.secondaryColor400,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              12.height,
              WidgetTextField(controller: clubController),
              50.height,
              CustomElevatedButton(
                title: 'Continue',
                onPressed: () {},
              ),
              50.height,
            ],
          ),
        ),
      ),
    );
  }
}
