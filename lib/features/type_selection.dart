import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soccer_mobile_app/Utils/Constants/storage_keys.dart';
import 'package:soccer_mobile_app/config/routes/app_navigation.dart';
import 'package:soccer_mobile_app/config/routes/app_routes.dart';
import 'package:soccer_mobile_app/config/theme/app_colors.dart';
import 'package:soccer_mobile_app/core/constants/app_constant.dart';
import 'package:soccer_mobile_app/main.dart';

class TypeSelection extends StatefulWidget {
  const TypeSelection({super.key});

  @override
  State<TypeSelection> createState() => _TypeSelectionState();
}

class _TypeSelectionState extends State<TypeSelection> with TickerProviderStateMixin {
  String? selectedRole;

  // Animation controllers for each card
  late AnimationController _playerCardController;
  late AnimationController _coachCardController;
  late AnimationController _adminCardController;

  // Animation offsets for sliding in
  late Animation<Offset> _playerCardOffset;
  late Animation<Offset> _coachCardOffset;
  late Animation<Offset> _adminCardOffset;

  @override
  void initState() {
    super.initState();

    // Initialize animation controllers
    _playerCardController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _coachCardController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _adminCardController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    // Define easing curves for animations
    _playerCardOffset = Tween<Offset>(
      begin: const Offset(-1.0, 0.0), // Start off-screen to the left
      end: Offset.zero, // End at the original position
    ).animate(CurvedAnimation(parent: _playerCardController, curve: Curves.easeOut));

    _coachCardOffset = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _coachCardController, curve: Curves.easeOut));

    _adminCardOffset = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _adminCardController, curve: Curves.easeOut));

    // Trigger animations with delays
    Future.delayed(const Duration(milliseconds: 300), () => _playerCardController.forward());
    Future.delayed(const Duration(milliseconds: 600), () => _coachCardController.forward());
    Future.delayed(const Duration(milliseconds: 900), () => _adminCardController.forward());
  }

  @override
  void dispose() {
    _playerCardController.dispose();
    _coachCardController.dispose();
    _adminCardController.dispose();
    super.dispose();
  }

  // Function to handle role selection
  void selectRole(String role) {
    setState(() {
      selectedRole = role;
    });
    box.write(Storage.userRole, selectedRole);
    AppNavigation.pushReplacementTo(AppRoutes.routeLoginScreen, arguments: {'name': selectedRole});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor500,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
            child: Image.asset(
              "${AppConstant.assetImages}logo.png",
              fit: BoxFit.fitWidth,
              height: 35,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Player Card
                  SlideTransition(
                    position: _playerCardOffset,
                    child: RoleCard(
                      title: "Player",
                      imagePath: "${AppConstant.assetImages}player.png",
                      isSelected: selectedRole == "user",
                      onTap: () => selectRole("user"),
                    ),
                  ),
                  const SizedBox(height: 20), // Space between cards

                  // Coach Card
                  SlideTransition(
                    position: _coachCardOffset,
                    child: RoleCard(
                      title: "Coach",
                      imagePath: "${AppConstant.assetImages}coach.png",
                      isSelected: selectedRole == "coach",
                      onTap: () => selectRole("coach"),
                    ),
                  ),
                  const SizedBox(height: 20), // Space between cards

                  // Admin Card
                  SlideTransition(
                    position: _adminCardOffset,
                    child: RoleCard(
                      title: "Admin",
                      imagePath: "${AppConstant.assetImages}admin.png",
                      isSelected: selectedRole == "admin",
                      onTap: () => selectRole("admin"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RoleCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final bool isSelected;
  final VoidCallback onTap;

  const RoleCard({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Handle tap event
      child: Card(
        elevation: isSelected ? 8 : 4, // Highlight selected card
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: isSelected ? Colors.blue : Colors.transparent,
            width: 2,
          ),
        ),
        child: Container(
          height: 150, // Large card height
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: _getGradient(), // Get gradient based on selection state
          ),
          child: Row(
            children: [
              // Left Side: Title
              Expanded(
                child: Center(
                  child: Transform.rotate(
                    angle: -45 * (3.141592653589793 / 180),
                    child: Text(
                      title,
                      style: GoogleFonts.hanaleiFill(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        letterSpacing: 3.2,
                      ),
                    ),
                  ),
                ),
              ),
              // Right Side: Image
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                child: Image.asset(
                  imagePath,
                  width: 150,
                  height: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to get gradient colors
  LinearGradient _getGradient() {
    return LinearGradient(
      colors: [AppColors.primaryColor600, AppColors.primaryColor300],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }
}
