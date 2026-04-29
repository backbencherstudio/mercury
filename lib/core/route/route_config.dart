part of 'route_import_part.dart';

class AppRouter {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RouteName.signInScreen:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case RouteName.bottomNavScreen:
        return MaterialPageRoute(builder: (_) => const BottomNavScreen());
      case RouteName.previewScreen:
        return MaterialPageRoute(builder: (_) => const PreviewScreen());
      case RouteName.moreLeadActivityScreen:
        return MaterialPageRoute(builder: (_) => const MoreLeadActivityScreen());
      case RouteName.connectionRequestScreen:
        return MaterialPageRoute(builder: (_) => const ConnectionRequestScreen());
      case RouteName.availableScreen:
        return MaterialPageRoute(builder: (_) => const AvailableScreen());
      case RouteName.fullfilledScreen:
        return MaterialPageRoute(builder: (_) => const FullfilledScreen());
      case RouteName.supportCenterScreen:
        return MaterialPageRoute(builder: (_) => const SupportCenterScreen());
      case RouteName.supportCenterRequestScreen:
        return MaterialPageRoute(builder: (_) => const SupportCenterRequestScreen());
        case RouteName.watchVideoScreen:
        return MaterialPageRoute(builder: (_) => const WatchVideoScreen());
        case RouteName.rewardScreen:
        return MaterialPageRoute(builder: (_) => const RewardScreen());
        case RouteName.rewardDetailScreen:
        return MaterialPageRoute(builder: (_) => const RewardDetailScreen());
        case RouteName.profileScreen:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
        case RouteName.notificationScreen:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());
      default:
        return unDefineRoute();
    }
  }

  static Route<dynamic> unDefineRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: Text(AppString.noRoute)),
        body: Center(child: Text(AppString.noRoute)),
      ),
    );
  }
}
