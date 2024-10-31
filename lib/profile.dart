import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:englifun/letsgo.dart';
import 'package:englifun/registration.dart';
import 'package:englifun/resulttest.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User? currentUser;
  final CollectionReference usersCollection = FirebaseFirestore.instance
      .collection('Englifun')
      .doc('Englifun Database')
      .collection('User Database');
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String name = '';
  int age = 0;
  String gender = '';
  String email = '';
  String password = '';
  bool _showPassword = true;
  bool isEditing = false;
  String? _selectedGender;

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    currentUser = FirebaseAuth.instance.currentUser;

    Map<String, dynamic> userInfo = await getUserInfoFromSharedPreferences();
    String mail = userInfo['email'];
    await fetchUserData(mail);
  }

  Future<void> fetchUserData(String mail) async {
    try {
      QuerySnapshot userSnapshot =
          await usersCollection.where('email', isEqualTo: mail).get();

      // Check if any documents were found
      if (userSnapshot.docs.isNotEmpty) {
        // Assuming you only want to fetch data from the first document found
        DocumentSnapshot firstDocument = userSnapshot.docs[0];

        setState(() {
          name = firstDocument.get('name');
          age = firstDocument.get('age');
          gender = firstDocument.get('gender');
          email = firstDocument.get('email');
          password = firstDocument.get('password');
          _selectedGender = gender;
        });
      } else {}
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching user data: $e');
      }
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

  void _toggleEditing() {
    setState(() {
      isEditing = !isEditing;
    });
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text(
          'Confirmation Edit Account',
          style: TextStyle(
            color: Color(0xFFD7C49E),
            fontFamily: 'Kartooni',
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Do you want to confirm the account edit?',
              style: TextStyle(
                color: Color(0xFFD7C49E),
                fontFamily: 'Kartooni',
              ),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    if (age <= 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Please enter a valid age.',
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.red,
                        ),
                      );
                    } else {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LetsGo()),
                      );
                      _toggleEditing();
                      try {
                        QuerySnapshot userCountSnapshot =
                            await usersCollection.get();
                        Map<String, dynamic> userInfo =
                            await getUserInfoFromSharedPreferences();
                        int userNumber = userInfo['userNumber'];
                        await usersCollection.doc('user_$userNumber').update({
                          'name': name,
                          'age': age,
                          'gender': gender,
                          'email': email,
                          'password': password,
                          'userNumber': userNumber,
                          // Add other properties as needed
                        });

                        if (kDebugMode) {
                          print('User data successfully updated in Firestore');
                        }
                      } catch (e) {
                        if (kDebugMode) {
                          print('Error updating user data in Firestore: $e');
                        }
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF343148),
                  ),
                  child: const Text(
                    'Yes',
                    style: TextStyle(
                      color: Color(0xFFD7C49E),
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
                      color: Color(0xFFD7C49E),
                      fontFamily: 'Kartooni',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: const Color(0xFF343148),
      ),
    );
  }

  void _showChangeAccountConfirmationDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text(
          'Change Account',
          style: TextStyle(
            color: Color(0xFFD7C49E),
            fontFamily: 'Kartooni',
          ),
        ),
        content: const Text(
          'Do you want to change account',
          style: TextStyle(
            color: Color(0xFFD7C49E),
            fontFamily: 'Kartooni',
          ),
        ),
        backgroundColor: const Color(0xFF343148),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Registration(),
                ),
              );
            },
            child: const Text(
              'Yes',
              style: TextStyle(
                color: Color(0xFFD7C49E),
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
                color: Color(0xFFD7C49E),
                fontFamily: 'Kartooni',
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showViewResultTestDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text(
          'View Result Test',
          style: TextStyle(
            color: Color(0xFFD7C49E),
            fontFamily: 'Kartooni',
          ),
        ),
        content: const Text(
          'Are you sure you want to view the result of the test?',
          style: TextStyle(
            color: Color(0xFFD7C49E),
            fontFamily: 'Kartooni',
          ),
        ),
        backgroundColor: const Color(0xFF343148),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ResultTest(),
                ),
              );
            },
            child: const Text(
              'Yes',
              style: TextStyle(
                color: Color(0xFFD7C49E),
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
                color: Color(0xFFD7C49E),
                fontFamily: 'Kartooni',
              ),
            ),
          ),
        ],
      ),
    );
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
              const Positioned(
                top: 50,
                left: 0,
                right: 0,
                child: Center(
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text(
                          'Profile',
                          style: TextStyle(
                            color: Color(0xFF343148),
                            fontSize: 32,
                            fontFamily: 'Dinofont',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 100,
                left: 20,
                right: 20,
                child: Column(
                  children: [
                    ListTile(
                      title: const Text(
                        'Name',
                        style: TextStyle(
                          fontFamily: 'Dinofont',
                          fontSize: 20,
                          color: Color(0xFF343148),
                        ),
                      ),
                      subtitle: isEditing
                          ? TextFormField(
                              initialValue: name,
                              onChanged: (value) {
                                setState(() {
                                  name = value;
                                });
                              },
                              style: const TextStyle(
                                fontFamily: 'Dinofont',
                                fontSize: 15,
                                color: Color(0xFF343148),
                              ),
                            )
                          : Text(
                              name,
                              style: const TextStyle(
                                fontFamily: 'Dinofont',
                                fontSize: 15,
                                color: Color(0xFF343148),
                              ),
                            ),
                    ),
                    const SizedBox(height: 15),
                    ListTile(
                      title: const Text(
                        'Age',
                        style: TextStyle(
                          fontFamily: 'Dinofont',
                          fontSize: 20,
                          color: Color(0xFF343148),
                        ),
                      ),
                      subtitle: isEditing
                          ? TextFormField(
                              initialValue: age.toString(),
                              onChanged: (value) {
                                setState(() {
                                  if (int.tryParse(value) != null) {
                                    age = int.parse(value);
                                  }
                                });
                              },
                              style: const TextStyle(
                                fontFamily: 'Dinofont',
                                fontSize: 15,
                                color: Color(0xFF343148),
                              ),
                              decoration: const InputDecoration(
                                hintText: 'Enter your age',
                                hintStyle: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            )
                          : Text(
                              age.toString(),
                              style: const TextStyle(
                                fontFamily: 'Dinofont',
                                fontSize: 15,
                                color: Color(0xFF343148),
                              ),
                            ),
                    ),
                    const SizedBox(height: 15),
                    ListTile(
                      title: const Text(
                        'Gender',
                        style: TextStyle(
                          fontFamily: 'Dinofont',
                          fontSize: 20,
                          color: Color(0xFF343148),
                        ),
                      ),
                      subtitle: isEditing
                          ? DropdownButtonFormField<String>(
                              value: _selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  _selectedGender = value;
                                  gender = value!;
                                });
                              },
                              items: const [
                                DropdownMenuItem(
                                  value: 'Male',
                                  child: Text('Male'),
                                ),
                                DropdownMenuItem(
                                  value: 'Female',
                                  child: Text('Female'),
                                ),
                              ],
                              dropdownColor: const Color(0xFFD7C49E),
                              style: const TextStyle(
                                color: Color(0xFF343148),
                                fontFamily: 'Dinofont',
                                fontSize: 20,
                              ),
                              decoration: const InputDecoration(
                                hintText: 'Select your gender',
                                hintStyle: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            )
                          : Text(
                              gender,
                              style: const TextStyle(
                                fontFamily: 'Dinofont',
                                fontSize: 20,
                                color: Color(0xFF343148),
                              ),
                            ),
                    ),
                    const SizedBox(height: 15),
                    ListTile(
                      title: const Text(
                        'Email',
                        style: TextStyle(
                          fontFamily: 'Dinofont',
                          fontSize: 20,
                          color: Color(0xFF343148),
                        ),
                      ),
                      subtitle: Text(
                        email,
                        style: const TextStyle(
                          fontFamily: 'Dinofont',
                          fontSize: 15,
                          color: Color(0xFF343148),
                        ),
                      ),
                    ),
                    ListTile(
                      title: const Text(
                        'Password',
                        style: TextStyle(
                          fontFamily: 'Dinofont',
                          fontSize: 20,
                          color: Color(0xFF343148),
                        ),
                      ),
                      subtitle: isEditing
                          ? TextFormField(
                              initialValue: password,
                              onChanged: (value) {
                                setState(() {
                                  password = value;
                                });
                              },
                              style: const TextStyle(
                                fontFamily: 'Dinofont',
                                fontSize: 15,
                                color: Color(0xFF343148),
                              ),
                            )
                          : !_showPassword
                              ? Text(
                                  password,
                                  style: const TextStyle(
                                    fontFamily: 'Dinofont',
                                    fontSize: 15,
                                    color: Color(0xFF343148),
                                  ),
                                )
                              : const Text(
                                  '******', // Show masked password
                                  style: TextStyle(
                                    fontFamily: 'Dinofont',
                                    fontSize: 15,
                                    color: Color(0xFF343148),
                                  ),
                                ),
                      trailing: IconButton(
                        icon: Icon(
                          _showPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: const Color(0xFF343148),
                        ),
                        onPressed: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Column(
                  children: [
                    if (isEditing)
                      ElevatedButton(
                        onPressed: () {
                          _showConfirmationDialog();
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: const Color(0xFFD7C49E),
                          backgroundColor: const Color(0xFF343148),
                          minimumSize: const Size.fromHeight(20.0),
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: const Text(
                          'Confirmation Edit Account',
                          style: TextStyle(
                            fontFamily: 'Kartooni',
                            fontSize: 20,
                          ),
                        ),
                      ),
                    if (!isEditing)
                      ElevatedButton(
                        onPressed: () {
                          _toggleEditing();
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: const Color(0xFFD7C49E),
                          backgroundColor: const Color(0xFF343148),
                          minimumSize: const Size.fromHeight(20.0),
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: const Text(
                          'Edit Account',
                          style: TextStyle(
                            fontFamily: 'Kartooni',
                            fontSize: 20,
                          ),
                        ),
                      ),
                    const SizedBox(height: 7),
                    ElevatedButton(
                      onPressed: () {
                        _showChangeAccountConfirmationDialog();
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color(0xFFD7C49E),
                        backgroundColor: const Color(0xFF343148),
                        minimumSize: const Size.fromHeight(20.0),
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: const Text(
                        'Change Account',
                        style: TextStyle(
                          fontFamily: 'Kartooni',
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 7),
                    ElevatedButton(
                      onPressed: () {
                        _showViewResultTestDialog();
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color(0xFFD7C49E),
                        backgroundColor: const Color(0xFF343148),
                        minimumSize: const Size.fromHeight(20.0),
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: const Text(
                        'View Result Test',
                        style: TextStyle(
                          fontFamily: 'Kartooni',
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
