import 'package:cached_network_image/cached_network_image.dart';
import 'package:course_app/screens/widgets/bookmark.dart';
import 'package:course_app/screens/widgets/courses.dart';
import 'package:flutter/material.dart';


class CourseItem extends StatelessWidget {
  const CourseItem({super.key, required this.data,this.onBookTap});
  final data;
  final GestureTapCallback? onBookTap;

  @override
  Widget build(BuildContext context) {
    return Container(
            margin: const  EdgeInsets.only( bottom: 5),
            padding: const EdgeInsets.all(10),
            width: 200,
            height: 290,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const  [
          
                BoxShadow(
                  color: Colors.white,
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(1, 1)
                )
              ]
              
            ),
            child: Stack(children: [
               Container(
            decoration: const BoxDecoration(
              color: Colors.white
            ),
            width: double.infinity,
            height: 200,
            child: CachedNetworkImage(
              imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(image: imageProvider, fit: BoxFit.cover)
                  ),
              ),
              imageUrl: courses[0]["image"],
            ),
               ),
               Positioned(
                top: 177,
                right: 15,
                child: BookMark(
                  onTap: onBookTap,
                  
                )),
               Positioned(
                top: 210,
                left: 15,
                child: Container(
                  
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    
                  children: [
                    Text(data["name"], style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500
                    ),),
                    const SizedBox(height: 5,),
                    Row(
                      
                      children: [
                      
                      getAtribute(Icons.sell_outlined,data["price"], Colors.grey),
                      const SizedBox(width: 10,),
                      getAtribute(Icons.timelapse_outlined,data["duration"], Colors.grey),
                      const SizedBox(width: 10,),
                      
                      getAtribute(Icons.play_circle_fill_rounded,courses[0]["lessons"], Colors.grey),
                    ],)
                  ],
                  
                               
                                 ),
                ),
               
               
               )


            ],),

          );
  }
   getAtribute(IconData icon ,String name, Color  color ){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(icon,color: color,),
                      const SizedBox(width: 7,),
                      Text(name, style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),)
                    ],
                  );
  }
}