
import 'package:flutter/material.dart';
import 'package:towtruck_app/utils/dimensions.dart';



Widget optionComponent({
  String? title,
  IconData? icon,
  VoidCallback? onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 40 * 2,
      width: 20 * 4,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 88, 88, 88),
        borderRadius: BorderRadius.circular(Dimensions.radius20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon!,
            color: Colors.amber,
            size: Dimensions.iconSize24 * 1.2,
          ),
          Text(title!,style:TextStyle(
                                     color: Color.fromARGB(255, 244, 241, 241),
                                     fontWeight: FontWeight.normal,
                                     fontSize: 10,
                                     decoration: TextDecoration.none
                                    ))
        ],
      ),
    ),
  );
}
