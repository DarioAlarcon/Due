import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 230,
      decoration: BoxDecoration(
        color: Color(0xffBDF2F2),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(34), bottomRight: Radius.circular(34))
      ),
    );
  }
}
//0xff262626