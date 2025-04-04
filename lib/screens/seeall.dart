import 'package:course_app/screens/widgets/catergoryItems.dart';
import 'package:course_app/screens/widgets/courses.dart';
import 'package:course_app/screens/widgets/coursesItems.dart';
import 'package:course_app/screens/widgets/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SeeAll extends StatefulWidget {
  const SeeAll({super.key});

  @override
  State<SeeAll> createState() => _SeeAllState();
}

class _SeeAllState extends State<SeeAll> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
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
          SliverToBoxAdapter(
            
            child: getCategories(
              
            ),
            
          ),
          SliverList(delegate: getCourses(),)
          
        ],
        
        
      ),
    );
  }
   getAppBar(){
      return Container(
        decoration:  const  BoxDecoration(color: Colors.white10),
         
        child:   const Center(
          child:  Column(
            children: [
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Choose Your Course", 
                  style: TextStyle(
                    color: Color.fromARGB(239, 7, 5, 117),
                   fontWeight: FontWeight.w600,  
                   fontStyle: FontStyle.italic
                  , fontSize: 24, ),)
                ],
              ),
              
             
            ],
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
            height: 40,
            width: 40,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.circular(15),
            ),
            // ignore: deprecated_member_use
            child: SvgPicture.asset("assets/icons/menu-navigation-grid-1529-svgrepo-com.svg",color: Colors.white,),
          )
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
      IndexedStack(
        children:[ Row(children:
         List.generate(categories.length, 
        (index) => CategoryItems(
          isActive:  selectCategoryIndex == index,
          data: categories[index], onTab: () { 
            setState(() {
              selectCategoryIndex = index;  
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> categories[index]["page"]));
              
            });
           },))
               ,),]
      )
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