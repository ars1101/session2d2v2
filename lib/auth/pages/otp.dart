import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:session2d2v2/auth/pages/home.dart';
import 'package:session2d2v2/auth/pages/newpass.dart';
import 'package:session2d2v2/auth/widgets/customtextfield.dart';
import 'package:session2d2v2/auth/pages/signin.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:session2d2v2/main.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'signup.dart';
import 'email.dart';
import 'package:pinput/pinput.dart';
import 'package:timer_count_down/timer_count_down.dart';




class otppage extends StatefulWidget {
  final String emali;
  const otppage({super.key, required String this.emali });


  @override
  State<otppage> createState() => _otppageState();
}

TextEditingController otpc = TextEditingController();
CountdownController cnt = CountdownController();

bool obs = true;
bool check = false;
int time = 0;
class _otppageState extends State<otppage> {



  @override
  Widget build(BuildContext context) {
    bool isValid() {
      if ((otpc.text.length == 6)) {
        return true;
      } else {
        return false;
      }
    }

    var val = false;
    double sizes = ((MediaQuery.of(context).size.width - 48) ~/ 6 - 30);

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
                  'OTP Varification',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Enter the 6 digit numbers sent to your email',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 48,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Pinput(
                        controller: otpc,
                        length: 6,
                        separatorBuilder: (context) => SizedBox(
                          width: sizes,
                        ),
                        onChanged: (text) {
                          setState(() {
                            if (otpc.text.length == 6) {
                              setState(() {
                                val = true;
                              });
                            } else {
                              setState(() {
                                val = false;
                              });
                            }
                            print(val);
                          });
                        },
                        defaultPinTheme: PinTheme(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFFA7A7A7))),
                        ),
                        focusedPinTheme: PinTheme(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFF0560FA))),
                        ),
                        submittedPinTheme: PinTheme(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF0560FA)))),

                      ),

                    ],
                  ),

                ),
                SizedBox(height: 30,),
                SizedBox(width: MediaQuery.of(context).size.width - 48 ,child: Row(mainAxisAlignment:MainAxisAlignment.center ,
                children: [
                  Text('If you didn’t receive code, resend after ', style: Theme.of(context).textTheme.titleSmall,),
                  Countdown(
                    controller: cnt,
                    seconds: 59,
                    build: (_, double time) => (time > 10)? Text(
                      '0:'+ time.round().toString(),
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ): Text(
                      '0:0'+time.round().toString(),
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    )   ,
                    interval: Duration(milliseconds: 1000),
                    onFinished: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Timer is done!'),
                        ),
                      );
                    },
                  ),

                ],
                ),),
                SizedBox(
                  height: 64,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 48,
                  height: 46,
                  child: FilledButton(
                      onPressed: (isValid())
                          ? () async {
                              try {
                                var res = await supabase.auth
                                    .verifyOTP(token: otpc.text, type: OtpType.email, email: widget.emali);
                                var user = res.user;
                                var session = res.session;


                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => npass()));
                              } on AuthException catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(e.message)));
                              }
                            }
                          : null,
                      child: Text('Set New password')),
                ),
                SizedBox(
                  height: 20,
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
