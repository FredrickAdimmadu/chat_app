import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../api/apis.dart';
import '../../helper/dialogs.dart';
import '../../main.dart';
import '../../models/chat_user.dart';
import '../../navigate.dart';
import 'package:yap/screens/auth/login_screen.dart';
import '../../resources/auth_methods.dart';
import '../../utils/colors.dart';
import '../../utils/utils.dart';
import '../home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';




class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {







  bool _isAnimate = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _obscureText = true;

  static FirebaseAuth auth = FirebaseAuth.instance;

  static FirebaseFirestore firestore = FirebaseFirestore.instance;



  static User get user => auth.currentUser!;



  Future<void> _createAccount() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      if (userCredential.user != null) {
        await _saveUserData(userCredential.user!.uid,  _nameController.text.trim(), _passwordController.text.trim());
        // User account created successfully
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NavigatePage(),
          ),
        );
      }
    } catch (e) {
      // Handle any errors that occur during account creation
      print('Error creating account: $e');
      // Display an error message to the user
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Failed to create account. Please try again.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    }
  }

  static Future<void> _saveUserData(String uid, String name, String password) async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();

    final chatUser = ChatUser(
      id: user.uid,
      name: name,
      email: user.email.toString(),
      about: "Hey, I'm using Yap",
      image: user.photoURL.toString(),
      createdAt: time,
      isOnline: false,
      lastActive: time,
      pushToken: '',
      number: '',
      relationship: '',
      country: '',
      gender: '',
      language: '',
      website: '',
      followers: [],
      following: [],
      password: password,
      updatePassword: '',
      description: '',
      file: '',
      profImage: '',
      postId: '',
      postUrl: '',
      likes: '',
      datePublished: '',
      commentId: '',
      text: '',
      caption: '',



    );


    return await firestore
        .collection('users')
        .doc(user.uid)
        .set(chatUser.toJson());
  }



  @override
  void initState() {
    super.initState();
    //for auto triggering animation
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() => _isAnimate = true);
    });
  }







  @override
  Widget build(BuildContext context) {
    // Initializing media query (for getting device screen size)
    mq = MediaQuery.of(context).size;

    return Scaffold(
      // App bar
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Yap'),
      ),

      // Body
      body: Stack(
        children: [
          // App logo
          AnimatedPositioned(
            top: mq.height * .10,
            right: _isAnimate ? mq.width * .25 : -mq.width * .5,
            width: mq.width * .5,
            duration: const Duration(seconds: 1),
            child: Image.asset('images/icon.png'),
          ),

          // Email and password fields
          Positioned(
            top: mq.height * 0.3,
            left: mq.width * 0.1,
            right: mq.width * 0.1,
            child: Column(
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                  keyboardType: TextInputType.name,

                ),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                  keyboardType: TextInputType.emailAddress,

                ),

                SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.length < 7) {
                      return 'Password must be at least 7 characters';
                    }
                    return null;
                  },
                ),


                const SizedBox(
                  height: 24,
                ),
                InkWell(
                  onTap: _createAccount,
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                      color: blueColor,
                    ),
                    child: !_isLoading
                        ? const Text(
                      'Sign up',
                    )
                        : const CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  ),
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text(
                        'Already have an account?',
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: const Text(
                          ' Login.',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),



              ],
            ),
          ),


          // Google login button

        ],
      ),
    );
  }

}