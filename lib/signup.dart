// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:englifun/login.dart';
import 'package:englifun/pretest.dart';
import 'package:englifun/registration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _errorMessage;
  String? _selectedGender;
  bool isNameValid = true;
  bool isEmailValid = true;
  bool _passwordVisible = false;

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool validateName(String name) {
    final RegExp nameRegExp = RegExp(r'^[a-zA-Z ]+$');
    return nameRegExp.hasMatch(name);
  }

  bool validateEmail(String email) {
    final RegExp emailRegExp = RegExp(r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$');
    return emailRegExp.hasMatch(email);
  }

  Future<void> saveDataToFirestore() async {
    final String name = _nameController.text.trim();
    final String password = _passwordController.text.trim(); // tambahkan ini
    int age = int.tryParse(_ageController.text) ?? 0;
    String gender = _selectedGender ?? "";
    String email = _emailController.text.trim();

    if (name.isEmpty ||
        age <= 0 ||
        gender.isEmpty ||
        email.isEmpty ||
        password.isEmpty) {
      showInvalidDataDialog();
      return;
    }

    if (!isNameValid) {
      showInvalidNameDialog();
      return;
    }

    Future<void> saveUserInfoLocally(
        String name, int userNumber, String email) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('userName', name);
      prefs.setString('email', email);
      prefs.setInt('userNumber', userNumber);
    }

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        final CollectionReference userCollection = FirebaseFirestore.instance
            .collection('Englifun')
            .doc('Englifun Database')
            .collection('User Database');
        QuerySnapshot userCountSnapshot = await userCollection.get();
        int userNumber = userCountSnapshot.size + 0; // Increment user number

        await userCollection.doc('user_$userNumber').set({
          'name': name,
          'age': age,
          'gender': gender,
          'email': email,
          'password': password,
          'userNumber': userNumber,
          // Add other user details here as needed
        });

        await saveUserInfoLocally(name, userNumber, email);

        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => AlertDialog(
            title: const Text(
              'Yeayy ...',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Kartooni',
              ),
            ),
            content: const Text(
              'Are you ready to take the test?',
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
                  saveSignUpStatus();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PreTest(),
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
            ],
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        if (kDebugMode) {
          print('The password provided is too weak.');
        }
      } else if (e.code == 'email-already-in-use') {
        showEmailAlreadyInUseDialog();
      }
      // Handle other FirebaseAuthException codes as needed
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(
            'Failed to Save Data',
            style: TextStyle(
              fontFamily: 'Kartooni',
              color: Colors.white,
            ),
          ),
          content: const Text(
            'An error occurred while saving the data. Please try again.',
            style: TextStyle(
              fontFamily: 'Kartooni',
              color: Colors.white,
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
                  fontFamily: 'Kartooni',
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  void showInvalidDataDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Invalid Data',
          style: TextStyle(
            fontFamily: 'Kartooni',
            color: Colors.white,
          ),
        ),
        content: const Text(
          'Please ensure all fields are filled in correctly',
          style: TextStyle(
            fontFamily: 'Kartooni',
            color: Colors.white,
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
                fontFamily: 'Kartooni',
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showInvalidNameDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Wrong Name',
          style: TextStyle(
            fontFamily: 'Kartooni',
            color: Colors.white,
          ),
        ),
        content: const Text(
          'Please enter your name correctly.',
          style: TextStyle(
            fontFamily: 'Kartooni',
            color: Colors.white,
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
                fontFamily: 'Kartooni',
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showEmailAlreadyInUseDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Email Already Used',
          style: TextStyle(
            fontFamily: 'Kartooni',
            color: Colors.white,
          ),
        ),
        content: const Text(
          'The email you entered is already registered. Please use another email.',
          style: TextStyle(
            fontFamily: 'Kartooni',
            color: Colors.white,
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

  void saveSignUpStatus() async {
    // Implement your SignUp status saving logic here
    if (kDebugMode) {
      print('Save SignUp status');
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Aksi ini dijalankan ketika tombol "Back" ditekan
        // Navigasi kembali ke halaman registrasi
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Registration(),
          ),
        );
        // Jangan izinkan navigasi default kembali
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
                                orientation == Orientation.portrait ? 100 : 100,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: Column(
                              children: [
                                const Align(
                                  alignment: Alignment.topCenter,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 0),
                                    child: Text(
                                      'Sign Up',
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontFamily: 'Therestone',
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                const Text(
                                  'Create Your Account',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Dinofont',
                                    fontSize: 15,
                                  ),
                                ),
                                TextFormField(
                                  controller: _nameController,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Dinofont',
                                  ),
                                  decoration: InputDecoration(
                                    hintText: "What's your name ?",
                                    hintStyle: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Dinofont',
                                      fontSize: 21,
                                    ),
                                    errorText:
                                        isNameValid ? null : 'Invalid Name',
                                  ),
                                  textAlign: TextAlign.left,
                                  onChanged: (value) {
                                    setState(() {
                                      isNameValid = validateName(value);
                                    });
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please fill in';
                                    }
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  controller: _ageController,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Dinofont',
                                  ),
                                  decoration: const InputDecoration(
                                    hintText: 'How old are you?',
                                    hintStyle: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Dinofont',
                                      fontSize: 21,
                                    ),
                                  ),
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.left,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please fill in';
                                    }
                                    return null;
                                  },
                                ),
                                DropdownButtonFormField<String>(
                                  dropdownColor:
                                      const Color.fromARGB(255, 8, 160, 99),
                                  decoration: const InputDecoration(
                                    hintText: 'What is your gender?',
                                    hintStyle: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Dinofont',
                                      fontSize: 21,
                                    ),
                                  ),
                                  value: _selectedGender,
                                  items: const [
                                    DropdownMenuItem(
                                      value: 'Male',
                                      child: Text(
                                        'Male',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Dinofont',
                                          fontSize: 21,
                                        ),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: 'Female',
                                      child: Text(
                                        'Female',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Dinofont',
                                          fontSize: 21,
                                        ),
                                      ),
                                    ),
                                  ],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Dinofont',
                                    fontSize: 21,
                                  ),
                                  onChanged: (String? value) {
                                    setState(() {
                                      _selectedGender = value;
                                    });
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please fill in';
                                    }
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  controller: _emailController,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Dinofont',
                                    fontSize: 21,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: 'Enter your email address',
                                    hintStyle: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Dinofont',
                                      fontSize: 21,
                                    ),
                                    errorText:
                                        isEmailValid ? null : 'Invalid Email',
                                  ),
                                  textAlign: TextAlign.left,
                                  onChanged: (value) {
                                    setState(() {
                                      isEmailValid = validateEmail(value);
                                    });
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please fill in';
                                    }
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  controller: _passwordController,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Dinofont',
                                    fontSize: 21,
                                  ),
                                  decoration: InputDecoration(
                                    hintText:
                                        'Create your password (Minimum 6 words)',
                                    hintStyle: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Dinofont',
                                      fontSize: 20,
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _passwordVisible = !_passwordVisible;
                                        });
                                      },
                                      icon: Icon(_passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                    ),
                                  ),
                                  textAlign: TextAlign.left,
                                  obscureText: !_passwordVisible,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please fill in';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 16),
                                if (_errorMessage != null)
                                  Text(
                                    _errorMessage!,
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                ElevatedButton(
                                  onPressed: () {
                                    if (isNameValid &&
                                        isEmailValid &&
                                        _emailController.text.isNotEmpty &&
                                        _passwordController.text.isNotEmpty) {
                                      // Perform user registration and data save to Firestore
                                      saveDataToFirestore();
                                    } else {
                                      if (!isNameValid) {
                                        showInvalidNameDialog();
                                      } else if (!isEmailValid) {
                                        showEmailAlreadyInUseDialog();
                                      } else {
                                        showInvalidDataDialog();
                                      }
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor:
                                        const Color.fromARGB(255, 8, 160, 99),
                                    minimumSize: const Size.fromHeight(20.0),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                  ),
                                  child: const Text(
                                    'SIGN UP',
                                    style: TextStyle(
                                      fontFamily: 'BlobbyChug-Bold',
                                      fontStyle: FontStyle.italic,
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Already have an account?',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Dinofont',
                                        fontSize: 21,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => const Login(),
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        ' Login',
                                        style: TextStyle(
                                          color: Colors.yellow,
                                          fontFamily: 'BlobbyChug-Bold',
                                          fontSize: 21,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
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
