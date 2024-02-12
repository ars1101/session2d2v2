import 'package:flutter/material.dart';
import 'package:session2d2v2/home/presentation/widgets/customcard.dart';
import 'package:session2d2v2/home/presentation/pages/home.dart';
import 'package:session2d2v2/home/presentation/pages/sendpackage.dart';
import 'package:session2d2v2/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:session2d2v2/auth/pages/signup.dart';

class trans extends StatefulWidget {
  const trans({super.key});

  @override
  State<trans> createState() => _transState();
}

List<Widget> list = [
  Column(
    children: [],
  )
];

int count = 1;

class _transState extends State<trans> {
  int index = 0;
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              SizedBox(height: 156,),
                Image.asset('assets/tick.png'),
              SizedBox(height: 75,),
              Text('Transaction Successful', style: Theme.of(context).textTheme.titleLarge,),
              SizedBox(height: 8,),
              Text('Your rider is on the way to your destination', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
              Row(children: [
                Text('Tracking Number ', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                Text(code.toString(), style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF0560FA)), )
              ],)
            ],
          ),
        ],
      )
    );
  }
}
