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
      // case RouteName.registerRoute:
      //   return MaterialPageRoute(builder: (_) => const SignUpScreen());
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
