import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

class DetailItems extends StatelessWidget {
  const DetailItems({super.key, required this.data});
  final data;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 138, 138, 138),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(1, 1),
          )
        ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CachedNetworkImage(
                  imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(image: imageProvider, fit: BoxFit.cover)
                      ),
                  ),
                  imageUrl: data["images"],height: 70, width:70,
                  
                ),
                const SizedBox(width: 10,),
                 Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data["name"], style: TextStyle(
                        color: Colors.grey,
                      fontSize: 14,
                       fontWeight: FontWeight.w500),),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Icon(Icons.schedule_outlined, color: Colors.grey,size: 14,),
                          SizedBox(width: 5,),
                          Text(data["duration"], 
                          style: TextStyle(color: Colors.grey,fontSize: 13,),),
                        ],
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.arrow_forward_ios_outlined, color: Colors.black38, size: 15,),
      
          ],
        ),
      );
  }
}