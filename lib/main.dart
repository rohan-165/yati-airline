import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yati_airline/core/routes/route_generator.dart';
import 'package:yati_airline/core/services/navigation_service.dart';
import 'package:yati_airline/core/services/service_locator.dart';
import 'package:yati_airline/core/services/shared_pref_service.dart';
import 'package:yati_airline/core/utils/app_toast.dart';
import 'package:yati_airline/entry_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize the service manager and Local Storage
  await setupLocator().then((value) {
    getIt<SharedPrefsServices>().init();
  });
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DateTime? _currentBackPressTime;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        DateTime now = DateTime.now();
        if (_currentBackPressTime == null ||
            now.difference(_currentBackPressTime!) >
                const Duration(seconds: 2)) {
          _currentBackPressTime = now;
          AppToasts().showToast(
            message: "Tap back again  to exit app.",
            backgroundColor: Colors.black,
          );
        } else {
          if (Platform.isAndroid) {
            SystemNavigator.pop();
          } else if (Platform.isIOS) {
            exit(0);
          }
        }
      },
      canPop: false,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: ScreenUtilInit(
          designSize: Size(
            MediaQuery.sizeOf(context).width,
            MediaQuery.sizeOf(context).height,
          ),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return Material(
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  navigatorKey: NavigationService.navigatorKey,
                  onGenerateRoute: RouteGenerator.generateRoute,
                  home: EntryScreen(),
                  title: 'Yati Airline',
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
