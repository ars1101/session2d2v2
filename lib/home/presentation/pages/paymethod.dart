import 'package:flutter/material.dart';
import 'package:session2d2v2/home/presentation/pages/home.dart';



class paymethod extends StatefulWidget {
  const paymethod({super.key});

  @override
  State<paymethod> createState() => _paymethodState();
}

class _paymethodState extends State<paymethod> {
  int index = 0;
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 69,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [SizedBox(width: 15 ,),IconButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => home()));}
              , icon: Image.asset('assets/arrow_2.png'))
            ,Text(
              "Add Payment method",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 1,
          color: Color(0xFFA7A7A7),
        ),
      ],
    ));
  }
}
