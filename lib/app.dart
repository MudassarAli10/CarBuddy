import 'package:ecomerence_app/utils/constants/text_strings.dart';
import 'package:ecomerence_app/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:ecomerence_app/utils/constants/colors.dart';

import 'package:get/get_navigation/src/root/get_material_app.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: TTexts.appName,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      // initialBinding: GeneralBindings(),
      /*home: const Scaffold(
        body: Center(
          child: Text(
            'Awesome! 🎊 Project Structure is set up and running. \n Happy T Coding 🎊',
            textAlign: TextAlign.center,
          ),
        ),
      ),*/
      home: const Scaffold(
          backgroundColor: TColors.primary,
          body: Center(child: CircularProgressIndicator(color: Colors.white))),
    );
  }
}
