import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:session2d2v2/auth/widgets/customtextfield.dart';
import 'package:session2d2v2/auth/pages/signin.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:session2d2v2/main.dart';
import 'signin.dart';
import 'package:session2d2v2/auth/widgets/supawidgets.dart';
import 'package:session2d2v2/home/presentation/pages/home.dart';

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

User? usera;

class _signUpState extends State<signUp> {
  TextEditingController namec = TextEditingController();
  TextEditingController phonec = TextEditingController();
  TextEditingController emailc = TextEditingController();
  TextEditingController passc = TextEditingController();
  TextEditingController passcc = TextEditingController();
  bool obs = true;
  bool check = false;
  bool isValid() {
    if ((passcc.text == passc.text) &
        (passc.text.length >= 6) &
        (namec.text.length != 0) &
        (phonec.text.length != 0) &
        (emailc.text.length != 0) &
        (check == true)) {
      return true;
    } else {
      return false;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Row(
          children: [
            SizedBox(
              width: 24,
            ),
            Column(
              children: [
                SizedBox(
                  height: 81,
                ),
                Text(
                  'Welcome back',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Fill in your email and password to continue',
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
                        label: 'Full Name',
                        hint: 'Ivanov Ivan',
                        isObscure: false,
                        controller: namec)),
                SizedBox(
                  height: 24,
                ),
                SizedBox(
                    height: 72,
                    width: MediaQuery.of(context).size.width - 48,
                    child: CustomTextField(
                      label: 'Phone Number',
                      hint: '+7(999)999-99-99',
                      isObscure: false,
                      controller: phonec,
                      formatter: MaskTextInputFormatter(
                          filter: {'#': RegExp(r'[0-9]')},
                          mask: '+#(###)###-##-##'),
                    )),
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
                    height: 72,
                    width: MediaQuery.of(context).size.width - 48,
                    child: CustomTextField(
                      onChange: (str) {
                        setState(() {});
                      },
                      label: 'Confirm Password',
                      hint: '***********',
                      isObscure: obs,
                      controller: passcc,
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
                        width: 26,
                      ),
                      RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "By ticking this box, you agree to our ",
                            style: Theme.of(context).textTheme.titleSmall,
                            children: [
                              TextSpan(
                                  text:
                                      "Terms and \nconditions and private policy",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 235, 188, 46)))
                            ],
                          )),
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
                                 usera = await SignUser(emailc.text, passc.text, phonec.text, namec.text);
                                if (usera != null) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => home(
                                          )));
                                }
                              } on AuthException catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(e.message)));
                              }
                              print(usera);
                            }
                          : null,
                      child: Text('Sign Up')),
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
                          'Sign in',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Color.fromARGB(255, 5, 96, 250)),
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignIn()));
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
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            SizedBox(
              width: 24,
            )
          ],
        )
      ],
    ));
  }
}
