
import 'package:due/widgets/onboard_content.dart';
import 'package:flutter/material.dart';

class popUpMenu extends StatefulWidget {
  const popUpMenu({
    super.key,
  });

  @override
  State<popUpMenu> createState() => _popUpMenuState();
}

class _popUpMenuState extends State<popUpMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      decoration: BoxDecoration(
        color: Color(0xffBDF2F2),
        borderRadius: BorderRadius.all(Radius.circular(16))
      ),
      child: OnboardContent(),
    );
  }
}