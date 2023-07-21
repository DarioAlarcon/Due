
import 'package:due/widgets/onboard_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class popUpMenu extends StatefulWidget {
  const popUpMenu({
    super.key, required this.cb,
  });
final VoidCallback cb;
  @override
  State<popUpMenu> createState() => _popUpMenuState();
}

class _popUpMenuState extends State<popUpMenu> with SingleTickerProviderStateMixin {
  
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, 
        duration: Duration(milliseconds: 200)
    );
    _animation = Tween<double>(begin: 0.0, end:1.0)
                 .animate(CurvedAnimation(
                    parent: _animationController, 
                    curve: Curves.easeOutQuad)
                  );
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _animationController.forward();
    });
  }
  
  void cambio(){
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{  
        _closePopUp("");
        return false;
      },
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: _animation.value,
            alignment: Alignment.bottomRight,
            child: child,
          );
        },
        child: Container(
          width: 230,
          decoration: BoxDecoration(
            color: Color(0xffBDF2F2),
            borderRadius: BorderRadius.all(Radius.circular(16))
          ),
          child: Column(
            children: [
              OnboardContent( callback: widget.cb, changedot: cambio,),
              GestureDetector(
                onDoubleTap: (){
                  cambio();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      width: 20,
                      height: 5,
                      decoration: BoxDecoration(
                      color: Provider.of<PageshowModel>(context, listen: false).currentPage == 0? Colors.black:Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      width: 20,
                      height: 5,
                      decoration: BoxDecoration(
                      color: Provider.of<PageshowModel>(context, listen: false).currentPage == 1? Colors.black:Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 15,)
            ],
          ),
        ),
      ),
    );
  }
  
  void _closePopUp(String action) {
    _animationController.reverse().whenComplete(() {
      Navigator.of(context).pop();
    });
  }
}

