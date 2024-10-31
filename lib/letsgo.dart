import 'package:englifun/dashboard.dart';
import 'package:englifun/registration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class LetsGo extends StatefulWidget {
  const LetsGo({super.key});

  @override
  State<LetsGo> createState() => _LetsGoState();
}

class _LetsGoState extends State<LetsGo> {
  bool isLoading = true;
  FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();

    flutterTts.setLanguage("en-US");
    double speechRate = 0.7;
    flutterTts.setSpeechRate(speechRate);
    flutterTts.setPitch(0.7);
    flutterTts.speak("Welcome to Engli fun... Let's Start");

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            return Scaffold(
              resizeToAvoidBottomInset: true,
              body: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage('assets/images/Background Lets Go.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: const Scaffold(
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: orientation == Orientation.portrait
                            ? constraints.maxHeight * 0.20
                            : constraints.maxHeight * 0.10,
                      ),
                      child: const Text(
                        'Welcome to',
                        style: TextStyle(
                          fontFamily: 'BlobbyChug-Bold',
                          fontSize: 25,
                          color: Color.fromARGB(255, 12, 139, 135),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: orientation == Orientation.portrait
                            ? constraints.maxHeight * 0.23
                            : constraints.maxHeight * 0.13,
                      ),
                      child: Image.asset(
                        'assets/images/Englifun Logo.png',
                        height: orientation == Orientation.portrait
                            ? constraints.maxHeight * 0.2
                            : constraints.maxHeight * 0.12,
                        width: orientation == Orientation.portrait
                            ? constraints.maxWidth * 0.55
                            : constraints.maxWidth * 0.35,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: Column(
                      children: [
                        if (!isLoading)
                          ElevatedButton(
                            onPressed: () {
                              User? currentUser =
                                  FirebaseAuth.instance.currentUser;
                              if (currentUser != null) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Dashboard(),
                                  ),
                                );
                              } else {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Registration(),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor:
                                  const Color.fromARGB(255, 8, 160, 99),
                              textStyle: const TextStyle(
                                fontFamily: 'BlobbyChug-Bold',
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                              minimumSize: const Size.fromHeight(30.0),
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                            ),
                            child: const Text("LET'S START"),
                          ),
                        const SizedBox(height: 16.0),
                        if (isLoading)
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Column(
                                children: [
                                  const Text(
                                    'L o a d i n g . . . .',
                                    style: TextStyle(
                                      fontFamily: 'HandyCraft',
                                      fontStyle: FontStyle.italic,
                                      fontSize: 12,
                                      color: Color(0xFF087FA0),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  LinearPercentIndicator(
                                    animation: true,
                                    animationDuration: 10000,
                                    lineHeight: 20.0,
                                    percent: 1.0,
                                    progressColor: const Color.fromARGB(
                                      255,
                                      8,
                                      127,
                                      160,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
