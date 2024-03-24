import 'package:cv_maker/screens/create_resume_ui/create_resume.dart';
import 'package:cv_maker/screens/rate_us_ui/rate_us.dart';
import 'package:cv_maker/screens/resume_view_ui/resume_view.dart';
import 'package:cv_maker/screens/home_ui/home_scr.dart';
import 'package:cv_maker/screens/login_register_ui/login_reg.dart';
import 'package:cv_maker/screens/splash_ui/splash_scr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(const CVMaker());
}

class CVMaker extends StatelessWidget {
  const CVMaker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      //routes of screens
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/create': (context) => const CreateResume(),
        '/resume': (context) => const ResumeView(),
        '/rate': (context) => const RateUs(),
      },
    );
  }
}
