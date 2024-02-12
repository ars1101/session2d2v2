import 'package:flutter/material.dart';
import 'package:session2d2v2/home/presentation/pages/home.dart';
import 'package:session2d2v2/core/colors.dart';
import 'package:session2d2v2/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CustomCard extends StatelessWidget{

  final String image;
  final String label;
  final String hint;



    CustomCard({required this.image, required this.hint, required this.label});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container( decoration: BoxDecoration(boxShadow: [BoxShadow(color: Color(
          0x26000000, ), offset: Offset(0,2), blurRadius: 5)], color: Colors.white ),
        child: ListTile(

                leading: Image.asset(image),
                  title: Text(label, style: TextStyle(color: Color(0xFF3A3A3A), fontWeight: FontWeight.w500, fontSize: 16),),
                  subtitle: Text(hint, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, ),),
                  trailing: Image.asset('assets/arrow.png'),





          ),
      ),

    );
  }

}