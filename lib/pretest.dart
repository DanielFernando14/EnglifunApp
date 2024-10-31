import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:englifun/dashboard.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreTest extends StatefulWidget {
  const PreTest({super.key});

  @override
  State<PreTest> createState() => _PreTestState();
}

class _PreTestState extends State<PreTest> {
  int userCount = 0;
  int correctAnswers = 0;
  int wrongAnswers = 0;
  int questionIndex = 0;
  List<Map<String, dynamic>> questions = [
    {
      'image': 'assets/images/Q.png',
      'question': 'What letter is this ?',
      'choices': ['O', 'Q', 'P', 'D'],
      'correctAnswer': 'Q',
    },
    {
      'image': 'assets/images/Berteriak.png',
      'question': 'What is he doing ?',
      'choices': ['Run', 'Shout', 'Sit', 'Go Out'],
      'correctAnswer': 'Shout',
    },
    {
      'image': 'assets/images/Sapu.png',
      'question': 'What is the name of the this tool  ?',
      'choices': ['Broom', 'Strainer', 'Spoon', 'Napkin'],
      'correctAnswer': 'Broom',
    },
    {
      'image': 'assets/images/Biola.png',
      'question': 'What is the name of musical instrument ?',
      'choices': ['Accordion', 'Angklung', 'Violin', 'Drum'],
      'correctAnswer': 'Violin',
    },
    {
      'image': 'assets/images/Pengeras Suara.png',
      'question': 'What is the name of home appliance ?',
      'choices': ['DVD\nPlayer', 'Speaker', 'Hair\nDryer', 'Door'],
      'correctAnswer': 'Speaker',
    },
    {
      'image': 'assets/images/Merah.png',
      'question': 'What color is this ?',
      'choices': ['Black', 'Yellow', 'Light Yellow', 'Red'],
      'correctAnswer': 'Red',
    },
    {
      'image': 'assets/images/Sepeda.png',
      'question': 'What vehicle is this ?',
      'choices': ['Bicycle', 'Skateboard', 'Tractor', 'Truck'],
      'correctAnswer': 'Bicycle',
    },
    {
      'image': 'assets/images/Kebun Binatang.png',
      'question': 'What place is this ?',
      'choices': ['Church', 'Zoo', 'Chinese Temple', 'Swimming\nPool'],
      'correctAnswer': 'Zoo',
    },
    {
      'image': 'assets/images/Kentang.png',
      'question': 'What vegetables is this ?',
      'choices': ['Cauliflower', 'Potato', 'Cabbage', 'Pumpkin'],
      'correctAnswer': 'Potato',
    },
    {
      'image': 'assets/images/Ruang Belajar.png',
      'question': 'What is the name of this room ?',
      'choices': [
        'Study\nRoom',
        'Laundry\nRoom',
        'Beauty\nRoom',
        'Family\nRoom'
      ],
      'correctAnswer': 'Study\nRoom',
    },
    {
      'image': 'assets/images/Dokter.png',
      'question': 'What profession is this ?',
      'choices': ['Doctor', 'Photographer', 'Teacher', 'Chef'],
      'correctAnswer': 'Doctor',
    },
    {
      'image': 'assets/images/Baju Hujan.png',
      'question': 'What clothes is this ?',
      'choices': ['Raincoat', 'Swimsuit', 'T-shirt', 'Underwear'],
      'correctAnswer': 'Raincoat',
    },
    {
      'image': 'assets/images/Voli.png',
      'question': 'What sport is this ?',
      'choices': ['Soccer', 'Skateboarding', 'Tennis', 'Volleyball'],
      'correctAnswer': 'Volleyball',
    },
    {
      'image': 'assets/images/Musim Gugur.png',
      'question': 'What season is this ?',
      'choices': ['Winter', 'Autumn', 'Rainy', 'Summer'],
      'correctAnswer': 'Autumn',
    },
    {
      'image': 'assets/images/Susu.png',
      'question': 'What drink is this ?',
      'choices': ['Milk', 'Chocolate\nMilk', 'Sweet\nTea', 'Yogurt'],
      'correctAnswer': 'Milk',
    },
    {
      'image': 'assets/images/Kentang Goreng.png',
      'question': 'What food is this ?',
      'choices': [
        'Fish\nSticks',
        'Cheese',
        'French\nFries',
        'Mashed\nPotatoes'
      ],
      'correctAnswer': 'French\nFries',
    },
    {
      'image': 'assets/images/Ibu.png',
      'question': 'Who is this ?',
      'choices': ['Mother', 'Wife', 'Older\nBrother', 'Older\nSister'],
      'correctAnswer': 'Mother',
    },
    {
      'image': 'assets/images/Main Teka Teki.png',
      'question': 'What hobby is this ?',
      'choices': [
        'Cycling',
        'Playing\nPuzzles',
        'Cooking\nwith\ntoys',
        'Reading\nbooks'
      ],
      'correctAnswer': 'Playing\nPuzzles',
    },
    {
      'image': 'assets/images/Kura - Kura.png',
      'question': 'What animal is this ?',
      'choices': ['Turtle', 'Spider', 'Rabbit', 'Monkey'],
      'correctAnswer': 'Turtle',
    },
    {
      'image': 'assets/images/Salak.png',
      'question': 'What fruit is this ?',
      'choices': ['Rambutan', 'Snake\nFruit', 'Watermelon', 'Strawberry'],
      'correctAnswer': 'Snake\nFruit',
    },
    {
      'image': 'assets/images/Persegi.png',
      'question': 'What shape is this ?',
      'choices': ['Kite', 'Circle', 'Oval', 'Square'],
      'correctAnswer': 'Square',
    },
    {
      'image': 'assets/images/100.png',
      'question': 'What number is this ?',
      'choices': ['Seventy', 'Eighty', 'Ninety', 'One\nHundred'],
      'correctAnswer': 'One\nHundred',
    },
    {
      'image': 'assets/images/Perut.png',
      'question': 'What is the name of body parts ?',
      'choices': ['Knees', 'Eyes', 'Mouth', 'Stomatch'],
      'correctAnswer': 'Stomatch',
    },
    {
      'image': 'assets/images/Gunting.png',
      'question': 'What is the name of school tools ?',
      'choices': ['Globe', 'Dictionary\nBook', 'Notebook', 'Scissors'],
      'correctAnswer': 'Scissors',
    },
    {
      'image': 'assets/images/Mandi.png',
      'question': 'What activity is this ?',
      'choices': ['Eat', 'Take\na Bath', 'Throw', 'Release'],
      'correctAnswer': 'Take\na Bath',
    },
    {
      'image': 'assets/images/Montir.png',
      'question': 'What profession is this ?',
      'choices': ['Mechanic', 'Sailor', 'Firefighter', 'Dancer'],
      'correctAnswer': 'Mechanic',
    },
    {
      'image': 'assets/images/Pelabuhan.png',
      'question': 'What place is this ?',
      'choices': ['Traditional\nMarket', 'Mountains', 'Port', 'Library'],
      'correctAnswer': 'Port',
    },
    {
      'image': 'assets/images/Punggung.png',
      'question': 'What is the name of body parts ?',
      'choices': ['Back', 'Hair', 'Hands', 'Ears'],
      'correctAnswer': 'Back',
    },
    {
      'image': 'assets/images/Semut.png',
      'question': 'What animal is this ?',
      'choices': ['Cow', 'Ant', 'Lion', 'Snake'],
      'correctAnswer': 'Ant',
    },
    {
      'image': 'assets/images/Kubis.png',
      'question': 'What vegetables is this ?',
      'choices': ['Cauliflower', 'Potato', 'Cabbage', 'Pumpkin'],
      'correctAnswer': 'Cabbage',
    },
    // Your list of questions
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
              fontFamily: 'Wigglye',
              color: Colors.black,
              fontSize: 25,
            ),
            contentTextStyle: const TextStyle(
              fontFamily: 'Wigglye',
              color: Colors.black,
              fontSize: 18,
            ),
            title: const Center(child: Text('Congrats!')),
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
                    fontFamily: 'Wigglye',
                    color: Colors.black,
                    fontSize: 18,
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
              fontFamily: 'Wigglye',
              color: Colors.white,
              fontSize: 25,
            ),
            contentTextStyle: const TextStyle(
              fontFamily: 'Wigglye',
              color: Colors.white,
              fontSize: 18,
            ),
            title: const Center(child: Text('Sorry!')),
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
                    fontFamily: 'Wigglye',
                    color: Colors.white,
                    fontSize: 18,
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
          String dialogContent;
          if (correctAnswers >= 0 && correctAnswers <= 9) {
            grade = 'E';
            dialogContent = 'Sorry!, You have to learn more';
          } else if (correctAnswers >= 10 && correctAnswers <= 14) {
            grade = 'D';
            dialogContent = 'Sorry!, You have to learn more';
          } else if (correctAnswers >= 15 && correctAnswers <= 20) {
            grade = 'C';
            dialogContent = 'Sorry!, You have to learn more';
          } else if (correctAnswers >= 21 && correctAnswers <= 25) {
            grade = 'B';
            dialogContent = 'Congrats!, Keep learning';
          } else {
            grade = 'A';
            dialogContent = 'Congrats!, Keep learning';
          }
          return AlertDialog(
            titleTextStyle: const TextStyle(
              fontFamily: 'Wigglye',
              color: Colors.white,
              fontSize: 25,
            ),
            contentTextStyle: const TextStyle(
              fontFamily: 'Wigglye',
              color: Colors.white,
              fontSize: 20,
            ),
            title: const Center(child: Text('Results!')),
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
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return AlertDialog(
                        titleTextStyle: const TextStyle(
                          fontFamily: 'Wigglye',
                          color: Colors.white,
                          fontSize: 25,
                        ),
                        contentTextStyle: const TextStyle(
                          fontFamily: 'Wigglye',
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        title: const Center(child: Text('Hello!')),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(dialogContent),
                          ],
                        ),
                        backgroundColor: const Color.fromARGB(255, 122, 95, 7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              saveTestResult();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Dashboard(),
                                ),
                              );
                            },
                            child: const Text(
                              'OK',
                              style: TextStyle(
                                fontFamily: 'Wigglye',
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text(
                  'Finish',
                  style: TextStyle(
                    fontFamily: 'Wigglye',
                    color: Colors.white,
                    fontSize: 20,
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
          .collection('PreTest Database')
          .get();

      Map<String, dynamic> userInfo = await getUserInfoFromSharedPreferences();
      int userNumber = userInfo['userNumber'];

      await firestore
          .collection('Englifun')
          .doc('Englifun Database')
          .collection('PreTest Database')
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
    if (correctAnswers >= 0 && correctAnswers <= 9) {
      return 'E';
    } else if (correctAnswers >= 10 && correctAnswers <= 14) {
      return 'D';
    } else if (correctAnswers >= 15 && correctAnswers <= 20) {
      return 'C';
    } else if (correctAnswers >= 21 && correctAnswers <= 25) {
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
                      'Test',
                      style: TextStyle(
                        color: Color(0xFF02343F),
                        fontFamily: 'Dinofont',
                        fontSize: 30,
                      ),
                    ),
                    Image.asset(question['image']),
                    const SizedBox(),
                    Text(
                      question['question'],
                      style: const TextStyle(
                        fontFamily: 'Dinofont',
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(),
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      childAspectRatio: 3.0,
                      children: List.generate(
                        question['choices'].length,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 4,
                            vertical: 3,
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
                                color: Color(0xFFF0EDCC),
                                fontSize: 15,
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
