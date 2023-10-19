import 'package:flutter/material.dart';
import 'package:rate/rate.dart' as rate;
import 'items/size.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyApp> {
    late bool love = false;
    ScrollController _scrollcontroller = ScrollController();
    late int rateValue = 0;
    late int quantity = 1;
    late String selectedSize = 'M';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0Xff1B1B1B),
        appBar: AppBar(
          backgroundColor: const Color(0Xff1B1B1B),
          elevation: 0,
          leading: IconButton(icon: const Icon(Icons.chevron_left), onPressed: () {},),
          actions: [
            IconButton(onPressed: (){
              setState(() {
                love = !love;
              });
            }, 
            icon: Icon(( love ? Icons.favorite :Icons.favorite_border)),
            color: love?Colors.red :Colors.white,
            ),

            Container(
              padding: const EdgeInsets.only(right: 18),
              child: IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_bag_outlined))
            ),
          ],
          
        ),

        body: Column(
          children: [
            SizedBox(
              height: 380,
              child: Row(
                children: [
                  Expanded(
                    child: RawScrollbar(
                      controller: _scrollcontroller,
                      thumbVisibility: true,
                      thickness: 2,
                      thumbColor: Colors.redAccent,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        controller: _scrollcontroller,
                        children: [
                          Image.asset('images/T-shirt.jpg'),
                          Image.asset('images/t2.jpeg'),
                        ],
                      ),
                    )
                  ),
                  Container(
                    width: 50,
                    margin: const EdgeInsets.fromLTRB(25,15,15,15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () => setState(() => selectedSize = 'S'),
                          child: Size(size: 'S', selected: selectedSize)
                        ),

                        InkWell(
                          onTap: () => setState(() => selectedSize = 'M'),
                          child: Size(size: 'M', selected: selectedSize)
                        ),

                        InkWell(
                          onTap: () => setState(() => selectedSize = 'L'),
                          child: Size(size: 'L', selected: selectedSize)
                        ),

                        InkWell(
                          onTap: () => setState(() => selectedSize = 'XL'),
                          child: Size(size: 'XL', selected: selectedSize)
                        ),

                        InkWell(
                          onTap: () => setState(() => selectedSize = '2XL'),
                          child: Size(size: '2XL', selected: selectedSize)
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding( padding: EdgeInsets.all(5),
                    child: Text('Belgium EURO',style: TextStyle(color: Colors.white,fontSize: 24,fontFamily: 'Audiowide',fontWeight: FontWeight.bold),)),
                  const Padding(padding: EdgeInsets.all(5),
                    child: Text("20/21 Away by Adidas",style: TextStyle(color: Colors.grey,fontSize: 16,fontFamily: 'Audiowide'),)),
                  
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5,15,5,15),
                    child: Row(
                      children: [
                        rate.Rate(
                          color: Colors.red,
                          onChange: (value) {
                            setState(() {
                              rateValue = value.toInt();
                            });
                            }
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text('$rateValue',
                          style: const TextStyle(color: Colors.white,fontSize: 16,fontFamily: 'Audiowide'),
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12) , color: const Color(0xFF2B2B2B)),
                          child: Row(
                            children: [
                              Container(
                                height: 33,
                                width: 33,
                                decoration: const BoxDecoration(color: Colors.red,borderRadius: BorderRadius.all(Radius.circular(10))),
                                child: IconButton(onPressed: (){
                                  setState(() {
                                    if(quantity>1) {
                                      quantity--;
                                    } else {
                                      quantity=1;
                                    }
                                  });
                                }, 
                                icon: const Icon(Icons.remove),color: Colors.white,iconSize: 18,),
                              ),
                              
                              Container(
                                margin: const EdgeInsets.only(left: 25,right: 25),
                                child: Text("$quantity",
                                style: const TextStyle(color: Colors.white,fontSize: 14,fontFamily: 'Audiowide'),
                                ),
                              ),

                              Container(
                                height: 33,
                                width: 33,
                                decoration: const BoxDecoration(color: Colors.red,borderRadius: BorderRadius.all(Radius.circular(10))),
                                child: IconButton(onPressed: (){
                                  setState(() {
                                    quantity++;
                                  });
                                }, 
                                icon: const Icon(Icons.add),color: Colors.white,iconSize: 18,),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5,right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 110,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Details',
                                style: TextStyle(fontFamily: 'Audiowide',color: Colors.grey,fontSize: 18),
                              ),
                              RichText(
                                text: const TextSpan(
                                  text: 'Material : ',
                                  style: TextStyle(fontSize: 16,fontFamily: 'Audiowide',fontWeight: FontWeight.bold),
                                  children: <TextSpan>[
                                    TextSpan(text: 'polyester', style: TextStyle(fontFamily: 'Audiowide',color: Colors.grey,fontWeight: FontWeight.normal)),
                                  ],
                                ),
                              ),
                                          
                              RichText(
                                text: const TextSpan(
                                  text: 'Shipping : ',
                                  style: TextStyle(fontSize: 16,fontFamily: 'Audiowide',fontWeight: FontWeight.bold),
                                  children: <TextSpan>[
                                    TextSpan(text: 'In 5 to 6 Days', style: TextStyle(fontFamily: 'Audiowide',color: Colors.grey,fontWeight: FontWeight.normal)),
                                  ],
                                ),
                              ),
                                          
                              RichText(
                                text: const TextSpan(
                                  text: 'Returns : ',
                                  style: TextStyle(fontSize: 16,fontFamily: 'Audiowide',fontWeight: FontWeight.bold),
                                  children: <TextSpan>[
                                    TextSpan(text: 'Within 20 Days', style: TextStyle(fontFamily: 'Audiowide',color: Colors.grey,fontWeight: FontWeight.normal)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        TextButton(
                          onPressed: () {
                            // Add your action here
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: SizedBox(
                            height: 110,
                            width: 80,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Icon(Icons.shopping_bag_outlined,
                                  size: 25,color: Colors.white,
                                ),
                                Text('\$${ 89 * quantity}',
                                  style: const TextStyle(color: Colors.white,fontSize: 22,fontFamily: 'Audiowide',fontWeight:FontWeight.bold ),
                                )
                              ],
                            ),
                          )
                        )

                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}