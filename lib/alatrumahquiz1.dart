import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AlatRumahQuiz1 extends StatefulWidget {
  const AlatRumahQuiz1({super.key});

  @override
  State<AlatRumahQuiz1> createState() => _AlatRumahQuiz1State();
}

class _AlatRumahQuiz1State extends State<AlatRumahQuiz1> {
  int userCount = 0;
  int correctAnswers = 0;
  int wrongAnswers = 0;
  int questionIndex = 0;
  List<Map<String, dynamic>> questions = [
    {
      'image': 'assets/images/Foto.png',
      'question': 'What is the name of home appliance ?',
      'choices': ['Photo', 'Clock', 'Fan', 'Computer'],
      'correctAnswer': 'Photo',
    },
    {
      'image': 'assets/images/Jam.png',
      'question': 'What is the name of home appliance ?',
      'choices': ['Photo', 'Clock', 'Fan', 'Computer'],
      'correctAnswer': 'Clock',
    },
    {
      'image': 'assets/images/Kipas Angin.png',
      'question': 'What is the name of home appliance ?',
      'choices': ['Photo', 'Clock', 'Fan', 'Computer'],
      'correctAnswer': 'Fan',
    },
    {
      'image': 'assets/images/Komputer.png',
      'question': 'What is the name of home appliance ?',
      'choices': ['Photo', 'Clock', 'Fan', 'Computer'],
      'correctAnswer': 'Computer',
    },
    {
      'image': 'assets/images/Kulkas.png',
      'question': 'What is the name of home appliance ?',
      'choices': ['Refrigator', 'Chair', 'Wardobe', 'Table'],
      'correctAnswer': 'Refrigator',
    },
    {
      'image': 'assets/images/Kursi.png',
      'question': 'What is the name of home appliance ?',
      'choices': ['Refrigator', 'Chair', 'Wardobe', 'Table'],
      'correctAnswer': 'Chair',
    },
    {
      'image': 'assets/images/Lemari Pakaian.png',
      'question': 'What is the name of home appliance ?',
      'choices': ['Refrigator', 'Chair', 'Wardobe', 'Table'],
      'correctAnswer': 'Wardobe',
    },
    {
      'image': 'assets/images/Meja.png',
      'question': 'What is the name of home appliance ?',
      'choices': ['Refrigator', 'Chair', 'Wardobe', 'Table'],
      'correctAnswer': 'Table',
    },
    {
      'image': 'assets/images/Mesin Cuci.png',
      'question': 'What is the name of home appliance ?',
      'choices': [
        'Washing Machine',
        'Microwave',
        'Water heater',
        'Vacuum Cleaner'
      ],
      'correctAnswer': 'Washing Machine',
    },
    {
      'image': 'assets/images/Microwave.png',
      'question': 'What is the name of home appliance ?',
      'choices': [
        'Washing Machine',
        'Microwave',
        'Water heater',
        'Vacuum Cleaner'
      ],
      'correctAnswer': 'Microwave',
    },
    {
      'image': 'assets/images/Pemanas Air.png',
      'question': 'What is the name of home appliance ?',
      'choices': [
        'Washing Machine',
        'Microwave',
        'Water heater',
        'Vacuum Cleaner'
      ],
      'correctAnswer': 'Water heater',
    },
    {
      'image': 'assets/images/Pembersih Vakum.png',
      'question': 'What is the name of home appliance ?',
      'choices': [
        'Washing Machine',
        'Microwave',
        'Water heater',
        'Vacuum Cleaner'
      ],
      'correctAnswer': 'Vacuum Cleaner',
    },
    {
      'image': 'assets/images/Pemutar DVD.png',
      'question': 'What is the name of home appliance ?',
      'choices': ['DVD Player', 'Speaker', 'Hair Dryer', 'Door'],
      'correctAnswer': 'DVD Player',
    },
    {
      'image': 'assets/images/Pengeras Suara.png',
      'question': 'What is the name of home appliance ?',
      'choices': ['DVD Player', 'Speaker', 'Hair Dryer', 'Door'],
      'correctAnswer': 'Speaker',
    },
    {
      'image': 'assets/images/Pengering Rambut.png',
      'question': 'What is the name of home appliance ?',
      'choices': ['DVD Player', 'Speaker', 'Hair Dryer', 'Door'],
      'correctAnswer': 'Hair Dryer',
    },
    {
      'image': 'assets/images/Pintu.png',
      'question': 'What is the name of home appliance ?',
      'choices': ['DVD Player', 'Speaker', 'Hair Dryer', 'Door'],
      'correctAnswer': 'Door',
    },
    {
      'image': 'assets/images/Setrika.png',
      'question': 'What is the name of home appliance ?',
      'choices': ['Iron', 'Sofa', 'Television', 'Bed'],
      'correctAnswer': 'Iron',
    },
    {
      'image': 'assets/images/Sofa.png',
      'question': 'What is the name of home appliance ?',
      'choices': ['Iron', 'Sofa', 'Television', 'Bed'],
      'correctAnswer': 'Sofa',
    },
    {
      'image': 'assets/images/Televisi.png',
      'question': 'What is the name of home appliance ?',
      'choices': ['Iron', 'Sofa', 'Television', 'Bed'],
      'correctAnswer': 'Television',
    },
    {
      'image': 'assets/images/Tempat Tidur.png',
      'question': 'What is the name of home appliance ?',
      'choices': ['Iron', 'Sofa', 'Television', 'Bed'],
      'correctAnswer': 'Bed',
    },
    // Add more questions here.
  ];

  @override
  void initState() {
    super.initState();
    shuffleQuestions();
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
        correctAnswers++; // Increase the number of Correct Answer.
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
        wrongAnswers++; // Increase the number of Wrong Answer.
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
                  // Navigating to Home ApplianceQuiz() is commented out since the import statement for 'Home Appliance quiz.dart' is missing in the code snippet.
                  // Uncomment the code below and replace 'Home ApplianceQuiz()' with the appropriate import statement.
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (_) => Home ApplianceQuiz(),
                  //   ),
                  // );
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
          .collection('Home Appliance Quiz 1 Database')
          .get();

      Map<String, dynamic> userInfo = await getUserInfoFromSharedPreferences();
      int userNumber = userInfo['userNumber'];

      await firestore
          .collection('Englifun')
          .doc('Englifun Database')
          .collection('Home Appliance Quiz 1 Database')
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
                      'Home Appliance Quiz 1',
                      style: TextStyle(
                        color: Color(0xFF02343F),
                        fontSize: 24,
                        fontFamily: 'Dinofont',
                      ),
                    ),
                    Image.asset(question['image']),
                    const SizedBox(height: 20),
                    Text(
                      question['question'],
                      style: const TextStyle(
                        fontSize: 22,
                        fontFamily: 'Dinofont',
                      ),
                    ),
                    const SizedBox(height: 0),
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      childAspectRatio: 2.5,
                      children: List.generate(
                        question['choices'].length,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 10,
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: const Color(0xFFF0EDCC),
                              backgroundColor: const Color(0xFF02343F),
                            ),
                            onPressed: () {
                              checkAnswer(question['choices'][index]);
                            },
                            child: Text(
                              question['choices'][index],
                              style: const TextStyle(
                                fontSize: 18,
                                color: Color(0xFFF0EDCC),
                              ),
                            ),
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

  @override
  void dispose() {
    saveTestResult();
    super.dispose();
  }
}
