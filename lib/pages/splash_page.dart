import 'package:flutter/material.dart';
import 'package:muhamad_flutter_siakad_app/pages/auth/auth_page.dart';

import '../common/constants/images.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => AuthPage(),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          Images.logo,

          ///bagian ini jika Images garis merah import dulu
          width: 150.0,
        ),
      ),
    );
  }
}
