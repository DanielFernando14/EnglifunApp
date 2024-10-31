import 'package:englifun/resulttestdetail.dart';
import 'package:flutter/material.dart';

class ResultTest extends StatefulWidget {
  const ResultTest({super.key});

  @override
  State<ResultTest> createState() => _ResultTestState();
}

class _ResultTestState extends State<ResultTest> {
  List<String> quizzes = [
    'PreTest Database',
    'Alphabet Quiz 1 Database',
    'Alphabet Quiz 2 Database',
    'Activity Quiz 1 Database',
    'Activity Quiz 2 Database',
    'Kitchen Set Quiz 1 Database',
    'Kitchen Set Quiz 2 Database',
    'Musical Instrument Quiz 1 Database',
    'Musical Instrument Quiz 2 Database',
    'Home Appliance Quiz 1 Database',
    'Home Appliance Quiz 2 Database',
    'School Tools Quiz 1 Database',
    'School Tools Quiz 2 Database',
    'Body Parts Quiz 1 Database',
    'Body Parts Quiz 2 Database',
    'Number Quiz 1 Database',
    'Number Quiz 2 Database',
    'Shape Quiz 1 Database',
    'Shape Quiz 2 Database',
    'Fruit Quiz 1 Database',
    'Fruit Quiz 2 Database',
    'Animal Quiz 1 Database',
    'Animal Quiz 2 Database',
    'Hobby Quiz 1 Database',
    'Hobby Quiz 2 Database',
    'Family Quiz 1 Database',
    'Family Quiz 2 Database',
    'Food Quiz 1 Database',
    'Food Quiz 2 Database',
    'Drink Quiz 1 Database',
    'Drink Quiz 2 Database',
    'Season Quiz 1 Database',
    'Season Quiz 2 Database',
    'Sport Quiz 1 Database',
    'Sport Quiz 2 Database',
    'Clothes Quiz 1 Database',
    'Clothes Quiz 2 Database',
    'Profession Quiz 1 Database',
    'Profession Quiz 2 Database',
    'Room at Home Quiz 1 Database',
    'Room at Home Quiz 2 Database',
    'Vegetables Quiz 1 Database',
    'Vegetables Quiz 2 Database',
    'Place Quiz 1 Database',
    'Place Quiz 2 Database',
    'Vehicle Quiz 1 Database',
    'Vehicle Quiz 2 Database',
    'Color Quiz 1 Database',
    'Color Quiz 2 Database'
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFD7C49E),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.all(8.0), // Adjust the margin as needed
            child: Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(208, 216, 175, 7),
              ),
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
        title: Text(
          'Result Test',
          style: TextStyle(
            color: Color(0xFF343148),
            fontSize: 32,
            fontFamily: 'Dinofont',
          ),
        ),
      ),
      body: Container(
        color: const Color(0xFFD7C49E),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: quizzes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color(0xFFD7C49E),
                        backgroundColor: const Color(0xFF343148),
                        minimumSize: const Size.fromHeight(20.0),
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ResultTestDetail(quizName: quizzes[index])),
                        );
                      },
                      child: Text(
                        quizzes[index].replaceAll(" Database", ""),
                        style: TextStyle(
                          fontFamily: 'Kartooni',
                          fontSize: 20,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
