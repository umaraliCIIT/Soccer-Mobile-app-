import '../constants/app_constant.dart';
import 'bottom_nav_model.dart';

class DataInitializations {
  // Bottom Navigation Bar Data
  static final List<BottomNavData> bottomNavData = [
    BottomNavData(title: "Home", iconAddress: "${AppConstant.assetIcons}home_icon.png"),
    BottomNavData(title: "Cycle", iconAddress: "${AppConstant.assetIcons}cycle_icon.png"),
    BottomNavData(title: "Tracking", iconAddress: "${AppConstant.assetIcons}tracking_icon.png"),
    BottomNavData(title: "Stories", iconAddress: "${AppConstant.assetIcons}stories_icon.png"),
    BottomNavData(title: "Feedback", iconAddress: "${AppConstant.assetIcons}feedback_icon.png"),
  ];
}
