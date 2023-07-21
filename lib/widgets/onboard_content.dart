import 'package:due/contents/addProduct_content.dart';
import 'package:due/contents/AddClient_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardContent extends StatefulWidget {
  const OnboardContent({super.key, required this.callback, required this.changedot});
final VoidCallback callback;
final VoidCallback changedot;
  @override
  State<OnboardContent> createState() => _OnboardContentState();
}

class _OnboardContentState extends State<OnboardContent> {
   PageController _pageController= PageController();
  // double _progress;
  @override
  void initState() {
    _pageController 
      ..addListener(() {
        setState(() {
            Provider.of<PageshowModel>(context, listen: false).currentPage = _pageController.page!;
     print(_pageController.page);
        });
      });
    widget.changedot;
    super.initState();
  }

   @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double progress =
        _pageController.hasClients ? (_pageController.page ?? 0) : 0;

    return SizedBox(
      height: 230 + progress * 70,
      width: double.maxFinite,
      child: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 16),
              Expanded(
                child: GestureDetector(
                  child: PageView(
                    onPageChanged: (index){
                      widget.changedot;
                    },
                    controller: _pageController,
                    children:  [
                      AddClient_content( callback: widget.callback,),
                      Addproduct_content(callback: widget.callback,),
                    ],
                  ),
                ),
              ),
            ],
          ),
          
        ],
      ),
    );
  }
}
class PageshowModel with ChangeNotifier{

  double _currentPage = 0;
  Color _colorPrimario = Colors.amberAccent;
  Color _colorSecundario = Colors.grey;

  double get currentPage => this._currentPage;
  set currentPage(double pagina){
    this._currentPage = pagina;
    notifyListeners();
  }

  Color get ColorPrimario => this._colorPrimario;
  set ColorPrimario(Color color){
    this._colorPrimario = color;
    
  }

  Color get Colorsecundario => this._colorSecundario;
  set Colorsecundario(Color color){
    this._colorSecundario = color;
  }}