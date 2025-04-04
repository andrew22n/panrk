import 'package:flutter/material.dart';

class MessegeScreen extends StatefulWidget {
  const MessegeScreen({super.key});

  @override
  State<MessegeScreen> createState() => _MessegeScreenState();
}

class _MessegeScreenState extends State<MessegeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        
        margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Row(
              children: [
                 Icon(
                  Icons.arrow_back_ios_new_outlined,
                  ),
                  SizedBox(width: 90.0,),
                    Text("Andrew Ngwabe",style: TextStyle(
                                                        color: Colors.black,
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 20,
                                                    ),),
                    
                      
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.only(left: 20,right: 20, top: 50.0, bottom: 40,),
             width: MediaQuery.of(context).size.width,
               height: MediaQuery.of(context).size.height/1.18,
               decoration: const BoxDecoration(
                color: Color.fromARGB(255, 158, 141, 90),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), 
                topRight: Radius.circular(30))
               ),
               child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: EdgeInsets.only(left: MediaQuery.of(context).size.width/2),
                    alignment: Alignment.bottomRight,
                    decoration: const BoxDecoration(
                      color: Colors.amber, borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                       topRight: Radius.circular(10), 
                       bottomLeft: Radius.circular(10))
                    ),
                    child: const Text("Hey, how are you doing?", style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),),
                    
                  ),
                  const SizedBox(height: 20,),
                   Container(
                    padding: const EdgeInsets.all(10),
                    margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/2),
                    alignment: Alignment.bottomRight,
                    decoration: const BoxDecoration(
                      color: Colors.amber, borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                       topRight: Radius.circular(10), 
                       bottomRight: Radius.circular(10))
                    ),
                    child: const Text("Hey, how are you doing?", style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),),),
                    const Spacer(),
                    Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(30)),
                      Container(
                        padding: const EdgeInsets.only(left: 20.0, right: 10),
                        decoration: BoxDecoration(color: Colors.white, 
                        borderRadius: BorderRadius.circular(30)),
                        child:  Row(
                          children: [
                            const Expanded(child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Type here your text", 
                                hintStyle: TextStyle(
                                  color: Colors.black45)
                              ),
                            ),),
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(20))
                              ),
                              child: const Center(child: Icon(Icons.send,color: Colors.black12,)))
                          ],
                        ),
                      ),
                    
                ],
               ),

          )
        ],),
      ),
    );
  }
}