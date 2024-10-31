import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AbjadQuiz1 extends StatefulWidget {
  const AbjadQuiz1({super.key});

  @override
  State<AbjadQuiz1> createState() => _AbjadQuiz1State();
}

class _AbjadQuiz1State extends State<AbjadQuiz1> {
  int userCount = 0;
  int correctAnswers = 0;
  int wrongAnswers = 0;
  int questionIndex = 0;
  List<Map<String, dynamic>> questions = [
    {
      'image': 'assets/images/M.png',
      'question': 'What letter is this ?',
      'choices': ['M', 'A', 'W', 'N'],
      'correctAnswer': 'M',
    },
    {
      'image': 'assets/images/W.png',
      'question': 'What letter is this ?',
      'choices': ['A', 'M', 'N', 'W'],
      'correctAnswer': 'W',
    },
    {
      'image': 'assets/images/H.png',
      'question': 'What letter is this ?',
      'choices': ['Z', 'H', 'K', 'B'],
      'correctAnswer': 'H',
    },
    {
      'image': 'assets/images/Z.png',
      'question': 'What letter is this ?',
      'choices': ['Z', 'H', 'K', 'B'],
      'correctAnswer': 'Z',
    },
    {
      'image': 'assets/images/E.png',
      'question': 'What letter is this ?',
      'choices': ['F', 'R', 'E', 'L'],
      'correctAnswer': 'E',
    },
    {
      'image': 'assets/images/S.png',
      'question': 'What letter is this ?',
      'choices': ['R', 'U', 'V', 'S'],
      'correctAnswer': 'S',
    },
    {
      'image': 'assets/images/B.png',
      'question': 'What letter is this ?',
      'choices': ['B', 'D', 'I', 'M'],
      'correctAnswer': 'B',
    },
    {
      'image': 'assets/images/Y.png',
      'question': 'What letter is this ?',
      'choices': ['Z', 'J', 'Y', 'W'],
      'correctAnswer': 'Y',
    },
    {
      'image': 'assets/images/L.png',
      'question': 'What letter is this ?',
      'choices': ['L', 'J', 'I', 'E'],
      'correctAnswer': 'L',
    },
    {
      'image': 'assets/images/Q.png',
      'question': 'What letter is this ?',
      'choices': ['O', 'Q', 'P', 'D'],
      'correctAnswer': 'Q',
    },
    {
      'image': 'assets/images/A.png',
      'question': 'What letter is this ?',
      'choices': ['A', 'B', 'C', 'D'],
      'correctAnswer': 'A',
    },
    {
      'image': 'assets/images/U.png',
      'question': 'What letter is this ?',
      'choices': ['V', 'W', 'U', 'Y'],
      'correctAnswer': 'U',
    },
    {
      'image': 'assets/images/P.png',
      'question': 'What letter is this ?',
      'choices': ['P', 'O', 'D', 'B'],
      'correctAnswer': 'P',
    },
    {
      'image': 'assets/images/D.png',
      'question': 'What letter is this ?',
      'choices': ['B', 'P', 'D', 'O'],
      'correctAnswer': 'D',
    },
    {
      'image': 'assets/images/J.png',
      'question': 'What letter is this ?',
      'choices': ['S', 'E', 'J', 'Z'],
      'correctAnswer': 'J',
    },
    {
      'image': 'assets/images/G.png',
      'question': 'What letter is this ?',
      'choices': ['O', 'G', 'Q', 'D'],
      'correctAnswer': 'G',
    },
    {
      'image': 'assets/images/R.png',
      'question': 'What letter is this ?',
      'choices': ['B', 'Q', 'P', 'R'],
      'correctAnswer': 'R',
    },
    {
      'image': 'assets/images/F.png',
      'question': 'What letter is this ?',
      'choices': ['V', 'E', 'F', 'X'],
      'correctAnswer': 'F',
    },
    {
      'image': 'assets/images/O.png',
      'question': 'What letter is this ?',
      'choices': ['O', 'P', 'D', 'Q'],
      'correctAnswer': 'O',
    },
    {
      'image': 'assets/images/I.png',
      'question': 'What letter is this ?',
      'choices': ['A', 'I', 'T', 'L'],
      'correctAnswer': 'I',
    },
    // Add your questions here
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
        builder: (context) {
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
        builder: (context) {
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
        builder: (context) {
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
                  // Navigate to the next screen or perform any desired action.
                },
                child: const Text(
                  'OK',
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

  //tambah disini
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

  // sampai sini
  Future<void> saveTestResult() async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      QuerySnapshot userCountSnapshot = await firestore
          .collection('Englifun')
          .doc('Englifun Database')
          .collection('Alphabet Quiz 1 Database')
          .get();

      //  int userNumber = userCountSnapshot.size + 0;
      //diganti dgn yg dibawah
      Map<String, dynamic> userInfo = await getUserInfoFromSharedPreferences();
      int userNumber = userInfo['userNumber'];
      //sampai sini
      await firestore
          .collection('Englifun')
          .doc('Englifun Database')
          .collection('Alphabet Quiz 1 Database')
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
    if (questions.isEmpty) {
      return const Scaffold(
        body: Center(
          child: Text('No questions available.'),
        ),
      );
    }
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
                      'Alphabet Quiz 1',
                      style: TextStyle(
                        color: Color(0xFF02343F),
                        fontSize: 32,
                        fontFamily: 'Dinofont',
                      ),
                    ),
                    Image.asset(question['image']),
                    const SizedBox(height: 20),
                    Text(
                      question['question'],
                      style: const TextStyle(
                        fontSize: 30,
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
