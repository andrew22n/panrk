

// ignore_for_file: avoid_print



import 'package:carousel_slider/carousel_slider.dart';
import 'package:course_app/screens/course_dateils.dart';
import 'package:course_app/screens/featured.dart';
import 'package:course_app/screens/recommended.dart';
import 'package:course_app/screens/seeall.dart';
import 'package:course_app/screens/widgets/categories.dart';
import 'package:course_app/screens/widgets/data.dart';
import 'package:course_app/screens/widgets/featured_items.dart';
import 'package:course_app/screens/widgets/notification_screen.dart';
import 'package:course_app/screens/widgets/recommmended_items.dart';
import 'package:flutter/material.dart';

class HomePersonal extends StatefulWidget {
  const HomePersonal({super.key});

  @override
  State<HomePersonal> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomePersonal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      appBar: getAppBar(),
    );
  }
  AppBar getAppBar(){
    return AppBar(
      elevation: 0,
      title: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          
          
          children:
           [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
             [
            Text("Panrk",
             style: 
             TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.w100,
              fontSize: 14,
              ),
            ),
            SizedBox(height: 5,),
            Text("Greetings",
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
              fontSize: 18),),
          ],),
          NotificationScreen()
          
        ],
      ),
      ),
    );
    
  }
  Widget buildBody(){
    return  SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        getCategories(),
        const Padding(padding: EdgeInsets.fromLTRB(15, 5,15, 10),
        child: Text(
          "Featured", style: TextStyle(color: Colors.blueGrey
          , fontWeight: FontWeight.w600,
          fontSize: 20,

          ),
        ),
        ),
        getFeatured(),
         Padding(padding: const EdgeInsets.fromLTRB(15, 25,15, 30),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const   Text(
              "Recommended", style: TextStyle(color: Colors.blueGrey
              , fontWeight: FontWeight.w600,
              fontSize: 20,
              )),
              GestureDetector(
                onTap: () =>  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const SeeAll())),

                child: const Text(
                "See All", style: TextStyle(color: Colors.blue
                , fontWeight: FontWeight.w200,
                fontSize: 14,
                )),
              ),
          ],
        )),
          getRecommended(),

      ],),
    );


  }
  Widget getRecommended(){
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 15),
      scrollDirection: Axis.horizontal,
      child: Row(

        children: List.generate(recommended.length, (index) => Container(
          margin: const EdgeInsets.only(right: 15, bottom: 5),
          child: RecommendedItem(data: recommended[index],
          onTab:(){
            print(index);
          }
          ),
        ))

          
        
      ),);
  }

  
  Widget getFeatured(){
    return CarouselSlider(  
      // carouseel slider need to be put in the package dev 

      options:
        CarouselOptions(
        height: 290, 
        enlargeCenterPage: true,
         disableCenter: true),
    items: 
      List.generate(
        features.length,
       (index) =>
       FeaturedItems(
        data: features[index],onTab: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  Details(data: { "courses":features[index]},)));
        },))

    
);

  }
 
  Widget getCategories(){
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: 
          List.generate(categories.length, (index) =>  Padding(
            padding:  const EdgeInsets.only(right:10),
            child: CategoriesScreen(data: 
              categories [index]
            ,),
          ))
        
      ),
    );
  }
  
}