import 'package:findme_test/screens/homeScreen.dart';
import 'package:findme_test/screens/loginScreen.dart';
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
        primarySwatch: Colors.green,
      ).copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: const Color(0xFF32B108), //Couleur principale
              secondary: const Color(0xFF1665AE), //Couleur secondaire
            ),
      ),
      debugShowCheckedModeBanner: false,
      // Les differentes routes de l'application
      routes: {
        "/": (context) => const SplashScreen(),
        "/start": (context) => const StartScreen(),
        "/login": (context) => const LoginScreen(),
        "/welcome": (context) => const WelcomeScreen(),
        "/home": (context) => const HomeScreen(),
      },
    );
  }
}

// Le widget pour le splash screen, il durera 5 secondes

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
          MaterialPageRoute(builder: (_) => const StartScreen()));
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
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Rectangle.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: const Center(
          child: SizedBox(
            width: 250,
            height: 69,
            child: Image(
              image: AssetImage("assets/logo.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
