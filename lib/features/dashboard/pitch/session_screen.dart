import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soccer_mobile_app/Models/data/dashboard/coaches_dm.dart';
import 'package:soccer_mobile_app/Provider/auth_provider.dart';
import 'package:soccer_mobile_app/Provider/home_provider.dart';
import 'package:soccer_mobile_app/Utils/Helpers/helper_functions.dart';
import 'package:soccer_mobile_app/config/theme/app_colors.dart';
import 'package:soccer_mobile_app/core/components/app_bar.dart';
import 'package:soccer_mobile_app/core/components/custom_dropdown_widget.dart';
import 'package:soccer_mobile_app/core/components/extensions.dart';
import 'package:soccer_mobile_app/features/dashboard/helpers/coach_dropdown_widget.dart';
import 'package:soccer_mobile_app/features/dashboard/helpers/date_picker_widget.dart';

import '../../../core/components/custom_button.dart';
import '../../../core/components/custom_text_field.dart';
import '../../auth/helpers/image_picker.dart';

class SessionScreen extends StatefulWidget {
  const SessionScreen({super.key});

  @override
  State<SessionScreen> createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> {
  final List<String> sessionTypes = ['Basic', 'Pro'];
  String? selectedSessionType = 'Basic';

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final maxParticipantsController = TextEditingController();
  final locationController = TextEditingController();
  DateTime? _selectedStartDate;
  DateTime? _selectedEndDate;
  CoachData? selectedCoach;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.microtask(() {
      Provider.of<HomeProvider>(context, listen: false).getAllCoaches();
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.actionColor600,
      resizeToAvoidBottomInset: true,
      appBar: CommonAppBar(
        title: 'Soccer',
        isProfile: true,
        onLeftPressed: () {},
        onRightPressed: () {},
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom, // Adjusts padding when keyboard opens
        ),
        child: Consumer2<AuthProvider, HomeProvider>(
          builder: (context, auth, provider, c) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  16.height,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Add Session',
                      style: textTheme.headlineSmall?.copyWith(color: AppColors.secondaryColor150),
                    ),
                  ),
                  24.height,
                  const WidgetImagePicker(),
                  24.height,
                  WidgetTextField(
                    controller: titleController,
                    hintText: 'Enter Session Title',
                  ),
                  24.height,
                  CustomDropdown<String>(
                    label: 'Session Type',
                    value: selectedSessionType,
                    items: sessionTypes,
                    onChanged: (newValue) {
                      setState(() {
                        selectedSessionType = newValue;
                      });
                      print('Selected session type: $newValue');
                    },
                  ),
                  24.height,
                  CoachDropdown(
                    coaches: provider.coaches.data ?? [],
                    selectedCoach: selectedCoach,
                    onChanged: (CoachData? coach) {
                      setState(() {
                        selectedCoach = coach;
                      });
                      print('Selected Cxoach: ${coach?.toJson()}');
                    },
                  ),
                  24.height,
                  WidgetTextField(
                    controller: descriptionController,
                    hintText: 'Description',
                  ),
                  24.height,
                  WidgetTextField(
                    controller: maxParticipantsController,
                    hintText: 'Max Participants',
                  ),
                  24.height,
                  WidgetTextField(
                    controller: locationController,
                    hintText: 'Location',
                  ),
                  24.height,
                  WidgetTextField(
                    controller: priceController,
                    hintText: 'Price',
                  ),
                  24.height,
                  DateRangePickerRow(
                    onDateRangeSelected: (start, end) {
                      setState(() {
                        _selectedStartDate = start;
                        _selectedEndDate = end;
                      });
                    },
                    initialStartDate: _selectedStartDate,
                    initialEndDate: _selectedEndDate,
                  ),
                  24.height,
                  CustomElevatedButton(
                    title: 'Next',
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      createSession(auth, provider);
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Future createSession(AuthProvider auth, HomeProvider home) async {
    if (selectedCoach?.sId == null ||
        _selectedStartDate == null ||
        _selectedEndDate == null ||
        titleController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        priceController.text.isEmpty ||
        maxParticipantsController.text.isEmpty ||
        locationController.text.isEmpty) {
      HelperFunctions.showErrorToast('Please fill the required fields!');
      return;
    }
    if (auth.imageFile == null) {
      HelperFunctions.showErrorToast('Please select an image first!');
      return;
    }
    Map<String, String> map = {
      'title': titleController.text,
      'description': descriptionController.text,
      'location': locationController.text,
      'sessionType': selectedSessionType!,
      'date': _selectedStartDate?.toLocal().toString() ?? "",
      'durationStart': _selectedStartDate?.toLocal().toString() ?? "",
      'durationEnd': _selectedEndDate?.toLocal().toString() ?? "",
      "price": priceController.text,
      "maxParticipants": maxParticipantsController.text,
      "coachId": jsonEncode(selectedCoach!.toJson()),
    };

    Map<String, File>? files;
    if (auth.imageFile != null) {
      files = {
        'file': auth.imageFile!, // Add the profile image file
      };
    }
    home.createCoach(fields: map, files: files);
  }
}
