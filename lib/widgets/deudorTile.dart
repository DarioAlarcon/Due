import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeudorTile extends StatelessWidget {
  const DeudorTile({super.key, required this.expanded, required this.name, required this.mount, required this.toggleContainer, });
  final bool expanded;
  final String name;
  final double mount;
  final VoidCallback toggleContainer;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      height: 70,
      width: double.infinity,
      constraints:  BoxConstraints(
                      maxWidth: 450.0, // Establece el ancho máximo
                    ),
      decoration: BoxDecoration(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16), bottomLeft: expanded?Radius.circular(0):Radius.circular(16), bottomRight: expanded?Radius.circular(0):Radius.circular(16)),  
      color: Color(0xff262626),
      ),
      margin: EdgeInsets.only(top: 15, left: 20, right: 20),
      child: Center(
        child: ListTile(
          title: Text(name, style: TextStyle(color: Colors.white, fontSize: 22),),
          subtitle: Text('$mount \$', style: TextStyle(color: Colors.white70, fontSize: 15)),
          trailing: 
            Container(
              width: 27,
              child: GestureDetector(
                onTap: toggleContainer,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent[100],
                    shape: BoxShape.circle
                  ),
                  child:expanded? Icon(Icons.clear, color: Colors.black,) :Icon(Icons.more_vert, color: Colors.black,)),
              ),
            )
          ,
        ),
      ),
    );
  }
}