import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yati_airline/core/extension/widget_extensions.dart';
import 'package:yati_airline/core/utils/form_validation.dart';
import 'package:yati_airline/widget/custom_botton.dart';
import 'package:yati_airline/widget/screen_padding.dart';
import 'package:yati_airline/widget/text_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passworController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScreenPadding(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFieldWidget(
                  controller: _userNameController,
                  hintText: 'username',
                  validator: FormValidator.usernameValidator,
                ).padBottom(bottom: 20.h),
                TextFieldWidget(
                  controller: _passworController,
                  isPassword: true,
                  validator: FormValidator.passwordValidator,
                  hintText: 'password',
                ).padBottom(bottom: 20.h),
                CustomBotton(onTap: () {}, lable: 'Login'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
