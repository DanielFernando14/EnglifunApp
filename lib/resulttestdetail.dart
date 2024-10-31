// ignore_for_file: avoid_unnecessary_containers
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResultTestDetail extends StatefulWidget {
  final String quizName;
  const ResultTestDetail({super.key, required this.quizName});

  @override
  State<ResultTestDetail> createState() => _ResultTestDetailState();
}

class _ResultTestDetailState extends State<ResultTestDetail> {
  late CollectionReference _collection;
  final CollectionReference usersCollection = FirebaseFirestore.instance
      .collection('Englifun')
      .doc('Englifun Database')
      .collection('User Database');
  String grade = '';
  int correctAnswer = 0;
  int wrongAnswer = 0;

  String name = '';
  String userNumber = '';
  int age = 0;
  String gender = '';
  String email = '';
  String password = '';

  @override
  void initState() {
    super.initState();
    _collection = FirebaseFirestore.instance
        .collection('Englifun')
        .doc('Englifun Database')
        .collection(widget.quizName);

    fetchUserData();
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

  Future<void> fetchUserData() async {
    try {
      Map<String, dynamic> userInfo = await getUserInfoFromSharedPreferences();
      String mail = userInfo['email'];
      QuerySnapshot userSnapshot =
          await usersCollection.where('email', isEqualTo: mail).get();

      if (userSnapshot.docs.isNotEmpty) {
        DocumentSnapshot firstDocument = userSnapshot.docs[0];

        setState(() {
          name = firstDocument.get('name') ?? '';
          age = firstDocument.get('age') ?? 0;
          gender = firstDocument.get('gender') ?? '';
          email = firstDocument.get('email') ?? '';
          password = firstDocument.get('password') ?? '';
          userNumber = "user_${firstDocument.get('userNumber') ?? ''}";
        });

        fetchData(userNumber); // Gunakan variabel yang sudah didefinisikan

        // Log fetched user data
      } else {
        // Data tidak ditemukan
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching user data: $e');
      }
      // Tangani kesalahan secara tepat
    }
  }

  Future<void> fetchData(String userNumber) async {
    try {
      final preTestSnapshot = await _collection.doc(userNumber).get();
      if (preTestSnapshot.exists) {
        setState(() {
          grade = preTestSnapshot.get('Grade') as String;
          correctAnswer = preTestSnapshot.get('Correct Answer') as int;
          wrongAnswer = preTestSnapshot.get('Wrong Answer') as int;
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching pretest data: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: const Color(0xFFD7C49E),
          child: Stack(
            children: [
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
                        Builder(
                          builder: (BuildContext context) {
                            return Text(
                              widget.quizName.replaceAll("Database", ""),
                              style: const TextStyle(
                                color: Color(0xFF343148),
                                fontSize: 32,
                                fontFamily: 'Dinofont',
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 125,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: PageView(
                    scrollDirection: Axis.vertical,
                    children: [
                      grade.isNotEmpty
                          ? Container(
                              // Display quiz results if grade is not empty
                              child: Column(
                                children: [
                                  Container(
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: const Text(
                                            'Grade',
                                            style: TextStyle(
                                              fontFamily: 'Dinofont',
                                              fontSize: 24,
                                              color: Color(0xFF343148),
                                            ),
                                          ),
                                          subtitle: Text(
                                            grade,
                                            style: const TextStyle(
                                              fontFamily: 'Dinofont',
                                              fontSize: 24,
                                              color: Color.fromARGB(
                                                  255, 166, 9, 111),
                                            ),
                                          ),
                                        ),
                                        ListTile(
                                          title: const Text(
                                            'Correct Answer',
                                            style: TextStyle(
                                              fontFamily: 'Dinofont',
                                              fontSize: 24,
                                              color: Color(0xFF343148),
                                            ),
                                          ),
                                          subtitle: Text(
                                            correctAnswer.toString(),
                                            style: const TextStyle(
                                              fontFamily: 'Dinofont',
                                              fontSize: 24,
                                              color: Color.fromARGB(
                                                  255, 166, 9, 111),
                                            ),
                                          ),
                                        ),
                                        ListTile(
                                          title: const Text(
                                            'Wrong Answer',
                                            style: TextStyle(
                                              fontFamily: 'Dinofont',
                                              fontSize: 24,
                                              color: Color(0xFF343148),
                                            ),
                                          ),
                                          subtitle: Text(
                                            wrongAnswer.toString(),
                                            style: const TextStyle(
                                              fontFamily: 'Dinofont',
                                              fontSize: 24,
                                              color: Color.fromARGB(
                                                  255, 166, 9, 111),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : const Center(
                              // Display "No result" if grade is empty
                              child: Text(
                                'No result',
                                style: TextStyle(
                                  fontFamily: 'Dinofont',
                                  fontSize: 24,
                                  color: Color(0xFF343148),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
