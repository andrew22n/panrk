import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FeaturedItems extends StatelessWidget {
  const FeaturedItems({super.key, required this.data, this.onTab});
  final data;
  final GestureCancelCallback? onTab;

  @override
  Widget build(BuildContext context) {
    return 
    GestureDetector(
      onTap: onTab,
      child: Container(
      width: 270,
      height: 290,
      padding:  const EdgeInsets.all(10),
      
      margin: const EdgeInsets.only(bottom: 5, top: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(1, 1)
      
          )
        ]
      ),
      child: Stack(
        children: [
          Hero(
            tag: data["id"].toString()+data["image"],
            child: Container(
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
                imageUrl: data["image"],
              ),
            ),
          ),
          Positioned(
            top:190,
            right: 15,
            
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 211, 43, 43),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(data["price"], style: const TextStyle(color: Colors.white),),
            ),
            ),
            Positioned(
            top:210,
            
            child: Container(
              width: 270,
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  Text(data["name"], 
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Color.fromARGB(190, 0, 0, 0),
                   fontSize: 17,fontWeight: 
                   FontWeight.w600),
                  ),
                  const SizedBox(height: 4,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    getAttribute(data["lessons"],Icons.play_circle_fill_rounded),
                    const SizedBox(
                      width: 10,
                      ),
                    getAttribute(data["duration"],Icons.schedule_rounded),
                      const SizedBox(
                        width: 10,),
              
                  
                    
              
                    ]
                   
                    
                  )
                   
                ],
              ),
            ),
            
            ),
             
      
        ],
      ),
      
      ),
    );
  }

   Widget   getAttribute(String info, IconData icon){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(icon, 
                  color: Colors.blueGrey,
                  
                  ),
                const   SizedBox(width: 3,),
                  Text(info, style: const TextStyle(fontSize: 13,),)
                ],
              );
  }
}