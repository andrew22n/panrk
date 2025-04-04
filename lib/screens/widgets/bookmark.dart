import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BookMark extends StatelessWidget {
  const BookMark({super.key, this.onTap, this.isBookedMark  = false});
  final GestureTapCallback? onTap;
  final bool isBookedMark;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
                  height: 20,
                  width: 20,
                  decoration:  BoxDecoration(
                     color: isBookedMark? Colors.pink: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: .5,
                        blurRadius: .5,
                        offset: Offset(1, 1)
      
                      )
                    ]
                  ),
                  child: 
                 
      
        
                    
                    SvgPicture.asset(
                      "assets/icons/shopping-cart-svgrepo-com (2).svg",
                       width: 22,height: 22,
                       color: isBookedMark? Colors.white: Colors.pink
                       )),
    );
  }
}