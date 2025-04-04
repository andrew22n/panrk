
// ignore_for_file: avoid_unnecessary_containers

import 'package:course_app/screens/widgets/coursesItems.dart';
import 'package:course_app/screens/widgets/itItems.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItScreeen extends StatefulWidget {
  const ItScreeen({super.key});

  @override
  State<ItScreeen> createState() => _ItScreeenState();
}

class _ItScreeenState extends State<ItScreeen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(

        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,

            pinned: true,
            title: getAppBar(),
          ),
        
          SliverToBoxAdapter(
            child: getSearch(),
          ),
      
            
    
            
          
          SliverList(delegate: getCourses(),)
          
        ],
        
        
      ),
    );
  }
   getAppBar(){
      return Container(
         
        child: const Positioned(
          right: 50,
          child:  Center(
            child: Column(
              children: [
                Row(
                  children: [
                    Center(
                      child: Text("CHOOSE YOUR FAVOURITE IT COURSES", style: TextStyle(color: Color.fromARGB(240, 0, 0, 0), fontWeight: FontWeight.w600
                      , fontSize: 24, ),),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      );
  }
  Widget getSearch(){
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 40,
              padding: const EdgeInsets.only(bottom: 3),
              decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset:  Offset(0, 0)
                    )
                  ]
              ),
              child:  const TextField(autocorrect: true,
              decoration: InputDecoration(prefixIcon: Icon(Icons.search,color: Colors.grey,)  ,
              border: InputBorder.none,
              hintText: "search",
              hintStyle: TextStyle( color: Colors.grey, fontSize: 17),
              ),
              ),
            ),
          ),
          const SizedBox(width: 10,),

          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.circular(15),
            ),
            child: SvgPicture.asset("assets/icons/tecnology.svg",color: Colors.white,),
          )
        ],
      ),
    );
  }
  int selectCategoryIndex = 0;
  getCourses(){
    return SliverChildBuilderDelegate(
      
      (context, index) {
      
        return Padding(
          padding: const EdgeInsets.only(top: 5,right: 15, left: 15),
          child:  CourseItem(data:itIems[index], onBookTap: () {
            itIems[index] = ! itIems[index];
          },
          
          ),
        );
    },
    childCount: itIems.length,
    );
  }
}