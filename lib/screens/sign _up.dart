// ignore_for_file: unnecessary_new, unnecessary_null_comparison, unused_local_variable, use_build_context_synchronously, avoid_unnecessary_containers

import 'package:course_app/screens/Service/database.dart';
import 'package:course_app/screens/Service/sharedpref.dart';
import 'package:course_app/screens/login.dart';
import 'package:course_app/utilis/route_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:random_string/random_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

String email="", password="", name="", confirmPassword="";
TextEditingController namecontroller= new TextEditingController();
TextEditingController emailcontroller= new TextEditingController();
TextEditingController passwordcontroller= new TextEditingController();
TextEditingController confirmPasswordcontroller= new TextEditingController();
final  _formkey=GlobalKey<FormState>();
registration()async{
  if(password!=null&& namecontroller.text!=""&& emailcontroller.text!=""){
    try{
      UserCredential userCredential= await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
         password: password);
         String id= randomAlphaNumeric(10);
         Map<String, dynamic>userInfoMap={
          "name":namecontroller.text,
          "E-mail":emailcontroller.text,
          "username":emailcontroller.text.replaceAll("@gmail.com", ""),
          "photo":"",
          "id": id,
         };
         await DatabaseMethods().addUserDetails(userInfoMap, id);
         await SharedPrefenceHelper().saveUserid(id);
         await SharedPrefenceHelper().saveUserDisplayName(namecontroller.text);
         await SharedPrefenceHelper().saveUserEmail(emailcontroller.text);
         await SharedPrefenceHelper().saveUserPic("");
         await SharedPrefenceHelper().saveUserName(emailcontroller.text.replaceAll("@gmail.com", ""),);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Registration successfully", style: 
        TextStyle(color: Colors.black12,
         fontSize: 20),)));
      Navigator.push(context, 
      MaterialPageRoute(builder: (context)=> const RootScreen()));
    }on FirebaseAuthException catch(e){
      if(e.code=='weak password'){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.amberAccent,
          content: Text("Weak Password Provided",
         style: TextStyle(color: Colors.black12, fontSize: 20),)));

      } else if(e.code=="email-already-in-use"){
         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.amberAccent,
          content: Text("Email provided already in use please login",
         style: TextStyle(color: Colors.black12, fontSize: 20),)));
      }
    }
  }
}










  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          child:  Text("SignUp", style: TextStyle(
                            color: Colors.white, 
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: 24,
                            
                          ),),
                        ),
                        
                      const SizedBox(height: 20,),
                        const Center(
                         child: Text("Create Your Account", style: TextStyle(
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
                            height: MediaQuery.of(context).size.height/1.6,
                            // This is the size of the container that include all the textFields
                            //The container's size accordes to the phone or device
                            
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
                                  const Text("Name", style: TextStyle(color: Colors.black,
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
                                    child:  TextFormField(
                                      validator: (value){
                                        if(value==null||value.isEmpty){
                                          return 'Please Enter your name';
                                        } return null;
                                      },
                                      controller: namecontroller,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        prefixIcon: Icon(Icons.person_2_outlined, color: Color(0xFF7f30fe),),
                                         hintText: "Enter your name", 
                                        hintStyle: TextStyle(fontSize: 15, 
                                        color: Colors.grey,
                                        fontWeight: FontWeight.normal,
                                        
                                        ),
                                      ),
                              
                                    ),
                                  ),
                                  const SizedBox(height: 5,),
                                  const Text("Email", style: TextStyle(color: Colors.black,
                                  fontStyle: FontStyle.normal,fontWeight: FontWeight.w500
                                  ),),
                                  const SizedBox(height: 5,),
                                  Container(
                                    
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.black38,
                                      ),
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    child:  TextFormField(
                                      validator: (value){
                                        if(value==null||value.isEmpty){
                                          return 'Please Enter your email';
                                        } return null;
                                      },
                                      controller: emailcontroller,
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
                                  const SizedBox(height: 10,),
                                  const Text("Password", style: TextStyle(color: Colors.black,
                                  fontStyle: FontStyle.normal,fontWeight: FontWeight.w500
                                  ),),
                                  const SizedBox(height: 8,),
                                  Container(
                                    
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.black38,
                                      ),
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    child:  TextFormField(
                                      validator: (value){
                                        if(value==null||value.isEmpty){
                                          return 'Please Enter your password';
                                        } return null;
                                      },
                                      controller: passwordcontroller,
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
                                      validator: (value){
                                        if(value==null||value.isEmpty){
                                          return 'Please Enter your confirm password';
                                        } return null;
                                      },
                                      controller: confirmPasswordcontroller,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        prefixIcon: Icon(Icons.password_outlined, 
                                        color: Color(0xFF7f30fe),
                                        ),
                                        hintText: "Confirm Password", 
                                        hintStyle: TextStyle(fontSize: 15, 
                                        color: Colors.grey,
                                        fontWeight: FontWeight.normal,
                                        
                                        ),
                                        
                                         
                                        
                                      ),
                                      obscureText: true,
                              
                                    ),
                                  ),
                                  
                                  const SizedBox(height: 10,),
                                    Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                         const Text(" Have an account?", style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w200,
                                          color: Colors.black,
                                          fontStyle: FontStyle.normal
                                         ),),
                                        const SizedBox(width: 5,),
                                        GestureDetector(
                                          onTap: ()=> const LoginScreen(),
                                          child: const Text("Login!",style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.blueAccent,
                                            fontStyle: FontStyle.normal
                                           ),),
                                        ),
                                                        
                                      ],
                                    ),
                                  // Due to the 222 pixel error  I have to reduce the sized widget but I    will change it if am using an andriod emulator
                                  
                                ],
                              ),
                            ),
                            
                              ),
                          ),

                        ),
                        const SizedBox(height: 10,),
                       Center(
                                  child: GestureDetector(
                                    onTap: (){
                                      if(_formkey.currentState!.validate()){
                                        setState(() {
                                          email=emailcontroller.text;
                                          name=namecontroller.text;
                                          password=passwordcontroller.text;
                                          confirmPassword=confirmPasswordcontroller.text;
                                        });
                                      } registration();
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                    
                                       margin: const EdgeInsets.symmetric(horizontal: 20.0),
                                      child: Material(
                                        elevation: 5.0,
                                        child: Container(
                                           
                                            padding: const EdgeInsets.all(10),
                                            decoration:  BoxDecoration(
                                              color: Colors.blueAccent,
                                              borderRadius: BorderRadius.circular(10)
                                            ),
                                            child: const Center(
                                              // This is a text widget but I will use it  as a botton 
                                              // I don't want to use a real button because its to easy to decorecte a text in a container
                                              child: Text( "Sign Up", 
                                              ),
                                            
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                

                    ],
                  ),
                )
         
          ],
        ),
      ),

    );
  }
}