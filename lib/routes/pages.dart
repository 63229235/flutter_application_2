import 'package:flutter/material.dart';
import 'package:flutter_application_2/mapa.dart';
import 'package:flutter_application_2/request_permission/request_permission_page.dart';
import 'package:flutter_application_2/routes/routes.dart';
import 'package:flutter_application_2/splash/splash_page.dart';

Map<String, Widget Function(BuildContext)> appRoutes() {
  return {
    Routes.SPLASH: (_) => const SplashPage(),
    Routes.PERMISSIONS: (_) => const RequestPermissionPage(),
    Routes.HOME: (_) => const Mapa(),
  };
}
