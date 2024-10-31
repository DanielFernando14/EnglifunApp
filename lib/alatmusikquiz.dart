import 'package:englifun/alatmusikquiz1.dart';
import 'package:englifun/alatmusikquiz2.dart';
import 'package:flutter/material.dart';

class AlatMusikQuiz extends StatefulWidget {
  const AlatMusikQuiz({super.key});

  @override
  State<AlatMusikQuiz> createState() => _AlatMusikQuizState();
}

class _AlatMusikQuizState extends State<AlatMusikQuiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            color: const Color(0xFFF0EDCC),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 38,
                height: 38,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(208, 216, 175, 7),
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
          const Positioned(
            top: 50,
            left: 25,
            right: 0,
            child: Center(
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      'Music Instrument Quiz',
                      style: TextStyle(
                        color: Color(0xFF02343F),
                        fontSize: 30,
                        fontFamily: 'Dinofont',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Positioned(
            top: 275,
            left: 0,
            right: 0,
            child: Center(
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      'Come On, Practice Your Skills',
                      style: TextStyle(
                        color: Color(0xFF02343F),
                        fontSize: 28,
                        fontFamily: 'Dinofont',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 325,
            left: 0,
            right: 0,
            child: Center(
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AlatMusikQuiz1(),
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 0),
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/Gambar Abjad.png',
                                width: 100,
                                height: 100,
                              ),
                              const SizedBox(width: 5),
                              const Expanded(
                                child: Text(
                                  'Music Instrument Quiz 1',
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Color(0xFF02343F),
                                    fontFamily: 'Bubblegum',
                                  ),
                                ),
                              ),
                              Container(
                                width: 45,
                                height: 45,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(208, 216, 175, 7),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AlatMusikQuiz2(),
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 0),
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/Gambar Abjad.png',
                                width: 100,
                                height: 100,
                              ),
                              const SizedBox(width: 5),
                              const Expanded(
                                child: Text(
                                  'Music Instrument Quiz 2',
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Color(0xFF02343F),
                                    fontFamily: 'Bubblegum',
                                  ),
                                ),
                              ),
                              Container(
                                width: 45,
                                height: 45,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(208, 216, 175, 7),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
