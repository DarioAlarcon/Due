import 'package:due/widgets/header.dart';
import 'package:due/widgets/popUpMenu.dart';
import 'package:due/widgets/popUpMenuAdd.dart';
import 'package:due/widgets/slivers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/onboard_content.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Header(),
          SliverFunction()
          //DeudorTile()
        ],
      ),
     floatingActionButton: FloatingActionButton(onPressed: (){
         showCupertinoModalPopup(
      context: context, 
      builder: (context){
        return Container(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                right: 17,
                bottom: 79,
                child: popUpMenu(),
              ),
            ],
          ),
        );
      }
    );
  
     },
     child: popUpAgregar(child: Icon(Icons.add, key: GlobalKey(),color: Color.fromARGB(255, 87, 87, 87),)),
     backgroundColor: Color(0xffBDF2F2),), 
    );
  }
}
