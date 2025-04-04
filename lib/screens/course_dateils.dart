import 'package:cached_network_image/cached_network_image.dart';
import 'package:course_app/screens/deteilitems.dart';
import 'package:course_app/screens/widgets/bookmark.dart';
import 'package:course_app/screens/widgets/courses.dart';
import 'package:course_app/screens/widgets/data.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class Details extends StatefulWidget {
   const Details({super.key, required this.data});
  final data;


  @override
  State<Details> createState() => _DetailsState();
}


class _DetailsState extends State<Details> 
with SingleTickerProviderStateMixin{
  late TabController tabController;
  late var   courseData;
@override
void initState() {
  super.initState();
  tabController = TabController(length: 2, vsync: this);
  courseData = widget.data["courses"];
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: buildBody(),
      bottomNavigationBar: getFoot(),
      
    );
  }
  AppBar getAppBar(){
    return AppBar(
      title:  const Text("Detail", style: TextStyle(color:  Color.fromARGB(221, 49, 34, 34)),),
      iconTheme: const  IconThemeData(color: Colors.grey),
    );
    
  }
  Widget buildBody(
    
  ){
    return SingleChildScrollView(padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
      child: 
    Column(children: [
      Hero(
        tag: courseData["id"].toString()+courseData["image"],
        child: CachedNetworkImage(
                  imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(image: imageProvider, fit: BoxFit.cover)
                      ),
                  ),
                  imageUrl: courseData["image"],height: 200, width: double.infinity,
                ),
      ),
              const SizedBox(height: 20,),
              getInfo(),
              const Divider(),
              const SizedBox(height: 10,),
              getab(),
              getlessons(),
    ],),);
  }
  Widget getInfo(){
    return  Container(
      color: Colors.white,
      child: Column(
        
        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
         Text(courseData["name"]),
          Positioned(
            top: 180,
            right: 10,
            child: BookMark(
              onTap: (){
                
              },
            ),
          ),
          
        ],),
        const SizedBox(height: 10,),
       Row(
        
        children: [
          getAttribute(Icons.play_arrow_rounded, courseData["lessons"], Colors.black),
          const SizedBox(width: 10,),
          getAttribute(Icons.timelapse_outlined, courseData["duration"], Colors.black),
          const SizedBox(width: 10,),
          getAttribute(Icons.star, "4.5", Colors.yellowAccent),
        ],
       ),
        getlessons(),
      ],),
    );
  }
  Widget getAttribute(IconData icon, String info, Color color){
    return     Row(
            children: [
              Icon(icon, 
              size: 20,
              color: color,
              ),
              const SizedBox(width: 5,),
              Text(info, style: const TextStyle(color: Colors.grey),)
            ],
          );
  }
  Widget getab(){
    return Container(child: TabBar(
      controller: tabController,
      tabs: const [
      Tab(
        child: Text("Lessons", style: TextStyle(fontSize: 14.0, color: Colors.grey),),
      ),
       Tab(
        child: Text("Excercises",style: TextStyle(fontSize: 14.0, color: Colors.grey)),
      )
    ],),);

  }
  Widget  lessonPage(){
    return ListView.builder(
      itemCount: lessons.length,
      itemBuilder: (context, index) => DetailItems(data: courses[index])
       
    );
  }
  Widget getlessons(){
    return Container(
      width: double.infinity,
      height: 200,
      child: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: [
        lessonPage(),
        Container(child: const Center(child: Text("Excercises")),),
      ],),
        
      
    );
  }
  Widget getFoot(){
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
      height: 80,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey,
          spreadRadius: 1,
          blurRadius: 1,
          offset: Offset(0, 0)
          ),
          
        ]
      ),
      child:  Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const Text("Price",  style: TextStyle(
            fontWeight: FontWeight.w500, 
             fontSize: 14,
              color: Colors.grey),),
              const SizedBox(height: 3,),
          Text(courseData["price"], 
          style: const TextStyle(fontWeight: FontWeight.w600, 
           fontSize: 19, 
           color: Colors.grey),)
        ],),
        const SizedBox(width: 30,),
        Expanded(
          child: Container(
               width: MediaQuery.of(context).size.width,
                                      
               margin: const EdgeInsets.symmetric(horizontal: 20.0),
               child: GestureDetector(
                onTap: (){
                  
                },
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
                                                  child: Text( "Buy Now", 
                                                  ),
                                                
                                              ),
                                            ),
                                          ),
               ),
                                      ),
        ),
      ],),
    );
  }
}