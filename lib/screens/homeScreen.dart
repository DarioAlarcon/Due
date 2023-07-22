import 'package:due/widgets/header.dart';
import 'package:due/widgets/popUpMenuAdd.dart';
import 'package:due/widgets/slivers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/popUpInterface.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void cambiarEstado(){
    setState(() {
      
    });
  }
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
        return interfacePopUp(callback: cambiarEstado,);
      }
    );
    
     },
     child: popUpAgregar(child: Icon(Icons.add, key: GlobalKey(),color: Color.fromARGB(255, 87, 87, 87),)),
     backgroundColor: Color(0xffBDF2F2),), 
    );
  }
}
