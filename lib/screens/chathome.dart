
import 'package:flutter/material.dart';

class ChatHome extends StatefulWidget {
  const ChatHome({super.key});

  @override
  State<ChatHome> createState() => _ChatHomeState();
}

class _ChatHomeState extends State<ChatHome> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xff553370),
      body: Container(
        padding: const EdgeInsets.only(left: 20,right: 20, top: 50, bottom: 20),
        child:  Column(
          
          children: [
            Row(
              
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("ChatUp",style: TextStyle(
                                              color: Colors.white,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20,
                                              ),),
                                              Container(
                                                padding: const EdgeInsets.all(5),
                                                decoration: const BoxDecoration(
                                                  color: Color.fromARGB(255, 161, 156, 165),
                                                  borderRadius: BorderRadius.all(Radius.circular(10))
                                                ),
                                                child:  const Center(
                                                  child: Icon(Icons.search,
                                                  color: Colors.white,
                                                  ),
                                                ),),
                                                                             
              ],
            ),
               Container(
                                 padding: const EdgeInsets.symmetric(vertical:30 , horizontal:20 ,),
                                                    width: MediaQuery.of(context).size.width,
                                                      height: MediaQuery.of(context).size.height/1.18,
                                                      decoration: const BoxDecoration(

                                                        borderRadius: BorderRadius.only(
                                                          topLeft: Radius.circular(20),
                                                        topRight: Radius.circular(20),),
                                                        color: Colors.white

                                                    ),
                                                    child: Column(children: [
                                                      Row(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius: BorderRadius.circular(60),
                                                            child: Image.asset("assets/images/istockphoto-531989851-612x612.jpg", height: 70, width: 70, fit: BoxFit.cover,)),
                                                            const SizedBox(width: 10,),
                                                            const Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                SizedBox(height: 10.4,),
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  children: [
                                                                    Text("Andrew Ngwabe", style: TextStyle(color: Colors.black,
                                                                                                                          fontSize: 20,
                                                                                                                          fontWeight: FontWeight.w500,
                                                                                                                          ),),
                                                                  ],
                                                                ),
                                                         Text("How are doing  over there", style: TextStyle(color: Colors.black12,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w500,
                                                      ),),
                                                      
                                                              ],
                                                            ),
                                                            const Spacer(),
                                                             const Text("04:45 P.M", style: TextStyle(color: Colors.black12,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w500,
                                                      ),)

                                                        ],
                                                        
                                                      ),
                                                      const SizedBox(height: 30,),
                                                      Row(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius: BorderRadius.circular(60),
                                                            child: Image.asset("assets/images/istockphoto-531989851-612x612.jpg", height: 70, width: 70, fit: BoxFit.cover,)),
                                                            const SizedBox(width: 10,),
                                                            const Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                SizedBox(height: 10.4,),
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  children: [
                                                                    Text("Winnie Wa Mummy", style: TextStyle(color: Colors.black,
                                                                                                                          fontSize: 20,
                                                                                                                          fontWeight: FontWeight.w500,
                                                                                                                          ),),
                                                                  ],
                                                                ),
                                                         Text("Hey, babe am   doing well", style: TextStyle(color: Colors.black12,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w500,
                                                      ),),
                                                      
                                                              ],
                                                            ),
                                                            const Spacer(),
                                                             const Text("04:45 P.M", style: TextStyle(color: Colors.black12,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w500,
                                                      ),)

                                                        ],
                                                        
                                                      ),
                                                      
                                                    ],),
               ),

          ],
        ),

      ),
    );
  }
}