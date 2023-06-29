
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class popUpAgregar extends StatefulWidget {
  final Widget child;
  popUpAgregar({Key? key, required this.child}): assert(child.key!=null), super(key: key);

  @override
  State<popUpAgregar> createState() => _PopUpAumentoState();
}

class _PopUpAumentoState extends State<popUpAgregar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: widget.child,
    );
  }
}