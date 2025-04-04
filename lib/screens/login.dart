
import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_app/screens/Service/database.dart';
import 'package:course_app/screens/sign%20_up.dart';
import 'package:course_app/utilis/route_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
String email="", password="", name = "", pic = "", username ="", id ="";
TextEditingController emailcontroller= new TextEditingController();
TextEditingController passwordcontroller= new TextEditingController();
final _formkey= GlobalKey<FormState>();


userLogin()async{
  try{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    QuerySnapshot querySnapshot = await DatabaseMethods().getUserbyemail(email);

    Navigator.pushReplacement(context as BuildContext, MaterialPageRoute(builder: (context)=> RootScreen()));
  }on FirebaseAuthException catch(e){
    if(e.code=='User-not-Found'){
       ScaffoldMessenger.of(context as BuildContext).showSnackBar(const SnackBar(
          backgroundColor: Colors.amberAccent,
          content: Text("User Not Found",
         style: TextStyle(color: Colors.black12, fontSize: 20),)));
    } else if(e.code=='Wrong-password'){
       ScaffoldMessenger.of(context as BuildContext).showSnackBar(const SnackBar(
          backgroundColor: Colors.amberAccent,
          content: Text("Incorrect Password",
         style: TextStyle(color: Colors.black12, fontSize: 20),)));
    }
  }

}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Stack(
          children: [
                  Container(height: MediaQuery.of(context).size.height/3.5,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(10 ),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [
                      Color(0xFF7f30fe),
                    Color(0xFF6380fb),
                    
                    ],begin: Alignment.topLeft,end: Alignment.bottomRight), 
                    borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(MediaQuery.of(context).size.width, 105.0) 
                    ),    
                  ),),
                  Padding(padding: const EdgeInsets.only(top: 70.0),
                  child:  Column(
                    children: [
                       
                        const Center(
                          child:  Text("Sigin", style: TextStyle(
                            color: Colors.white, 
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: 24,
                            
                          ),),
                        ),
                        
                      const SizedBox(height: 20,),
                        const Center(
                         child: Text("Login Into Your Account", style: TextStyle(
                            color: Color(0xFFbbb0ff), 
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: 18,)),
                       ),
                        Container(
                          
                          margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10),
                            elevation: 5.0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                            height: MediaQuery.of(context).size.height/2,
                            
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                            color: Colors.white,
                            
                            borderRadius: BorderRadius.circular(10)
                            ),
                            
                            child: Form(
                              key: _formkey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Email", style: TextStyle(color: Colors.black,
                                  fontStyle: FontStyle.normal,fontWeight: FontWeight.w500
                                  ),),
                                  const SizedBox(height: 10,),
                                  Container(
                                    
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.black38,
                                      ),
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: TextFormField(
                                      controller: emailcontroller,
                                      validator: (value){
                                        if(value==null||value.isEmpty){
                                          return 'Please Enter your email';
                                        } return null;
                                      },
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        prefixIcon: Icon(Icons.email_rounded, color: Color(0xFF7f30fe),),
                                         hintText: "Enter your email", 
                                        hintStyle: TextStyle(fontSize: 15, 
                                        color: Colors.grey,
                                        fontWeight: FontWeight.normal,
                                        
                                        ),
                                      ),
                              
                                    ),
                                  ),
                                  const SizedBox(height: 20,),
                                  const Text("Password", style: TextStyle(color: Colors.black,
                                  fontStyle: FontStyle.normal,fontWeight: FontWeight.w500
                                  ),),
                                  const SizedBox(height: 10,),
                                  Container(
                                    
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.black38,
                                      ),
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: TextFormField(
                                      controller: passwordcontroller,
                                      validator: (value){
                                        if(value==null||value.isEmpty){
                                          return 'please enter your password ';
                                        } return null;
                                      },
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        prefixIcon: Icon(Icons.password_outlined, 
                                        color: Color(0xFF7f30fe),
                                        ),
                                        hintText: "Enter your password", 
                                        hintStyle: TextStyle(fontSize: 15, 
                                        color: Colors.grey,
                                        fontWeight: FontWeight.normal,
                                        
                                        ),
                                        
                                         
                                        
                                      ),
                                      obscureText: true,
                              
                                    ),
                                  ),
                                  const SizedBox(height: 5,),
                                  Container(
                                    alignment: Alignment.bottomRight,
                                    child: const Text("Forgot Password", style: TextStyle(color: Colors.blueAccent,
                                    fontStyle: FontStyle.normal,fontWeight: FontWeight.w500
                                    ),),
                              
                                  ),
                                  const SizedBox(height: 15,),
                                  // Due to the 222 pixel error  I have to reduce the sized widget but I    will change it if am using an andriod emulator
                                  Center(
                                    child: Container(
                                       width: 130,
                                      child: Material(
                                        elevation: 5.0,
                                        child: GestureDetector(
                                          onTap: (){
                                            if(_formkey.currentState!.validate()){
                                              setState(() {
                                                email= emailcontroller.text;
                                                password= passwordcontroller.text;
                                              });
                                            }userLogin();
                                          },
                                          child: Container(
                                             
                                              padding: const EdgeInsets.all(10),
                                              decoration:  BoxDecoration(
                                                color: Colors.blueAccent,
                                                borderRadius: BorderRadius.circular(10)
                                              ),
                                              child: const Center(
                                                // This is a text widget but I will use it  as a botton 
                                                // I don't want to use a real button because its to easy to decorecte a text in a container
                                                child: Text( "Signin", 
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w500,
                                                  ),),
                                              
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  
                                ],
                              ),
                            ),
                            
                              ),
                          ),

                        ),
                        const SizedBox(height: 20,),
                         Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                       const Text("Don't have an account?", style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w200,
                                        color: Colors.black,
                                        fontStyle: FontStyle.normal
                                       ),),
                                      const SizedBox(width: 5,),
                                      GestureDetector(
                                        onTap:  (){
                                          setState(() {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
                                          });
                                        } ,
                                        child: const Text("Sign up now!",style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.blueAccent,
                                          fontStyle: FontStyle.normal
                                         ),),
                                      ),
                          
                                    ],
                                  ),
                        )

                    ],
                  ),
                )
         
          ],
        ),
      ),

    );
  }
}