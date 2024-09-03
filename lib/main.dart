import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listen_to_me/core/router/app_router.dart';
import 'package:listen_to_me/core/utils/constants.dart';
import 'package:listen_to_me/core/utils/locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GetLocator.setup();
  runApp(const MusicPlayerApp());
}

class MusicPlayerApp extends StatelessWidget {
  const MusicPlayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        textTheme: GoogleFonts.cairoTextTheme(),
        colorScheme: ColorScheme.light(
          primary: kPrimaryColor,
          secondary: kSecondaryColor,
          tertiary: kTertiaryColor,
        ),
      ),
      routerConfig: AppRouter.router,
    );
  }
}

var audioUrl =
    'https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3';
