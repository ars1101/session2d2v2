import 'package:flutter/material.dart';
import 'package:session2d2v2/home/presentation/pages/package.dart';
import 'package:session2d2v2/home/presentation/widgets/customcard.dart';
import 'package:session2d2v2/home/presentation/pages/home.dart';
import 'package:session2d2v2/main.dart';
import 'package:session2d2v2/auth/pages/signin.dart';
import 'package:session2d2v2/auth/pages/signup.dart';


class send extends StatefulWidget {
  const send({super.key});

  @override
  State<send> createState() => _sendState();
}

List<Widget> list = [
  Column(
    children: [],
  )
];

List<String> dest = [];
int count = 1;
List<String> pnes = [];

TextEditingController ora = TextEditingController();
TextEditingController ors = TextEditingController();
TextEditingController orp = TextEditingController();
TextEditingController oro = TextEditingController();
TextEditingController pi = TextEditingController();
TextEditingController wei = TextEditingController();
TextEditingController wor = TextEditingController();
dynamic code = '';

class _sendState extends State<send> {



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
                  "Send a package",
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
                  children: [
                    SizedBox(
                      height: 43,
                    ),
                    Row(
                      children: [
                        Image.asset('assets/origin.png'),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Origin Details',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Color(
                              0x26000000,
                            ),
                            offset: Offset(0, 2),
                            blurRadius: 5)
                      ], color: Colors.white),
                      child: TextField(controller: ora,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: ' Address',
                            hintStyle: Theme.of(context).textTheme.titleSmall),
                      ),
                      height: 32,
                      width: 342,
                    ),SizedBox(height: 5,),
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Color(
                              0x26000000,
                            ),
                            offset: Offset(0, 2),
                            blurRadius: 5)
                      ], color: Colors.white),
                      child: TextField(controller: ors,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: ' State, Country',
                            hintStyle: Theme.of(context).textTheme.titleSmall),
                      ),
                      height: 32,
                      width: 342,
                    ),SizedBox(height: 5,),
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Color(
                              0x26000000,
                            ),
                            offset: Offset(0, 2),
                            blurRadius: 5)
                      ], color: Colors.white),
                      child: TextField(controller: orp,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: ' Phone number',
                            hintStyle: Theme.of(context).textTheme.titleSmall),
                      ),
                      height: 32,
                      width: 342,
                    ),SizedBox(height: 5,),
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Color(
                              0x26000000,
                            ),
                            offset: Offset(0, 2),
                            blurRadius: 5)
                      ], color: Colors.white),
                      child: TextField(controller: oro,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: ' Others',
                            hintStyle: Theme.of(context).textTheme.titleSmall),
                      ),
                      height: 32,
                      width: 342,
                    ),
                    SizedBox(height: 39,)
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ],
            ),
          ),
          SliverList.builder(itemCount: count, itemBuilder: (_, ind){
            String adr = '';
            String state = '';
            String phone = '';
            String oth = '';
            dest.add('');
            pnes.add('');

                return Row(
                  children: [
                    SizedBox(
                      width: 24,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 43,
                        ),
                        Row(
                          children: [
                            Image.asset('assets/dest.png'),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Destination Details',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 14),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Color(
                                  0x26000000,
                                ),
                                offset: Offset(0, 2),
                                blurRadius: 5)
                          ], color: Colors.white),
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: ' Address',
                                hintStyle: Theme.of(context).textTheme.titleSmall), onChanged: (tx){adr = tx;
                            dest[ind] = (ind+1).toString() + '. ' + adr + state;
                            },
                          ),
                          height: 32,
                          width: 342,
                        ),SizedBox(height: 5,),
                        Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Color(
                                  0x26000000,
                                ),
                                offset: Offset(0, 2),
                                blurRadius: 5)
                          ], color: Colors.white),
                          child: TextField(onChanged: (tx){state = tx;
                            dest[ind] = (ind+1).toString() + '. ' + adr + state;
                          },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: ' State, Country',
                                hintStyle: Theme.of(context).textTheme.titleSmall),
                          ),
                          height: 32,
                          width: 342,
                        ),SizedBox(height: 5,),
                        Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Color(
                                  0x26000000,
                                ),
                                offset: Offset(0, 2),
                                blurRadius: 5)
                          ], color: Colors.white),
                          child: TextField(onChanged: (tx){phone = tx;
                          pnes[ind] = phone;
                            dest[ind] = (ind+1).toString() + '. ' + adr + state;
                          },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: ' Phone number',
                                hintStyle: Theme.of(context).textTheme.titleSmall),
                          ),
                          height: 32,
                          width: 342,
                        ),SizedBox(height: 5,),
                        Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Color(
                                  0x26000000,
                                ),
                                offset: Offset(0, 2),
                                blurRadius: 5)
                          ], color: Colors.white),
                          child: TextField(onChanged: (tx){oth = tx;
                            dest[ind] = (ind+1).toString() + '. ' + adr + state;
                          },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: ' Others',
                                hintStyle: Theme.of(context).textTheme.titleSmall),

                          ),
                          height: 32,
                          width: 342,
                        ),
                        SizedBox(height: 24,)
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ],
                );
          },),
          SliverToBoxAdapter(child: Row(children: [SizedBox(width: 24,), IconButton(onPressed: (){
            setState(() {
              count = count+1;
            });
          } , icon: Image.asset('assets/add.png')), SizedBox(width: 6,),Text(
            'Add Destination',
            style: Theme.of(context).textTheme.titleSmall,
          ) ] ,),),

          SliverToBoxAdapter(
            child: Row(
              children: [
                SizedBox(
                  width: 24,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 43,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Package Details',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Color(
                              0x26000000,
                            ),
                            offset: Offset(0, 2),
                            blurRadius: 5)
                      ], color: Colors.white),
                      child: TextField(controller: pi,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: ' package items',
                            hintStyle: Theme.of(context).textTheme.titleSmall),
                      ),
                      height: 32,
                      width: 342,
                    ),SizedBox(height: 5,),
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Color(
                              0x26000000,
                            ),
                            offset: Offset(0, 2),
                            blurRadius: 5)
                      ], color: Colors.white),
                      child: TextField(controller: wei,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: ' Weight of item(kg)',
                            hintStyle: Theme.of(context).textTheme.titleSmall),
                      ),
                      height: 32,
                      width: 342,
                    ),SizedBox(height: 5,),
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Color(
                              0x26000000,
                            ),
                            offset: Offset(0, 2),
                            blurRadius: 5)
                      ], color: Colors.white),
                      child: TextField(controller: wor,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: ' Worth of Items',
                            hintStyle: Theme.of(context).textTheme.titleSmall),
                      ),
                      height: 32,
                      width: 342,
                    ),
                    SizedBox(height: 39,)
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(child:
            Row(children: [SizedBox(height: 75, width: 169,
              child: FilledButton(onPressed: ()async {print(usera);
                code = await supabase.from('orders').insert({
                  'id_user' : usera!.id,
                  'address' : ora.text,
                  'country' : ors.text,
                  'phone' : orp.text,
                  'others' : oro.text,
                  'package_items' : pi.text,
                  'weight_items' : wei.text,
                  'worth_items' : wor.text,
                  'delivery_charges' : count * 2500,
                  'instant_delivery' : 300,
                  'tax_and_service_charges' : (300 + count*2500) * 0.05,
                  'sum_price' : count * 2500 + 300 + (300 + count*2500) * 0.05




                }).select()
                  .single()
                  .then((value) => value["id"]);
                
                
                
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => pack(cou: count,)));
                print(dest[0]);
              }, child: Column(children: [
                Image.asset('assets/clock.png'),SizedBox(height: 10,), Text('Instant delivery')
              ],crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,)),
            ),SizedBox(width: 24,),
            SizedBox(height: 75, width: 169, child:
            FilledButton(onPressed: (){Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => pack(cou: count)));}, child: Column(children: [
              Image.asset('assets/calen.png'),SizedBox(height: 10,), Text('Scheduled delivery')
            ],crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,),
              style: FilledButton.styleFrom(
                elevation: 5, backgroundColor: Colors.white, foregroundColor: Color(0xFFA7A7A7)
              ),

            )
            )],mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,)

            
            ,)
        ],
      ),
    );
  }
}
