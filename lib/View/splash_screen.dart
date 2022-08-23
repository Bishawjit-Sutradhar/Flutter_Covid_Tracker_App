import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_covid_19_tracker_app/View/world_states.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

    late final AnimationController _controller=AnimationController(
        duration: const Duration(seconds: 3),
        vsync: this)..repeat();

    @override
  void dispose() {
    _controller.dispose();
  }

  @override
  void initState() {

    Timer(const Duration(seconds: 5), () {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>WorldStatesScreen()));
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              AnimatedBuilder(
                  animation: _controller,
                  child: Container(
                    height: 200,
                    width: 200,
                    child: Center(
                      child: Image(image: AssetImage('images/virus.png')),
                    ),
                  ),
                  builder: (BuildContext context, Widget?child){
                    return Transform.rotate(
                        angle: _controller.value * 2.0 * math.pi,
                      child: child,
                    );
                  }),
            SizedBox(
              height: MediaQuery.of(context).size.height *0.08,
            ),
            const Align(
                alignment: Alignment.center,
                child: Text('Covid-19 \n Tracker App',textAlign: TextAlign.center,style: TextStyle(
                  fontSize: 25,fontWeight: FontWeight.bold
                ),))
          ],
        ),
      ),
    );
  }


}