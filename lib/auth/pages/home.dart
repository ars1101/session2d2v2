import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:session2d2v2/auth/pages/home.dart';
import 'package:session2d2v2/auth/widgets/customtextfield.dart';
import 'package:session2d2v2/auth/pages/signin.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:session2d2v2/main.dart';

class home extends StatefulWidget {
  const home({super.key, required this.title});

  final String title;

  @override
  State<home> createState() => _homeState();
}


class _homeState extends State<home> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Home", style: TextStyle(fontSize: 24),),),
    );
  }
}