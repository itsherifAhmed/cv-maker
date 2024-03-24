import 'package:cv_maker/screens/components/common_component/text_styles.dart';
import 'package:cv_maker/util/colors/colors.dart';
import 'package:cv_maker/util/lists/users_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List<String> loading = [
  '',
  '.',
  '..',
  '...',
];

int currentLoadPosi = 0;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  refresh() {
    Future.delayed(const Duration(seconds: 1), () {
      if (currentLoadPosi < loading.length - 1) {
        setState(() {
          currentLoadPosi++;
        });
      } else {
        if (isLoggedin) {
          Navigator.pushReplacementNamed(context, '/home');
        } else {
          Navigator.pushReplacementNamed(context, '/login');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    refresh();
    return Scaffold(
      backgroundColor: primaryBgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('asset/images/home/splash.png'),
            const SizedBox(
              height: 14,
            ),
            Text(
              'Resume Maker!${loading[currentLoadPosi]}',
              style: GoogleFonts.philosopher(
                textStyle: textStyle(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
