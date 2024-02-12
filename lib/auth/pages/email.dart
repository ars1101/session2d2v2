import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:session2d2v2/home/presentation/pages/home.dart';
import 'package:session2d2v2/auth/pages/otp.dart';
import 'package:session2d2v2/auth/widgets/customtextfield.dart';
import 'package:session2d2v2/auth/pages/signin.dart';
import 'package:session2d2v2/auth/widgets/supawidgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:session2d2v2/main.dart';
import 'signup.dart';
import 'email.dart';

class emailpage extends StatefulWidget {
  const emailpage({super.key,});



  @override
  State<emailpage> createState() => _emailpageState();
}

TextEditingController namec = TextEditingController();
TextEditingController phonec = TextEditingController();
TextEditingController emailc = TextEditingController();
TextEditingController passc = TextEditingController();
TextEditingController passcc = TextEditingController();
bool obs = true;
bool check = false;

class _emailpageState extends State<emailpage> {
  @override
  Widget build(BuildContext context) {
    bool isValid() {
      if (
      (emailc.text.length != 0)) {
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
                  'Forgot password',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Enter your email adress',
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
                  height: 64,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 48,
                  height: 46,
                  child: FilledButton(
                      onPressed: (isValid() == true)
                          ? () async {
                        try {
                          await SendOTP(emailc.text);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => otppage(emali: emailc.text,)));



                        } on AuthException catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(e.message)));
                        }
                      }
                          : null,
                      child: Text('Send OTP')),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 48,
                  child: Row(
                    children: [
                      Text(
                        'Remember password? back to',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Color.fromARGB(255, 167, 167, 167)),
                      ),
                      GestureDetector(
                        child: Text(
                          'Sign In',
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
