import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OlahragaQuiz1 extends StatefulWidget {
  const OlahragaQuiz1({super.key});

  @override
  State<OlahragaQuiz1> createState() => _OlahragaQuiz1State();
}

class _OlahragaQuiz1State extends State<OlahragaQuiz1> {
  int userCount = 0;
  int correctAnswers = 0;
  int wrongAnswers = 0;
  int questionIndex = 0;
  List<Map<String, dynamic>> questions = [
    {
      'image': 'assets/images/Angkat Berat.png',
      'question': 'What sport is this ?',
      'choices': ['Weightlifting', 'Baseball', 'Basketball', 'Cycling'],
      'correctAnswer': 'Weightlifting',
    },
    {
      'image': 'assets/images/Baseball.png',
      'question': 'What sport is this ?',
      'choices': ['Weightlifting', 'Baseball', 'Basketball', 'Cycling'],
      'correctAnswer': 'Baseball',
    },
    {
      'image': 'assets/images/Basket.png',
      'question': 'What sport is this ?',
      'choices': ['Weightlifting', 'Baseball', 'Basketball', 'Cycling'],
      'correctAnswer': 'Basketball',
    },
    {
      'image': 'assets/images/Olahraga Bersepeda.png',
      'question': 'What sport is this ?',
      'choices': ['Weightlifting', 'Baseball', 'Basketball', 'Cycling'],
      'correctAnswer': 'Cycling',
    },
    {
      'image': 'assets/images/Bulutangkis.png',
      'question': 'What sport is this ?',
      'choices': ['Badminton', 'Wrestling', 'Hockey', 'Judo'],
      'correctAnswer': 'Badminton',
    },
    {
      'image': 'assets/images/Gulat.png',
      'question': 'What sport is this ?',
      'choices': ['Badminton', 'Wrestling', 'Hockey', 'Judo'],
      'correctAnswer': 'Wrestling',
    },
    {
      'image': 'assets/images/Hoki.png',
      'question': 'What sport is this ?',
      'choices': ['Badminton', 'Wrestling', 'Hockey', 'Judo'],
      'correctAnswer': 'Hockey',
    },
    {
      'image': 'assets/images/Judo.png',
      'question': 'What sport is this ?',
      'choices': ['Badminton', 'Wrestling', 'Hockey', 'Judo'],
      'correctAnswer': 'Judo',
    },
    {
      'image': 'assets/images/Karate.png',
      'question': 'What sport is this ?',
      'choices': ['Karate', 'Running', 'Jump Rope', 'Archery'],
      'correctAnswer': 'Karate',
    },
    {
      'image': 'assets/images/Lari.png',
      'question': 'What sport is this ?',
      'choices': ['Karate', 'Running', 'Jump Rope', 'Archery'],
      'correctAnswer': 'Running',
    },
    {
      'image': 'assets/images/Lompat Tali.png',
      'question': 'What sport is this ?',
      'choices': ['Karate', 'Running', 'Jump Rope', 'Archery'],
      'correctAnswer': 'Jump Rope',
    },
    {
      'image': 'assets/images/Panahan.png',
      'question': 'What sport is this ?',
      'choices': ['Karate', 'Running', 'Jump Rope', 'Archery'],
      'correctAnswer': 'Archery',
    },
    {
      'image': 'assets/images/Panjat Tebing.png',
      'question': 'What sport is this ?',
      'choices': ['Rock Climbing', 'Swimming', 'Ice Skatting', 'Gymnastics'],
      'correctAnswer': 'Rock Climbing',
    },
    {
      'image': 'assets/images/Renang.png',
      'question': 'What sport is this ?',
      'choices': ['Rock Climbing', 'Swimming', 'Ice Skatting', 'Gymnastics'],
      'correctAnswer': 'Swimming',
    },
    {
      'image': 'assets/images/Seluncur Es.png',
      'question': 'What sport is this ?',
      'choices': ['Rock Climbing', 'Swimming', 'Ice Skatting', 'Gymnastics'],
      'correctAnswer': 'Ice Skatting',
    },
    {
      'image': 'assets/images/Senam.png',
      'question': 'What sport is this ?',
      'choices': ['Rock Climbing', 'Swimming', 'Ice Skatting', 'Gymnastics'],
      'correctAnswer': 'Gymnastics',
    },
    {
      'image': 'assets/images/Sepak Bola.png',
      'question': 'What sport is this ?',
      'choices': ['Soccer', 'Skateboarding', 'Tennis', 'Volleyball'],
      'correctAnswer': 'Soccer',
    },
    {
      'image': 'assets/images/Skateboard.png',
      'question': 'What sport is this ?',
      'choices': ['Soccer', 'Skateboarding', 'Tennis', 'Volleyball'],
      'correctAnswer': 'Skateboarding',
    },
    {
      'image': 'assets/images/Tennis.png',
      'question': 'What sport is this ?',
      'choices': ['Soccer', 'Skateboarding', 'Tennis', 'Volleyball'],
      'correctAnswer': 'Tennis',
    },
    {
      'image': 'assets/images/Voli.png',
      'question': 'What sport is this ?',
      'choices': ['Soccer', 'Skateboarding', 'Tennis', 'Volleyball'],
      'correctAnswer': 'Volleyball',
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
                  // Navigating to Sport Quiz is commented out since the import statement for 'Sport Quiz.dart' is missing in the code snippet.
                  // Uncomment the code below and replace 'Sport Quiz' with the appropriate import statement.
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (_) => Sport Quiz(),
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
          .collection('Sport Quiz 1 Database')
          .get();

      Map<String, dynamic> userInfo = await getUserInfoFromSharedPreferences();
      int userNumber = userInfo['userNumber'];

      await firestore
          .collection('Englifun')
          .doc('Englifun Database')
          .collection('Sport Quiz 1 Database')
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
                      'Sport Quiz 1',
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
