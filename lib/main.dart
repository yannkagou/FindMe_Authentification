import 'package:findme_test/screens/homeScreen.dart';
import 'package:findme_test/screens/startScreen.dart';
import 'package:findme_test/screens/welcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FindMe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Rectangle.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Navigator(
              initialRoute: '/',
              onGenerateRoute: (RouteSettings settings) {
                WidgetBuilder builder;
                switch (settings.name) {
                  case '/':
                    builder = (BuildContext context) => const SplashScreen();
                    break;
                  case '/start':
                    builder = (BuildContext context) => const StartScreen();
                    break;
                  case '/welcome':
                    builder = (BuildContext context) => const WelcomeScreen();
                    break;
                  case '/home':
                    builder = (BuildContext context) => const HomeScreen();
                    break;
                  default:
                    throw Exception('Invalid route: ${settings.name}');
                }
                return MaterialPageRoute(
                  builder: builder,
                  settings: settings,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const HomeScreen()));
    });
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Opacity(
          opacity: 0.8,
          child: Image(
            width: 253,
            height: 69,
            image: AssetImage("assets/logo.png"),
          ),
        ),
      ),
    );
  }
}
