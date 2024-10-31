import 'package:englifun/letsgo.dart';
import 'package:englifun/login.dart';
import 'package:englifun/signup.dart';
import 'package:flutter/material.dart';

class Registration extends StatelessWidget {
  const Registration({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final constraints = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      // ignore: deprecated_member_use
      body: WillPopScope(
        onWillPop: () async {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LetsGo(),
            ),
          );
          return false;
        },
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Background Lets Go.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  top: orientation == Orientation.portrait
                      ? constraints.height * 0.20
                      : constraints.width * 0.10,
                ),
                child: const Text(
                  'Welcome to',
                  style: TextStyle(
                    fontFamily: 'BlobbyChug-Bold',
                    fontSize: 25,
                    color: Color.fromARGB(255, 12, 139, 135),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  top: orientation == Orientation.portrait
                      ? constraints.height * 0.23
                      : constraints.width * 0.13,
                ),
                child: Image.asset(
                  'assets/images/Englifun Logo.png',
                  height: orientation == Orientation.portrait
                      ? constraints.height * 0.2
                      : constraints.width * 0.12,
                  width: orientation == Orientation.portrait
                      ? constraints.width * 0.55
                      : constraints.width * 0.35,
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUp(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color.fromARGB(255, 8, 160, 99),
                      textStyle: const TextStyle(
                        fontFamily: 'BlobbyChug-Bold',
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                      minimumSize: const Size.fromHeight(30.0),
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                    ),
                    child: const Text("Come on, Register"),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color.fromARGB(255, 8, 160, 99),
                      textStyle: const TextStyle(
                        fontFamily: 'BlobbyChug-Bold',
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ),
                      minimumSize: const Size.fromHeight(30.0),
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                    ),
                    child: const Text("I already have an account"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
