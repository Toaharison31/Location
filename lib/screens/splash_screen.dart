import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../screens/registre_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double opacity = 1.0;
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(
      const Duration(seconds: 2),
      (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RegisterScreen()));
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child : AnimatedOpacity(
        opacity: opacity, 
        duration: const Duration(seconds: 7),
        child: Image.asset('lib/screens/images/pneu.png', width: 100, height: 100,)
        )
      ),
    );
  }
}
