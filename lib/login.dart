// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:englifun/dashboard.dart';
import 'package:englifun/lupapassword.dart';
import 'package:englifun/registration.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _showPassword = false;
  final CollectionReference _userCollection = FirebaseFirestore.instance
      .collection('Englifun')
      .doc('Englifun Database')
      .collection('User Database');

  void showEmptyFieldDialog(String field) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Fail',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Kartooni',
          ),
        ),
        content: Text(
          "$field can't be empty!",
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Kartooni',
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 8, 160, 99),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'OK',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Kartooni',
              ),
            ),
          ),
        ],
      ),
    );
  }

  void navigateToLupaPassword() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LupaPassword()));
  }

  Future<void> login() async {
    final String name = _nameController.text.trim();
    final String password = _passwordController.text.trim();

    // Validate if input fields are empty
    if (name.isEmpty && password.isEmpty) {
      showEmptyFieldDialog('Name and password');
      return;
    } else if (name.isEmpty) {
      showEmptyFieldDialog('Name');
      return;
    } else if (password.isEmpty) {
      showEmptyFieldDialog('Password');
      return;
    }

    // Check if user with the given name and password exists in the database
    QuerySnapshot userQuery =
        await _userCollection.where('name', isEqualTo: name).get();

    if (userQuery.docs.isNotEmpty) {
      // User with the given name exists
      // Check if the password matches
      QuerySnapshot passwordQuery = await _userCollection
          .where('name', isEqualTo: name)
          .where('password', isEqualTo: password)
          .get();

      if (passwordQuery.docs.isNotEmpty) {
        // User successfully logged in
        // Access user number from Firestore
        int userNumber = userQuery.docs.first['userNumber'];
        String email = userQuery.docs.first['email'];
        if (kDebugMode) {
          print('Login successful for user $userNumber: $name');
        }

        await saveUserInfoLocally(name, userNumber, email);

        // Navigate to Dashboard
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Dashboard(),
          ),
        );

        return;
      } else {
        // Invalid password
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text(
              'Fail',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Kartooni',
              ),
            ),
            content: const Text(
              'Your name or password is wrong!',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Kartooni',
              ),
            ),
            backgroundColor: const Color.fromARGB(255, 8, 160, 99),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'OK',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Kartooni',
                  ),
                ),
              ),
            ],
          ),
        );
        return;
      }
    } else {
      // Invalid name
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(
            'Fail',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Kartooni',
            ),
          ),
          content: const Text(
            'Your name or password is wrong!',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Kartooni',
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 8, 160, 99),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'OK',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Kartooni',
                ),
              ),
            ),
          ],
        ),
      );
      return;
    }
  }

  Future<void> saveUserInfoLocally(
      String name, int userNumber, String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userName', name);
    prefs.setString('email', email);
    prefs.setInt('userNumber', userNumber);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // This action is triggered when the "Back" button is pressed
        // Navigate back to the registration page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Registration(),
          ),
        );
        // Do not allow default back navigation
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return OrientationBuilder(
              builder: (BuildContext context, Orientation orientation) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage(
                          'assets/images/Background SignUp.jpg'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.15), BlendMode.darken),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height:
                                orientation == Orientation.portrait ? 250 : 100,
                          ),
                          const Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: EdgeInsets.only(top: 0),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Therestone',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            'Enter your name and password',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Dinofont',
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          SizedBox(
                            width: 342,
                            height: 42,
                            child: TextFormField(
                              controller: _nameController,
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Dinofont',
                                fontSize: 21,
                              ),
                              decoration: const InputDecoration(
                                hintText: 'Enter your name',
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Dinofont',
                                  fontSize: 21,
                                ),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          SizedBox(
                            width: 342,
                            height: 42,
                            child: TextFormField(
                              controller: _passwordController,
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Dinofont',
                                fontSize: 21,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Enter your password',
                                hintStyle: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Dinofont',
                                  fontSize: 21,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _showPassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _showPassword = !_showPassword;
                                    });
                                  },
                                ),
                              ),
                              textAlign: TextAlign.left,
                              obscureText: !_showPassword,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 342,
                                height: 42,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Text "Lupa Password"
                                    TextButton(
                                      onPressed: navigateToLupaPassword,
                                      child: const Text(
                                        'Forgot password',
                                        style: TextStyle(
                                          color: Colors.yellow,
                                          fontFamily: 'BlobbyChug-Bold',
                                          fontSize: 21,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Positioned(
                        bottom: 30,
                        left: 30,
                        right: 30,
                        child: ElevatedButton(
                          onPressed: login,
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor:
                                const Color.fromARGB(255, 8, 160, 99),
                            minimumSize: const Size.fromHeight(20.0),
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                          ),
                          child: const Text(
                            'LOGIN',
                            style: TextStyle(
                              fontFamily: 'BlobbyChug-Bold',
                              fontStyle: FontStyle.italic,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 50,
                        left: 20,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Registration(),
                              ),
                            );
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
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
