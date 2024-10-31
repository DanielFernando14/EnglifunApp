// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:englifun/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LupaPassword extends StatefulWidget {
  const LupaPassword({super.key});

  @override
  State<LupaPassword> createState() => _LupaPasswordState();
}

class _LupaPasswordState extends State<LupaPassword> {
  final TextEditingController _passwordController = TextEditingController();
  bool _showPassword = false;

  void showInvalidInputDialog() {
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
          'Please enter your new password',
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
  }

  Future<void> updatePassword() async {
    String password = _passwordController.text;

    try {
      // Update password in Cloud Firestore
      CollectionReference users = FirebaseFirestore.instance
          .collection('Englifun')
          .doc('Englifun Database')
          .collection('User Database');

      await users.doc().update({
        'password': password,
      });

      // Update password in Firebase Authentication
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.updatePassword(password);
      }

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Login(),
        ),
      );
    } catch (error) {
      if (kDebugMode) {
        print('Error updating password: $error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Login(),
          ),
        );
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
                        Colors.black.withOpacity(0.15),
                        BlendMode.darken,
                      ),
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
                                'FORGOT PASSWORD',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontFamily: 'Therestone',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            'Enter your new password',
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
                              controller: _passwordController,
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Dinofont',
                                fontSize: 21,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Enter your new password',
                                hintStyle: const TextStyle(
                                  color: Colors.white70,
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
                        ],
                      ),
                      Positioned(
                        bottom: 30,
                        left: 30,
                        right: 30,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_passwordController.text.isEmpty) {
                              showInvalidInputDialog();
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text(
                                    'Confirmation',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Kartooni',
                                    ),
                                  ),
                                  content: const Text(
                                    'Do you want to create a new password?',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Kartooni',
                                    ),
                                  ),
                                  backgroundColor:
                                      const Color.fromARGB(255, 8, 160, 99),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        updatePassword();
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => const Login(),
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        'Yes',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Kartooni',
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        'No',
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
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor:
                                const Color.fromARGB(255, 8, 160, 99),
                            minimumSize: const Size.fromHeight(20.0),
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                          ),
                          child: const Text(
                            'FINISHED',
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
                                builder: (context) => const Login(),
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
