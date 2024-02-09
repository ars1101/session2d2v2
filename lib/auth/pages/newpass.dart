import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:session2d2v2/auth/pages/home.dart';
import 'package:session2d2v2/auth/widgets/customtextfield.dart';
import 'package:session2d2v2/auth/pages/signin.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:session2d2v2/main.dart';
import 'home.dart';
import 'signin.dart';

class npass extends StatefulWidget {
  const npass({super.key});

  @override
  State<npass> createState() => _npassState();
}

class _npassState extends State<npass> {
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
                      'New password',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Enter new password',
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
                              supabase.auth.signOut();
                            } on AuthException catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(e.message)));
                            }
                          }
                              : null,
                          child: Text('Log In')),
                    ),

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
