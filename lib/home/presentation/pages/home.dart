

import 'package:flutter/material.dart';
import 'package:session2d2v2/home/presentation/widgets/customcard.dart';
import 'package:session2d2v2/home/presentation/pages/paymethod.dart';
import 'package:session2d2v2/home/presentation/pages/sendpackage.dart';
import 'package:session2d2v2/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:session2d2v2/auth/widgets/supawidgets.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int index = 0;
  bool value = false;
  int orderState = 0;



  @override
  void initState() {
    super.initState();
    subscribeOrder(code, (pay){
      setState(() {
        orderState = pay.newRecord["status"];
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                  (index == 0) ? "assets/house-2_1.png" : "assets/house-2.png"),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Image.asset('assets/wallet-3.png'), label: "Wallet"),
            BottomNavigationBarItem(
                icon: Image.asset((index == 2)
    ? "assets/smart-car_1.png"
                    : "assets/smart-car.png"),
     label: "Tracking"),
            BottomNavigationBarItem(
                icon: Image.asset((index == 3)
                    ? "assets/profile-circle_1.png"
                    : "assets/profile-circle.png"),
                label: "profile")
          ],
          selectedItemColor: (Color(0xFF0560FA)),
          currentIndex: index,
          unselectedItemColor: Color(0xFFA7A7A7),
          unselectedLabelStyle: TextStyle(color: Color(0xFFA7A7A7)),
          onTap: (ind) {
            setState(() {
              index = ind;
            });
          },
        ),
        body: [
          Center(
            child: FilledButton(child: Text('To Order'), onPressed: (){Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => send()));},),
          ),
          Center(child: Text('')),
          Column(children: [
            Image.asset("assets/mapa.png"),
            Row( children: [SizedBox(width: 24,), Column(children: [
              SizedBox(height: 42,),
              Text('Tracking Number', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),),
              SizedBox(height: 24,),
              Row(children: [
                Image.asset('assets/sun.png'), SizedBox(width: 8,),
                Text(code.toString(),style: TextStyle(color: Color(0xFF0560FA), fontWeight: FontWeight.w500, fontSize: 16) ,)
              ],),
              SizedBox(height: 16,),
              Text("instant delivery", style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xFFA7A7A7))),
              SizedBox(height: 24,),
              Row(children: [Column(crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(child: Checkbox(value: (orderState >= 1)? true : false, onChanged: null, ), width: 14, height: 14,),
                  Container(width: 1, height: 34, color: Color(0xFFA7A7A7),),
                  SizedBox(child: Checkbox(value: (orderState >= 2)? true : false, onChanged: null, ), width: 14, height: 14,),
                  Container(width: 1, height: 34, color: Color(0xFFA7A7A7),),
                  SizedBox(child: Checkbox(value: (orderState >= 3)? true : false, onChanged: null, ), width: 14, height: 14,),
                  Container(width: 1, height: 34, color: Color(0xFFA7A7A7),),
                  SizedBox(child: Checkbox(value: (orderState >= 4)? true : false, onChanged: null, ), width: 14, height: 14,),





                ],
              )], mainAxisAlignment: MainAxisAlignment.start,)

            ], crossAxisAlignment: CrossAxisAlignment.start,),

            ], mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,),

          ], crossAxisAlignment: CrossAxisAlignment.start,),
          Column(
            children: [
              SizedBox(
                height: 69,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Profile",
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
              SizedBox(
                height: 27,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: Image.asset(
                      "assets/profile-circle.png",
                      scale: 0.4,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello Ken",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Row(
                        children: [
                          Text(
                            'Current balance: ',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'N10,712:00',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF0560FA)),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 106,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  Image.asset('assets/eye-slash.png')
                ],
              ),
              SizedBox(
                height: 19,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 24,
                  ),
                  Text(
                    "Enable Dark Theme",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  Switch(
                      value: value,
                      onChanged: (val) {
                        setState(() {
                          value = val;
                        });
                      }),
                  SizedBox(
                    width: 27,
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
              SizedBox(
                height: 19,
              ),
              SizedBox(
                child: CustomCard(
                  image: 'assets/profile-circle.png',
                  label: 'Edit Profile',
                  hint: 'Name, phone no, address, email ...',
                ),
                width: MediaQuery.of(context).size.width - 48,
                height: 68,
              ),
              SizedBox(height: 9,),
              SizedBox(
                child: CustomCard(
                  image: 'assets/papers.png',
                  label: 'Statements & Reports',
                  hint: 'Download transaction details, orders, deliveries',
                ),
                width: MediaQuery.of(context).size.width - 48,
                height: 62,
              ),
              SizedBox(height: 9,),
              SizedBox(
                child: CustomCard(
                  image: 'assets/notification.png',
                  label: 'Notification Settings',
                  hint: 'mute, unmute, set location & tracking setting',
                ),
                width: MediaQuery.of(context).size.width - 48,
                height: 62,
              ),
              SizedBox(height: 9,),
              GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => paymethod()));},
                child: SizedBox(
                  child: CustomCard(
                    image: 'assets/wallet-2.png',
                    label: 'Card & Bank account settings',
                    hint: 'change cards, delete card details',
                  ),
                  width: MediaQuery.of(context).size.width - 48,
                  height: 62,
                ),
              ),
              SizedBox(height: 9,),
              SizedBox(
                child: CustomCard(
                  image: 'assets/map.png',
                  label: 'About Us',
                  hint: 'know more about us, terms and conditions',
                ),
                width: MediaQuery.of(context).size.width - 48,
                height: 62,
              ),
              SizedBox(height: 9,),
              SizedBox(
                child: CustomCard(
                  image: 'assets/logout.png',
                  label: 'Logout',
                  hint: '',
                ),
                width: MediaQuery.of(context).size.width - 48,
                height: 62,
              ),
              SizedBox(height: 9,),
            ],
          )
        ][index]);
  }
}
