import 'package:flutter/material.dart';
import 'package:linkedin_ui/configuration/size_config.dart';
import 'package:linkedin_ui/view/components/splash_body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: SplashScreenBody(),
    );
  }
}
