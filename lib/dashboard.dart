// ignore_for_file: deprecated_member_use

import 'package:englifun/belajar.dart';
import 'package:englifun/letsgo.dart';
import 'package:englifun/profile.dart';
import 'package:englifun/quiz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  Future<bool> _onWillPop(BuildContext context) async {
    return (await showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => AlertDialog(
            title: const Center(
                child: Text(
              'Where Do You Want?',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Kartooni',
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            )),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LetsGo()),
                    );
                  },
                  child: const Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Kartooni',
                      color: Colors.white,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                    // Exit the application
                    SystemNavigator.pop();
                  },
                  child: const Text(
                    'Exit',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Kartooni',
                      color: Colors.white,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text(
                    'Stay Here',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Kartooni',
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            backgroundColor: const Color.fromARGB(
                255, 9, 100, 96), // Set the background color of the AlertDialog
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(
                      'assets/images/Background Dashboard.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.2),
                    BlendMode.darken,
                  ),
                ),
              ),
            ),
            IndexedStack(
              index: 0,
              children: [
                const DashboardContent(),
                Belajar(),
                Quiz(),
                const Profile(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 155),
            child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Welcome \n',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'BlobbyChug-Bold',
                    ),
                  ),
                  TextSpan(
                    text: 'to Englifun',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'BlobbyChug-Bold',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 0),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Belajar()),
            );
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 150, right: 40, left: 40),
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
                    'assets/images/Gambar Belajar.png',
                    width: 75,
                    height: 75,
                  ),
                  const SizedBox(width: 20),
                  const Expanded(
                    child: Text(
                      'Study',
                      style: TextStyle(
                        fontSize: 23,
                        color: Colors.white,
                        fontFamily: 'Bubblegum',
                      ),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
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
        const SizedBox(height: 0),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Quiz()),
            );
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
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
                    'assets/images/Gambar Quiz.png',
                    width: 75,
                    height: 75,
                  ),
                  const SizedBox(width: 20),
                  const Expanded(
                    child: Text(
                      'Quiz',
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        fontFamily: 'Bubblegum',
                      ),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
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
        const SizedBox(height: 0),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Profile()),
            );
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
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
                    'assets/images/Gambar Profile.png',
                    width: 75,
                    height: 75,
                  ),
                  const SizedBox(width: 20),
                  const Expanded(
                    child: Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        fontFamily: 'Bubblegum',
                      ),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
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
    );
  }
}
