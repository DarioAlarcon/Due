import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeudorTile extends StatelessWidget {
  const DeudorTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(16)),  
      color: Color(0xff262626),
      ),
      margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
      child: Center(
        child: ListTile(
          title: Text('Dario', style: TextStyle(color: Colors.white, fontSize: 22),),
          subtitle: Text('10000 \$', style: TextStyle(color: Colors.white70, fontSize: 15)),
          trailing: 
            Container(
              width: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      print('menos');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        shape: BoxShape.circle
                      ),
                      child: Icon(CupertinoIcons.chevron_down, color: Colors.black,)),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('mas');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent[100],
                        shape: BoxShape.circle
                      ),
                      child: Icon(CupertinoIcons.chevron_up, color: Colors.black,)),
                  ),
                ],
              ),
            )
          ,
        ),
      ),
    );
  }
}