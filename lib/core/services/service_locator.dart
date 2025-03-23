// ignore: depend_on_referenced_packages

import 'package:get_it/get_it.dart';
import 'package:yati_airline/core/services/navigation_service.dart';
import 'package:yati_airline/core/services/network_service/api_manager.dart';
import 'package:yati_airline/core/services/network_service/api_request.dart';
import 'package:yati_airline/core/services/shared_pref_service.dart';

GetIt getIt = GetIt.instance;

Future<void> setupLocator() async {
  getIt.registerSingleton<NavigationService>(NavigationService());
  getIt.registerSingleton<SharedPrefsServices>(SharedPrefsServices());
  getIt.registerSingleton<ApiRequest>(ApiRequestImpl());
  getIt<ApiRequest>().setApiManager(ApiManager());
}
