import 'package:flutter/material.dart';
import 'package:myapp/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  bool isEmailValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFFF6F8FB),
        body: ListView(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 75),
                // child: Image.asset(
                //   "assets/images/JustDuit.png",
                //   width: 200,
                //   height: 50,
                // ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Text(
                "Hi, Welcome Back to JustDuit",
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Poppins-Regular',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SafeArea(
                child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Email Address'),
                        Text(
                          '*',
                          style: TextStyle(color: Colors.red),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text('Password'),
                        Text(
                          '*',
                          style: TextStyle(color: Colors.red),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                    Container(
                        width: double.infinity,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                fontSize: 14.0,
                                fontFamily: 'Poppins-Regular',
                                color: Color(0xff1e90ff),
                              ),
                            ),
                          ),
                        )),
                    Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xff1e90ff)),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                          ),
                          onPressed: () {
                            setState(() {
                              isEmailValid = emailController.text.isNotEmpty;
                            });
                          },
                          child: Text(
                            "Sign In Now",
                            style: TextStyle(
                              fontSize: 15.0,
                              fontFamily: 'Poppins-Regular',
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        )),
                    Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 0),
                        child: TextButton(
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(
                                Color(0xff1e90ff)),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignupScreen()));
                          },
                          child: Text(
                            "Create New Account",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontFamily: 'Poppins-Regular',
                              color: Color.fromARGB(255, 155, 169, 190),
                            ),
                          ),
                        ))
                  ]),
            ))
          ],
        ));
  }
}
