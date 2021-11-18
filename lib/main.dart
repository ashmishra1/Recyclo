import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recyclo/screens/home/ui/home.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Recyclo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: HomeScreen(),
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