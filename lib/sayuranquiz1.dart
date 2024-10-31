import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SayuranQuiz1 extends StatefulWidget {
  const SayuranQuiz1({super.key});

  @override
  State<SayuranQuiz1> createState() => _SayuranQuiz1State();
}

class _SayuranQuiz1State extends State<SayuranQuiz1> {
  int userCount = 0;
  int correctAnswers = 0;
  int wrongAnswers = 0;
  int questionIndex = 0;
  List<Map<String, dynamic>> questions = [
    {
      'image': 'assets/images/Bawang Merah.png',
      'question': 'What vegetables is this ?',
      'choices': ['Red Onion', 'Garlic', 'Spinach', 'Broccoli'],
      'correctAnswer': 'Red Onion',
    },
    {
      'image': 'assets/images/Bawang Putih.png',
      'question': 'What vegetables is this ?',
      'choices': ['Red Onion', 'Garlic', 'Spinach', 'Broccoli'],
      'correctAnswer': 'Garlic',
    },
    {
      'image': 'assets/images/Bayam.png',
      'question': 'What vegetables is this ?',
      'choices': ['Red Onion', 'Garlic', 'Spinach', 'Broccoli'],
      'correctAnswer': 'Spinach',
    },
    {
      'image': 'assets/images/Brokoli.png',
      'question': 'What vegetables is this ?',
      'choices': ['Red Onion', 'Garlic', 'Spinach', 'Broccoli'],
      'correctAnswer': 'Broccoli',
    },
    {
      'image': 'assets/images/Jagung.png',
      'question': 'What vegetables is this ?',
      'choices': ['Corn', 'Mushroom', 'Green Beans', 'Peas'],
      'correctAnswer': 'Corn',
    },
    {
      'image': 'assets/images/Jamur.png',
      'question': 'What vegetables is this ?',
      'choices': ['Corn', 'Mushroom', 'Green Beans', 'Peas'],
      'correctAnswer': 'Mushroom',
    },
    {
      'image': 'assets/images/Kacang Panjang.png',
      'question': 'What vegetables is this ?',
      'choices': ['Corn', 'Mushroom', 'Green Beans', 'Peas'],
      'correctAnswer': 'Green Beans',
    },
    {
      'image': 'assets/images/Kacang Polong.png',
      'question': 'What vegetables is this ?',
      'choices': ['Corn', 'Mushroom', 'Green Beans', 'Peas'],
      'correctAnswer': 'Peas',
    },
    {
      'image': 'assets/images/Kembang Kol.png',
      'question': 'What vegetables is this ?',
      'choices': ['Cauliflower', 'Potato', 'Cabbage', 'Pumpkin'],
      'correctAnswer': 'Cauliflower',
    },
    {
      'image': 'assets/images/Kentang.png',
      'question': 'What vegetables is this ?',
      'choices': ['Cauliflower', 'Potato', 'Cabbage', 'Pumpkin'],
      'correctAnswer': 'Potato',
    },
    {
      'image': 'assets/images/Kubis.png',
      'question': 'What vegetables is this ?',
      'choices': ['Cauliflower', 'Potato', 'Cabbage', 'Pumpkin'],
      'correctAnswer': 'Cabbage',
    },
    {
      'image': 'assets/images/Labu.png',
      'question': 'What vegetables is this ?',
      'choices': ['Cauliflower', 'Potato', 'Cabbage', 'Pumpkin'],
      'correctAnswer': 'Pumpkin',
    },
    {
      'image': 'assets/images/Lobak.png',
      'question': 'What vegetables is this ?',
      'choices': ['Radish', 'Cucumber', 'Bell Pepper', 'Lettuce'],
      'correctAnswer': 'Radish',
    },
    {
      'image': 'assets/images/Mentimun.png',
      'question': 'What vegetables is this ?',
      'choices': ['Radish', 'Cucumber', 'Bell Pepper', 'Lettuce'],
      'correctAnswer': 'Cucumber',
    },
    {
      'image': 'assets/images/Paprika.png',
      'question': 'What vegetables is this ?',
      'choices': ['Radish', 'Cucumber', 'Bell Pepper', 'Lettuce'],
      'correctAnswer': 'Bell Pepper',
    },
    {
      'image': 'assets/images/Selada.png',
      'question': 'What vegetables is this ?',
      'choices': ['Radish', 'Cucumber', 'Bell Pepper', 'Lettuce'],
      'correctAnswer': 'Lettuce',
    },
    {
      'image': 'assets/images/Terong.png',
      'question': 'What vegetables is this ?',
      'choices': ['Eggplant', 'Tomato', 'Sweet Potato', 'Carrot'],
      'correctAnswer': 'Eggplant',
    },
    {
      'image': 'assets/images/Tomat.png',
      'question': 'What vegetables is this ?',
      'choices': ['Eggplant', 'Tomato', 'Sweet Potato', 'Carrot'],
      'correctAnswer': 'Tomato',
    },
    {
      'image': 'assets/images/Ubi Jalar.png',
      'question': 'What vegetables is this ?',
      'choices': ['Eggplant', 'Tomato', 'Sweet Potato', 'Carrot'],
      'correctAnswer': 'Sweet Potato',
    },
    {
      'image': 'assets/images/Wortel.png',
      'question': 'What vegetables is this ?',
      'choices': ['Eggplant', 'Tomato', 'Sweet Potato', 'Carrot'],
      'correctAnswer': 'Carrot',
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
                  // Navigating to Vegetables Quiz is commented out since the import statement for 'Vegetables Quiz.dart' is missing in the code snippet.
                  // Uncomment the code below and replace 'Vegetables Quiz' with the appropriate import statement.
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (_) => Vegetables Quiz(),
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
          .collection('Vegetables Quiz 1 Database')
          .get();

      Map<String, dynamic> userInfo = await getUserInfoFromSharedPreferences();
      int userNumber = userInfo['userNumber'];

      await firestore
          .collection('Englifun')
          .doc('Englifun Database')
          .collection('Vegetables Quiz 1 Database')
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
                      'Vegetables Quiz 1',
                      style: TextStyle(
                        color: Color(0xFF02343F),
                        fontSize: 28,
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
