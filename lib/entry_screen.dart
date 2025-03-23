import 'package:flutter/material.dart';
import 'package:yati_airline/core/constants/shared_pref_keys.dart';
import 'package:yati_airline/core/services/service_locator.dart';
import 'package:yati_airline/core/services/shared_pref_service.dart';
import 'package:yati_airline/feature/auth/presentation/screen/login_screen.dart';
import 'package:yati_airline/feature/home/presentation/screen/home_screen.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({super.key});

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  String? token;

  @override
  void initState() {
    super.initState();
    token = getIt<SharedPrefsServices>().getString(
      key: SharedPrefKeys.tokenKey,
    );
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return token != null ? const HomeScreen() : const LoginScreen();
  }
}
