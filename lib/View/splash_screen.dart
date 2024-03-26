import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'world_stats.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _animationController =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose()
  {
    super.dispose();
    _animationController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(const Duration(seconds: 5), ()=>
        Navigator.push(context, MaterialPageRoute(builder: (context) => const WorldStatsScreen()) )
    );

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: AnimatedBuilder(
                  animation: _animationController,
                  child: const SizedBox(
                    height: 200,
                    width: 200,
                    child: Center(
                      child: Image(image: AssetImage('assets/images/virus.png')),
                    ),
                  ),
                  builder: (buildContext, Widget? child) {
                    return Transform.rotate(
                      angle: _animationController.value * 2.0 * math.pi,
                      child: child,
                    );
                  }),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.08,),
            const Text('COVID - 19 \n Tracker App', style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25
            ), textAlign: TextAlign.center, )
          ],
        ),
      ),
    );
  }
}
