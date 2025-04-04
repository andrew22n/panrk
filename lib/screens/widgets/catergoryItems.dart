import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoryItems extends StatelessWidget {
  const  CategoryItems({super.key, required this.data,  this.onTab,this.active = Colors.black, this.activecolor = Colors.pink, this.bgColor = Colors.white,this.isActive = false});
  final dynamic data;
  final Color activecolor;
  final bool isActive;
  final Color bgColor;
  final Color active;
  final GestureTapCallback? onTab;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: AnimatedContainer(
        duration:const  Duration(microseconds: 500),
        curve: Curves.fastOutSlowIn,
        margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isActive? activecolor: bgColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                 BoxShadow(color: Colors.grey,
                spreadRadius: 5,
                blurRadius: 5,
                offset: Offset(0, 0)
                )
              ]
            ),
            child: Row(
              
              children: [
                SvgPicture.asset(
                  data["icon"],
                  color: isActive? Colors.white: active,
                  width: 16, 
                  height: 16,
                  ),
                const SizedBox(width: 5,),
                 Text(data["name"],  
                 style: TextStyle(color: isActive? Colors.white: active,),)
              ],
            ),
          ),
    )
 ;
  }
}