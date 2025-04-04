import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomBarItem extends StatelessWidget {
  const BottomBarItem({super.key, 
  required  this.icon,
  this.activeColor = Colors.pink,
  this.color = Colors.grey, this.isActive = false, 
  this.onTab});
  final String icon;
  final Color activeColor;
  final Color color;
  final bool isActive;
  final GestureTapCallback? onTab;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                if (isActive) 
                  const BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 0)
                  )
                ]
              ),
              child: SvgPicture.asset(icon,color: isActive? activeColor :Colors.grey,   ),),
    );
  }
}