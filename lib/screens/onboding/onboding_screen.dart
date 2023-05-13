import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:profinmovtser/screens/login/LoginPageMobile.dart';
import 'package:rive/rive.dart';
import 'components/animated_btn.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool isSignInDialogShown = false;
  late RiveAnimationController _btnAnimationColtroller;

  @override
  void initState() {
    _btnAnimationColtroller = OneShotAnimation(
      "active",
      autoplay: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
            ),
          ),
          const RiveAnimation.asset("assets/RiveAssets/shapes.riv"),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),
          AnimatedPositioned(
            top: isSignInDialogShown ? -50 : 0,
            duration: const Duration(milliseconds: 240),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    SizedBox(
                      width: 300,
                      child: Column(
                        children: const [
                          Text(
                            "Es tu EX?!😱",
                            style: TextStyle(
                                fontSize: 55,
                                fontFamily: "Poppins",
                                height: 1.2,
                                color: Colors
                                    .white //Theme.of(context).colorScheme.onBackground

                                ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            "En la vida nos topamos muchas personas que por alguna razon no funciono, pero eso no significa que todo acabo, con esta app podras ayuar a la gente a saber como son las personas en base a tu experiencias. Ayudando a que conecten mejor o a prevenir alguna situacion",
                            style: TextStyle(
                                color: Colors
                                    .white //Theme.of(context).colorScheme.onBackground
                                ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(flex: 2),
                    AnimatedBtn(
                      btnAnimationColtroller: _btnAnimationColtroller,
                      press: () {
                        _btnAnimationColtroller.isActive = true;
                        Future.delayed(
                          const Duration(milliseconds: 1000),
                          () {
                            setState(() {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()),
                                  (route) => true);
                            });
                          },
                        );
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Text("Ayudarlo🤍 o Quemarlo🔥  tu decies😉",
                          style: TextStyle(
                              color: Colors
                                  .white //Theme.of(context).colorScheme.onBackground
                              )),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
