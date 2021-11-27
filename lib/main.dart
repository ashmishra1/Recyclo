import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recyclo/screens/home/ui/home.dart';
import 'package:recyclo/screens/login/ui/login.dart';
import 'package:recyclo/screens/navbar/ui/navbar.dart';
import 'package:recyclo/screens/phone_auth/ui/phone_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Recyclo',
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      theme: ThemeData(
        textTheme: GoogleFonts.quicksandTextTheme(),
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        }),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.lightGreen)
            .copyWith(secondary: Colors.grey),
      ),
      home: const PhoneAuthScreen(),
    );
  }
}

/*class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/splash.jpg"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              bottom: 100,
              left: width / 2,
              child: Column(
                children: [
                  const Text(
                    "Recyclo",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 2,
                    width: 90,
                    color: Colors.amber,
                  )
                ],
              ),
            )
          ],
        ));
  }
}

class Init {
  Init._();
  static final instance = Init._();

  Future initialize() async {
    await Future.delayed(const Duration(seconds: 3));
  }
}
*/