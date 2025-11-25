import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stomata_app/core/utils/colors_utils.dart';
import 'package:stomata_app/features/splashscreen/splash_screen.dart';
import 'package:stomata_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        primaryColor: ColorsUtils.primaryColors,
        scaffoldBackgroundColor: ColorsUtils.bgColors,
        // textTheme: TextTheme(
        //   bodyLarge: TextStyle(color: ColorsUtils.secondaryColors),
        //   bodyMedium: TextStyle(color: ColorsUtils.secondaryColors),
        //   titleLarge: TextStyle(
        //     color: ColorsUtils.secondaryColors,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        textTheme: GoogleFonts.poppinsTextTheme(textTheme).apply(
          bodyColor: ColorsUtils.secondaryColors,
          displayColor: ColorsUtils.secondaryColors,
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
