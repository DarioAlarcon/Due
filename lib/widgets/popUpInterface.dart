import 'package:due/widgets/popUpMenu.dart';
import 'package:flutter/material.dart';

class interfacePopUp extends StatefulWidget {
  const interfacePopUp({
    super.key, required this.callback, 
  });
  final VoidCallback callback;
  @override
  State<interfacePopUp> createState() => _interfacePopUpState();
}

class _interfacePopUpState extends State<interfacePopUp> with WidgetsBindingObserver  {
  bool _isKeyboardVisible = false;
  double _bottomInset = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final keyboardHeight = WidgetsBinding.instance!.window.viewInsets.bottom;
    final isKeyboardVisible = keyboardHeight > 0;

    setState(() {
      widget.callback;
      _isKeyboardVisible = isKeyboardVisible;
      _bottomInset = keyboardHeight;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      child: Stack(
        children: [
          Positioned(
            right:  17,
            bottom: _isKeyboardVisible ? 270 : 79,
            child: popUpMenu(cb: widget.callback,),
          ),
        ],
      ),
    );
  }
}
