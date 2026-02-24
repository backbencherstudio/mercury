import 'package:flutter/cupertino.dart';
import 'package:mercury/core/routes/route_name.dart';
import '../../features/home/presentaion/screen/add_new_lead.dart';
import '../../features/home/presentaion/screen/preview_screen.dart';
import '../../features/home/presentaion/screen/support_center.dart';
import '../../features/login/presentation/screen/login_screen.dart';
import '../../features/onboarding_screen/presentation/screen/onboarding_screen.dart';
import '../../features/parent/presentation/screen/parent_screen.dart';
import '../../features/splash/splashScreen.dart';

class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    RouteNames.splashScreen: (context) => const Splashscreen(),
    RouteNames.loginScreen: (context) => const LoginScreen(),
    RouteNames.onboardingScreen: (context) => const OnboardingScreen(),
    RouteNames.parentScreen: (context) => const ParentScreen(),
    RouteNames.supportCenter: (context) => const SupportCenter(),
    RouteNames.addNewLead: (context) => const AddNewLead(),
    RouteNames.previewScreen: (context) => const PreviewScreen(),
  };
}
