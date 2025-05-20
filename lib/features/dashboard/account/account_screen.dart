import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soccer_mobile_app/Provider/auth_provider.dart';
import 'package:soccer_mobile_app/config/routes/app_navigation.dart';
import 'package:soccer_mobile_app/config/routes/app_routes.dart';
import 'package:soccer_mobile_app/config/theme/app_colors.dart';
import 'package:soccer_mobile_app/core/components/app_bar.dart';
import 'package:soccer_mobile_app/core/components/custom_svg.dart';
import 'package:soccer_mobile_app/core/components/extensions.dart';
import 'package:soccer_mobile_app/core/constants/app_constant.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  late AuthProvider authProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
        backgroundColor: AppColors.actionColor600,
        appBar: CommonAppBar(
          title: 'My Profile',
          isProfile: true,
          onLeftPressed: () {},
          onRightPressed: () {},
        ),
        body: Consumer<AuthProvider>(builder: (c, authProvider, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
                child: ListTile(
                  leading: (authProvider.imagePath != null && authProvider.imagePath != '' && authProvider.imagePath != [])
                      ? ClipOval(
                          child: Image.network(
                          authProvider.imagePath,
                          width: 36.0,
                          height: 36.0,
                          fit: BoxFit.fill,
                        ))
                      : ClipOval(
                          child: Image.asset(
                            '${AppConstant.assetImages}profiles.png',
                            width: 36.0,
                            height: 36.0,
                            fit: BoxFit.fill,
                          ),
                        ),
                  minLeadingWidth: 40,
                  title: Text(
                    "${authProvider.fNameController.text} ${authProvider.lNameController.text}",
                    style: textTheme.headlineSmall?.copyWith(
                      color: AppColors.secondaryColor500,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: AppColors.secondaryColor50,
                    size: 18,
                  ),
                  onTap: () {
                    AppNavigation.navigateTo(AppRoutes.routeEditProfileScreen).then((value) {
                      authProvider.getProfile();
                    });
                  },
                ),
              ),
              12.height,
              Expanded(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        "${AppConstant.assetImages}accountBG.png",
                        fit: BoxFit.fill, // Ensure the image covers the entire container
                      ),
                    ),
                    Positioned(
                      top: 0,
                      bottom: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width * .99,
                        height: MediaQuery.of(context).size.height * 0.85,
                        padding: const EdgeInsets.fromLTRB(0, 40, 24, 16),
                        alignment: Alignment.topCenter,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              24.height,
                              Padding(
                                padding: const EdgeInsets.only(left: 24.0),
                                child: Text(
                                  'Account',
                                  style: textTheme.bodySmall?.copyWith(
                                    color: AppColors.secondaryColor250,
                                  ),
                                ),
                              ),
                              16.height,
                              _CustomListTile(
                                  isEmail: true,
                                  leading: 'mail.svg',
                                  title: 'Email Address',
                                  subtitle: Text(
                                    authProvider.emailController.text ?? 'abc@gmail.com',
                                    style: textTheme.bodySmall?.copyWith(
                                      color: AppColors.secondaryColor250,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  onClick: () {}),
                              _CustomListTile(
                                isEmail: false,
                                leading: 'call.svg',
                                title: 'Phone Number',
                                onClick: () {
                                  AppNavigation.navigateTo(AppRoutes.routeEditProfileScreen).then(
                                    (value) {
                                      authProvider.getProfile();
                                    },
                                  );
                                },
                              ),
                              _CustomListTile(
                                isEmail: false,
                                leading: 'square-lock.svg',
                                title: 'Change Password',
                                onClick: () {
                                  AppNavigation.navigateTo(AppRoutes.routeCreateNewPasswordScreen, arguments: true);
                                },
                              ),
                              24.height,
                              Padding(
                                padding: const EdgeInsets.only(left: 24.0),
                                child: Text(
                                  'Device',
                                  style: textTheme.bodySmall?.copyWith(
                                    color: AppColors.secondaryColor250,
                                  ),
                                ),
                              ),
                              16.height,
                              _CustomListTile(
                                isEmail: false,
                                leading: 'notification.svg',
                                title: 'Notification',
                                onClick: () {},
                              ),
                              _CustomListTile(
                                isEmail: false,
                                leading: 'language.svg',
                                title: 'Language',
                                onClick: () {},
                              ),
                              24.height,
                              Padding(
                                padding: const EdgeInsets.only(left: 24.0),
                                child: Text(
                                  'More',
                                  style: textTheme.bodySmall?.copyWith(
                                    color: AppColors.secondaryColor250,
                                  ),
                                ),
                              ),
                              16.height,
                              _CustomListTile(
                                isEmail: true,
                                subtitle: const SizedBox(),
                                leading: 'logout.svg',
                                title: 'Log out',
                                onClick: () {
                                  authProvider.logout();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        }));
  }
}

// Private class for custom ListTile
class _CustomListTile extends StatelessWidget {
  final bool isEmail;
  final String leading;
  final String title;
  final Widget? subtitle;
  final VoidCallback onClick;

  const _CustomListTile({
    required this.isEmail,
    required this.leading,
    required this.title,
    this.subtitle,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return ListTile(
      contentPadding: const EdgeInsets.only(left: 10),
      leading: SvgAsset(
        svgName: '${AppConstant.assetImages}$leading',
      ),
      title: Text(
        title,
        style: textTheme.bodySmall?.copyWith(
          color: AppColors.secondaryColor250,
        ),
      ),
      trailing: isEmail
          ? subtitle
          : const SvgAsset(
              svgName: '${AppConstant.assetImages}forward.svg',
            ),
      onTap: onClick, // Attach the onClick function
    );
  }
}
