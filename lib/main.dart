import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mercury/core_copy/route/route_import_part.dart';
import 'core_copy/resource/theme_manager.dart';
import 'core_copy/route/route_name.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   runApp(const ProviderScope(child: MyApp()));
// }

// class MyApp extends ConsumerWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return ScreenUtilInit(
//       minTextAdapt: true,
//       splitScreenMode: true,
//       designSize: const Size(375, 812),
//       builder: (_, _) => MaterialApp(
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(scaffoldBackgroundColor: Colors.white),
//         initialRoute: RouteNames.splashScreen,
//         routes: AppRoutes.routes,
//         onUnknownRoute: (settings) {
//           return MaterialPageRoute(
//             builder: (context) => Scaffold(
//               appBar: AppBar(title: const Text('Route Error')),
//               body: Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text('No route defined for: ${settings.name}'),
//                     const SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.of(context).pushNamedAndRemoveUntil(
//                           RouteNames.splashScreen,
//                           (route) => false,
//                         );
//                       },

//                       child: const Text('Go Home'),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: const Size(440, 956),
      builder: (context, child) => MaterialApp(
        title: 'ATLISS',
        debugShowCheckedModeBanner: false,

        theme: getApplicationTheme().copyWith(
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
        onGenerateRoute: AppRouter.getRoute,
        initialRoute: RouteName.splashScreen,
      ),
    );
  }
}