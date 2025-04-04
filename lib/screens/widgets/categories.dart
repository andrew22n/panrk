import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.data});
 final data;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(1, 1)
                    )
                  ]
                ),
                child: SvgPicture.asset(data["icon"], width: 20,height: 20,),
              ),
              const SizedBox(height: 10,),
              Text(data["name"],maxLines: 1,overflow: TextOverflow.fade,
              style: const TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.w500,

              )
              ,)
      ],

    )
;
  }
}