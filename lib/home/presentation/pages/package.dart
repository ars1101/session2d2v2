import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:session2d2v2/home/presentation/widgets/customcard.dart';
import 'package:session2d2v2/home/presentation/pages/home.dart';
import 'package:session2d2v2/home/presentation/pages/sendpackage.dart';
import 'package:session2d2v2/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:session2d2v2/auth/pages/signup.dart';
import 'trans.dart';

class pack extends StatefulWidget {
  final int cou;
  const pack({super.key,required this.cou});

  @override
  State<pack> createState() => _packState();
}

List<Widget> list = [
  Column(
    children: [],
  )
];

int count = 1;

class _packState extends State<pack> {
  int index = 0;
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: Column(children: [
            SizedBox(
              height: 69,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 15,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => home()));
                    },
                    icon: Image.asset('assets/arrow_2.png')),
                SizedBox(
                  width: 60,
                ),
                Text(
                  'Send Package',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 1,
              color: Color(0xFFA7A7A7),
            )
          ])),
          SliverToBoxAdapter(
            child: Row(
              children: [
                SizedBox(
                  width: 24,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      "Package information",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF0560FA)),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Origin deatils",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      ora.text + ors.text,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xFFA7A7A7)),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      orp.text,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xFFA7A7A7)),
                    ),
                    Text(
                      "Destination deatils",
                      style:
                      TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(
                  width: 24,
                )
              ],
            ),
          ),
          SliverList.builder(itemCount: widget.cou, itemBuilder: (_, ind){
            return Row(
              children: [SizedBox(width: 24,),
                Column(children: [Text(dest[ind], style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color(0xFFA7A7A7))),
                  Text(pnes[ind], style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color(0xFFA7A7A7))),

                ], crossAxisAlignment: CrossAxisAlignment.start,),
              ],
            );
          }),
          SliverToBoxAdapter(
            child: Row(
              children: [
                SizedBox(
                  width: 24,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    Text(
                      "Other Details",
                      style:
                      TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width - 48,
                      child: Row(children: [Text("Package Items", style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xFFA7A7A7))),Spacer(), Text(pi.text, style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xFFEC8000)), )],),
                    ),
                    SizedBox(height: 8,),
                    SizedBox(width: MediaQuery.of(context).size.width - 48,
                      child: Row(children: [Text("Weight of items", style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xFFA7A7A7))),Spacer(), Text(wei.text + 'kg', style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xFFEC8000)), )],),
                    ),SizedBox(height: 8,),
                    SizedBox(width: MediaQuery.of(context).size.width - 48,
                      child: Row(children: [Text("Package Items", style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xFFA7A7A7))),Spacer(), Text('N' + wor.text, style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xFFEC8000)), )],),

                    ),SizedBox(height: 8,),
                    SizedBox(width: MediaQuery.of(context).size.width - 48,
                      child: Row(children: [Text("Tracking Number", style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xFFA7A7A7))),Spacer(), Text('R-' + code.toString(), style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xFFEC8000)), )],),
                    ),
                    SizedBox(height: 37,),
                    Container(
                      width: MediaQuery.of(context).size.width - 48,
                      height: 1,
                      color: Color(0xFFA7A7A7),
                    ),
                    SizedBox(height: 8,),
                    Text(
                      "Charges",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF0560FA)),
                    ), SizedBox(height: 10,),
                    SizedBox(width: MediaQuery.of(context).size.width - 48,
                      child: Row(children: [Text("Delivery charges", style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xFFA7A7A7))),Spacer(), Text('N' + (widget.cou * 2500).toString() + '.00', style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xFFEC8000)), )],),
                    ),SizedBox(height: 8,),
                    SizedBox(width: MediaQuery.of(context).size.width - 48,
                      child: Row(children: [Text("instant delivery", style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xFFA7A7A7))),Spacer(), Text('N300.00', style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xFFEC8000)), )],),
                    ),SizedBox(height: 8,),
                    SizedBox(width: MediaQuery.of(context).size.width - 48,
                      child: Row(children: [Text("Tax and Service Charges", style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xFFA7A7A7))),Spacer(), Text('N' + ((300 + widget.cou*2500)*0.05).toString() + '.00', style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xFFEC8000)), )],),

                    ),
                    SizedBox(height: 9,),
                    Container(
                      width: MediaQuery.of(context).size.width - 48,
                      height: 1,
                      color: Color(0xFFA7A7A7),
                    ),
                    SizedBox(height: 4,),
                    SizedBox(width: MediaQuery.of(context).size.width - 48,
                      child: Row(children: [Text("Package Total", style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xFFA7A7A7))),Spacer(), Text('N' + (widget.cou * 2500 + 300 + (300 + widget.cou*2500)*0.05).toString() + '.00', style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xFFEC8000)), )],),


                    ),
                    SizedBox(height: 46,),
                    Row(children: [SizedBox(height: 48, width: 158,
                      child: OutlinedButton(onPressed: (){Navigator.of(context).pop();}, child: Text('Edit package', style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF0560FA))), style: OutlinedButton.styleFrom(side: BorderSide(color: Color(0xFF0560FA)), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))), ),
                    ),SizedBox(width: 24,),
                      SizedBox(height: 48, width: 158,
                        child: FilledButton(onPressed: (){Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => trans()));}, child: Text('Make Payment', style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white), ), style: OutlinedButton.styleFrom(side: BorderSide(color: Color(0xFF0560FA)), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))), ),
                      )
                    ],mainAxisAlignment: MainAxisAlignment.center,)





                  ],
                ),
                SizedBox(
                  width: 24,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
