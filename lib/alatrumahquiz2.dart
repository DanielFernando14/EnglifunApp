import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AlatRumahQuiz2 extends StatefulWidget {
  const AlatRumahQuiz2({super.key});

  @override
  State<AlatRumahQuiz2> createState() => _AlatRumahQuiz2State();
}

class _AlatRumahQuiz2State extends State<AlatRumahQuiz2> {
  int userCount = 0;
  int correctAnswers = 0;
  int wrongAnswers = 0;
  int questionIndex = 0;
  List<Map<String, dynamic>> questions = [
    {
      'image': 'assets/images/Foto.png',
      'homeapplianceList': 'Photo',
      'letter': 'Photo',
      'correctAnswer': 'True',
    },
    {
      'image': 'assets/images/Jam.png',
      'homeapplianceList': 'Clock',
      'letter': 'Vacuum Cleaner',
      'correctAnswer': 'False',
    },
    {
      'image': 'assets/images/Kipas Angin.png',
      'homeapplianceList': 'Fan',
      'letter': 'Fan',
      'correctAnswer': 'True',
    },
    {
      'image': 'assets/images/Komputer.png',
      'homeapplianceList': 'Computer',
      'letter': 'Speaker',
      'correctAnswer': 'False',
    },
    {
      'image': 'assets/images/Kulkas.png',
      'homeapplianceList': 'Refrigerator',
      'letter': 'Refrigerator',
      'correctAnswer': 'True',
    },
    {
      'image': 'assets/images/Kursi.png',
      'homeapplianceList': 'Chair',
      'letter': 'Door',
      'correctAnswer': 'False',
    },
    {
      'image': 'assets/images/Lemari Pakaian.png',
      'homeapplianceList': 'Wardrobe',
      'letter': 'Wardrobe',
      'correctAnswer': 'True',
    },
    {
      'image': 'assets/images/Meja.png',
      'homeapplianceList': 'Table',
      'letter': 'Sofa',
      'correctAnswer': 'False',
    },
    {
      'image': 'assets/images/Mesin Cuci.png',
      'homeapplianceList': 'Washing Machine',
      'letter': 'Washing Machine',
      'correctAnswer': 'True',
    },
    {
      'image': 'assets/images/Microwave.png',
      'homeapplianceList': 'Microwave',
      'letter': 'Bed',
      'correctAnswer': 'False',
    },
    {
      'image': 'assets/images/Pemanas Air.png',
      'homeapplianceList': 'Water Heater',
      'letter': 'Water Heater',
      'correctAnswer': 'True',
    },
    {
      'image': 'assets/images/Pembersih Vakum.png',
      'homeapplianceList': 'Vacuum Cleaner',
      'letter': 'Clock',
      'correctAnswer': 'False',
    },
    {
      'image': 'assets/images/Pemutar DVD.png',
      'homeapplianceList': 'DVD Player',
      'letter': 'Maracas',
      'correctAnswer': 'True',
    },
    {
      'image': 'assets/images/Pengeras Suara.png',
      'homeapplianceList': 'Speaker',
      'letter': 'Computer',
      'correctAnswer': 'False',
    },
    {
      'image': 'assets/images/Pengering Rambut.png',
      'homeapplianceList': 'Hair Dryer',
      'letter': 'Hair Dryer',
      'correctAnswer': 'True',
    },
    {
      'image': 'assets/images/Pintu.png',
      'homeapplianceList': 'Door',
      'letter': 'Chair',
      'correctAnswer': 'False',
    },
    {
      'image': 'assets/images/Setrika.png',
      'homeapplianceList': 'Iron',
      'letter': 'Iron',
      'correctAnswer': 'True',
    },
    {
      'image': 'assets/images/Sofa.png',
      'homeapplianceList': 'Sofa',
      'letter': 'Table',
      'correctAnswer': 'False',
    },
    {
      'image': 'assets/images/Televisi.png',
      'homeapplianceList': 'Television',
      'letter': 'Television',
      'correctAnswer': 'True',
    },
    {
      'image': 'assets/images/Tempat Tidur.png',
      'homeapplianceList': 'Bed',
      'letter': 'Microwave',
      'correctAnswer': 'False',
    },
    // Tambahkan pertanyaan-pertanyaan lain di sini.
  ];
  late FlutterTts flutterTts;

  @override
  void initState() {
    super.initState();
    shuffleQuestions();
    flutterTts = FlutterTts();
  }

  void shuffleQuestions() {
    final random = Random();
    for (var i = questions.length - 1; i > 0; i--) {
      final j = random.nextInt(i + 1);
      final temp = questions[i];
      questions[i] = questions[j];
      questions[j] = temp;
    }
  }

  void checkAnswer(String selectedAnswer) {
    final correctAnswer = questions[questionIndex]['correctAnswer'];
    if (selectedAnswer == correctAnswer) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            titleTextStyle: const TextStyle(
              fontSize: 22,
              fontFamily: 'Wigglye',
              color: Colors.black,
            ),
            contentTextStyle: const TextStyle(
              fontSize: 22,
              fontFamily: 'Wigglye',
              color: Colors.black,
            ),
            title: const Text('Congrats!'),
            content: const Text('Your answer is correct.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  nextQuestion();
                },
                child: const Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Wigglye',
                    color: Colors.black,
                  ),
                ),
              ),
            ],
            backgroundColor: Colors.greenAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          );
        },
      );
      setState(() {
        correctAnswers++; // Menambah jumlah jawaban benar.
      });
    } else {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            titleTextStyle: const TextStyle(
              fontSize: 22,
              fontFamily: 'Wigglye',
              color: Colors.white,
            ),
            contentTextStyle: const TextStyle(
              fontSize: 22,
              fontFamily: 'Wigglye',
              color: Colors.white,
            ),
            title: const Text('Sorry!'),
            content: const Text('Your answer is wrong.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  nextQuestion();
                },
                child: const Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Wigglye',
                    color: Colors.white,
                  ),
                ),
              ),
            ],
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          );
        },
      );
      setState(() {
        wrongAnswers++; // Menambah jumlah jawaban salah.
      });
    }
  }

  void nextQuestion() {
    if (questionIndex < questions.length - 1) {
      setState(() {
        questionIndex++;
      });
    } else {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          String grade;
          if (correctAnswers >= 0 && correctAnswers <= 4) {
            grade = 'D';
          } else if (correctAnswers >= 5 && correctAnswers <= 9) {
            grade = 'C';
          } else if (correctAnswers >= 10 && correctAnswers <= 14) {
            grade = 'B';
          } else {
            grade = 'A';
          }
          return AlertDialog(
            titleTextStyle: const TextStyle(
              fontSize: 22,
              fontFamily: 'Wigglye',
              color: Colors.white,
            ),
            contentTextStyle: const TextStyle(
              fontSize: 22,
              fontFamily: 'Wigglye',
              color: Colors.white,
            ),
            title: const Text('Results'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Correct Answer: $correctAnswers'),
                Text('Wrong Answer: $wrongAnswers'),
                Text('Grade: $grade'),
              ],
            ),
            backgroundColor: const Color.fromARGB(255, 122, 95, 7),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  saveTestResult();
                  Navigator.pop(context);
                },
                child: const Text(
                  'Finish',
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Wigglye',
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          );
        },
      );
    }
  }

  Future<Map<String, dynamic>> getUserInfoFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String userName = prefs.getString('userName') ?? '';
    String email = prefs.getString('email') ?? '';
    int userNumber = prefs.getInt('userNumber') ?? 0;

    return {
      'userName': userName,
      'email': email,
      'userNumber': userNumber,
    };
  }

  Future<void> saveTestResult() async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      QuerySnapshot userCountSnapshot = await firestore
          .collection('Englifun')
          .doc('Englifun Database')
          .collection('Home Appliance Quiz 2 Database')
          .get();

      Map<String, dynamic> userInfo = await getUserInfoFromSharedPreferences();
      int userNumber = userInfo['userNumber'];

      await firestore
          .collection('Englifun')
          .doc('Englifun Database')
          .collection('Home Appliance Quiz 2 Database')
          .doc('user_$userNumber')
          .set({
        'Correct Answer': correctAnswers,
        'Wrong Answer': wrongAnswers,
        'Grade': getGrade(),
        'userNumber': userNumber,
        // Add other properties as needed
      });

      userCount++;
    } catch (e) {
      if (kDebugMode) {
        print('Error saving test result: $e');
      }
    }
  }

  String getGrade() {
    if (correctAnswers >= 0 && correctAnswers <= 4) {
      return 'D';
    } else if (correctAnswers >= 5 && correctAnswers <= 9) {
      return 'C';
    } else if (correctAnswers >= 10 && correctAnswers <= 14) {
      return 'B';
    } else {
      return 'A';
    }
  }

  Future<void> speak(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[questionIndex];
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
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Center(
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const Text(
                      'Home Appliance Quiz 2',
                      style: TextStyle(
                        color: Color(0xFF02343F),
                        fontSize: 24,
                        fontFamily: 'Dinofont',
                      ),
                    ),
                    Image.asset(question['image']),
                    const SizedBox(height: 0),
                    ElevatedButton(
                      onPressed: () {
                        speak("${question['homeapplianceList']}?");
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color(0xFF02343F),
                        backgroundColor: const Color(0xFFF0EDCC),
                      ),
                      child: const Text('Play',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Dinofont',
                          )),
                    ),
                    Text(
                      'Is this a  ${question['letter']}?',
                      style: const TextStyle(
                        fontSize: 26,
                        fontFamily: 'Dinofont',
                      ),
                    ),
                    const SizedBox(height: 20),
                    IntrinsicWidth(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: const Color(0xFFF0EDCC),
                              backgroundColor: const Color(0xFF02343F),
                            ),
                            onPressed: () {
                              checkAnswer('True');
                            },
                            child: const Text(
                              'True',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFFF0EDCC),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: const Color(0xFFF0EDCC),
                              backgroundColor: const Color(0xFF02343F),
                            ),
                            onPressed: () {
                              checkAnswer('False');
                            },
                            child: const Text(
                              'False',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFFF0EDCC),
                              ),
                            ),
                          ),
                        ],
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

  @override
  void dispose() {
    saveTestResult();
    super.dispose();
  }
}
