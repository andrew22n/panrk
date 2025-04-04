
import 'package:course_app/screens/widgets/catergoryItems.dart';
import 'package:course_app/screens/widgets/courses.dart';
import 'package:course_app/screens/widgets/coursesItems.dart';
import 'package:course_app/screens/widgets/data.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: CustomScrollView(

        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,

            pinned: true,
            title: getAppBar(),
          ),
        
          SliverToBoxAdapter(
            
            child: getCategories(
              
            ), 
            
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
         
        child: const Row(
          children: [
            Text("Explore", style: TextStyle(color: Color.fromARGB(240, 0, 0, 0), fontWeight: FontWeight.w600
            , fontSize: 24, ),)
          ],
        ),
      );
  }
  
  int selectCategoryIndex = 0;
  Widget getCategories(){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const  EdgeInsets.only(left: 15, top: 10, bottom: 15),

      
      child: 
      Row(children:
       List.generate(categories.length, 
      (index) => CategoryItems(
        isActive:  selectCategoryIndex == index,
        data: categories[index], onTab: () { 
          setState(() {
            selectCategoryIndex = index;  
            
          });
         },))
             ,)
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
  getCourses(){
    return SliverChildBuilderDelegate(
      
      (context, index) {
      
        return Padding(
          padding: const EdgeInsets.only(top: 5,right: 15, left: 15),
          child:  CourseItem(data:courses[index], onBookTap: () {
            courses[index] = ! courses[index];
          },
          
          ),
        );
    },
    childCount: courses.length,
    );
  }
 
}