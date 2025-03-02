import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soccer_mobile_app/Provider/auth_provider.dart';
import 'package:soccer_mobile_app/config/theme/app_colors.dart';

class WidgetImagePicker extends StatelessWidget {
  final bool isShow;
  const WidgetImagePicker({super.key, this.isShow = true});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (c, provider, x) {
      return Align(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.secondaryColor600,
              ),
              height: 120,
              width: 120,
              child: (provider.imagePath != null && provider.imagePath != '' && !provider.imagePath!.contains('https'))
                  ? ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(100)),
                      child: Image.file(
                        File(
                          provider.imagePath!,
                        ),
                        fit: BoxFit.fill,
                      ))
                  : provider.imagePath!.contains('https')
                      ? ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(100)),
                          child: Image.network(
                            provider.imagePath!,
                            fit: BoxFit.fill,
                          ))
                      : ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(100)),
                          child: Container(
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(color: AppColors.neutralColor400, shape: BoxShape.circle),
                              child: Image.network(
                                "https://media.istockphoto.com/id/1214428300/vector/default-profile-picture-avatar-photo-placeholder-vector-illustration.jpg?s=612x612&w=0&k=20&c=vftMdLhldDx9houN4V-g3C9k0xl6YeBcoB_Rk6Trce0=",
                                fit: BoxFit.fill,
                              )),
                        ),
            ),
            if (isShow)
              Positioned(
                bottom: 8,
                child: InkWell(
                  onTap: () {
                    _settingModalBottomSheet(context, provider);
                  },
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade600,
                    ),
                    padding: const EdgeInsets.all(2.0),
                    child: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ),
          ],
        ),
      );
    });
  }

  Future _settingModalBottomSheet(context, AuthProvider provider) {
    return showModalBottomSheet(
        isDismissible: true,
        context: context,
        builder: (BuildContext bc) {
          return Wrap(
            children: <Widget>[
              ListTile(
                  leading: const Icon(Icons.camera),
                  title: const Text('Camera'),
                  onTap: () {
                    Navigator.pop(context);
                    provider.setCamera(true);
                    provider.pickImage();
                  }),
              ListTile(
                leading: const Icon(Icons.browse_gallery_outlined),
                title: const Text('Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  provider.setCamera(false);
                  provider.pickImage();
                },
              ),
            ],
          );
        });
  }
}
