import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mercury/core/route/route_import_part.dart';
import 'core/resource/theme_manager.dart';
import 'core/route/route_name.dart';

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
        title: 'Agua Leads',
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