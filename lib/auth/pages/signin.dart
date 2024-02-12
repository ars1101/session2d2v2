import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:session2d2v2/home/presentation/pages/home.dart';
import 'package:session2d2v2/auth/pages/otp.dart';
import 'package:session2d2v2/auth/widgets/customtextfield.dart';
import 'package:session2d2v2/auth/pages/signin.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:session2d2v2/main.dart';
import 'signup.dart';
import 'email.dart';
import 'package:session2d2v2/auth/widgets/supawidgets.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

TextEditingController namec = TextEditingController();
TextEditingController phonec = TextEditingController();
TextEditingController emailc = TextEditingController();
TextEditingController passc = TextEditingController();
TextEditingController passcc = TextEditingController();
bool obs = true;
bool check = false;

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    bool isValid() {
      if ((passc.text.length >= 6) &
          (emailc.text.length != 0) &
          (check == true)) {
        return true;
      } else {
        return false;
      }
    }

    return Scaffold(
      body: ListView(
        children: [
          Row(
            children: [
              SizedBox(
                width: 24,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(
                  height: 81,
                ),
                Text(
                  'Create an account',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Complete the sign up process to get started',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                    height: 72,
                    width: MediaQuery.of(context).size.width - 48,
                    child: CustomTextField(
                        onChange: (str) {
                          setState(() {});
                        },
                        label: 'Email Adress',
                        hint: '***********@mail.com',
                        isObscure: false,
                        controller: emailc)),
                SizedBox(
                  height: 24,
                ),
                SizedBox(
                    height: 72,
                    width: MediaQuery.of(context).size.width - 48,
                    child: CustomTextField(
                      onChange: (str) {
                        setState(() {});
                      },
                      label: 'Password',
                      hint: '***********',
                      isObscure: obs,
                      controller: passc,
                      onTapSuffix: () {
                        setState(() {
                          if (obs == true) {
                            obs = false;
                          } else {
                            obs = true;
                          }
                        });
                      },
                    )),
                SizedBox(
                  height: 24,
                ),
                SizedBox(
                  height: 37,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 1,
                      ),
                      SizedBox(
                        height: 14,
                        width: 14,
                        child: Checkbox(
                            value: check,
                            side: BorderSide(
                                color: Color.fromARGB(255, 0, 108, 236),
                                width: 1),
                            activeColor: Color.fromARGB(255, 0, 108, 236),
                            onChanged: (bool? val) {
                              setState(() {
                                check = val!;
                              });
                            }),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Remember password",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 167, 167, 167)),
                      ),
                      SizedBox(
                        width: 70,
                      ),
                      GestureDetector(onTap:(){Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => emailpage()));} ,
                        child: Text("Forgot password",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 5, 96, 250))),
                      )
                    ]),
                SizedBox(
                  height: 64,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 48,
                  height: 46,
                  child: FilledButton(
                      onPressed: (isValid() == true)
                          ? () async {
                              try {
                                var res = await supabase.auth
                                    .signInWithPassword(
                                    password: passc.text,
                                    email: emailc.text);
                                   usera =  res.user;
                                if (usera != null) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => home(
                                          )));
                                }
                              } on AuthException catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(e.message)));
                              }
                            }
                          : null,
                      child: Text('Sign In')),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 48,
                  child: Row(
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Color.fromARGB(255, 167, 167, 167)),
                      ),
                      GestureDetector(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Color.fromARGB(255, 5, 96, 250)),
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => signUp()));
                        },
                      )
                    ],
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width - 48,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              'Or sign up with',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 167, 167, 167)),
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            Image.asset('assets/google.png')
                          ],
                        )
                      ],
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                    )),
                SizedBox(
                  height: 24,
                )
              ]),
              SizedBox(
                width: 24,
              )
            ],
          )
        ],
      ),
    );
  }
}
